package com.lxinet.jeesns.service.group.impl;

import com.lxinet.jeesns.common.utils.ActionLogType;
import com.lxinet.jeesns.common.utils.ActionUtil;
import com.lxinet.jeesns.common.utils.ConfigUtil;
import com.lxinet.jeesns.common.utils.ScoreRuleConsts;
import com.lxinet.jeesns.core.consts.AppTag;
import com.lxinet.jeesns.core.enums.MessageType;
import com.lxinet.jeesns.core.dto.ResponseModel;
import com.lxinet.jeesns.core.model.Page;
import com.lxinet.jeesns.core.utils.StringUtils;
import com.lxinet.jeesns.dao.group.IGroupTopicDao;
import com.lxinet.jeesns.model.cms.Article;
import com.lxinet.jeesns.model.common.Archive;
import com.lxinet.jeesns.model.group.Group;
import com.lxinet.jeesns.model.group.GroupTopic;
import com.lxinet.jeesns.model.member.Member;
import com.lxinet.jeesns.service.common.IArchiveService;
import com.lxinet.jeesns.service.group.IGroupFansService;
import com.lxinet.jeesns.service.group.IGroupService;
import com.lxinet.jeesns.service.group.IGroupTopicCommentService;
import com.lxinet.jeesns.service.group.IGroupTopicService;
import com.lxinet.jeesns.service.member.IMemberService;
import com.lxinet.jeesns.service.member.IMessageService;
import com.lxinet.jeesns.service.member.IScoreDetailService;
import com.lxinet.jeesns.service.system.IActionLogService;
import com.lxinet.jeesns.service.system.IConfigService;
import com.sun.org.apache.xpath.internal.SourceTree;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * Created by zchuanzhao on 2016/12/26.
 */
@Service("groupTopicService")
public class GroupTopicServiceImpl implements IGroupTopicService {
    @Resource
    private IGroupTopicDao groupTopicDao;
    @Resource
    private IGroupService groupService;
    @Resource
    private IGroupTopicCommentService groupTopicCommentService;
    @Resource
    private IGroupFansService groupFansService;
    @Resource
    private IArchiveService archiveService;
    @Resource
    private IActionLogService actionLogService;
    @Resource
    private IScoreDetailService scoreDetailService;
    @Resource
    private IMessageService messageService;
    @Resource
    private IMemberService memberService;

    @Resource
    private IConfigService configService;

    @Override
    public GroupTopic findById(int id) {
        return this.findById(id,null);
    }

    //查询贴子详情
    @Override
    public GroupTopic findById(int id,Member loginMember) {
        int loginMemberId = loginMember == null ? 0 : loginMember.getId();
        return this.atFormat(groupTopicDao.findById(id,loginMemberId));
    }

    @Override
    @Transactional
    public ResponseModel save(Member member, GroupTopic groupTopic) {
        if(groupTopic.getGroupId() == null || groupTopic.getGroupId() == 0){
            return new ResponseModel(-1,"群组不能为空");
        }
        Group group = groupService.findById(groupTopic.getGroupId());
        if(group == null){
            return new ResponseModel(-1,"群组不存在");
        }
        if(groupFansService.findByMemberAndGroup(group.getId(),member.getId()) == null){
            return new ResponseModel(-1,"必须关注该群组后才能发帖");
        }
        if(group.getCanPost() == 0){
            return new ResponseModel(-1,"群组已关闭发帖功能");
        }
        groupTopic.setMemberId(member.getId());
        Archive archive = new Archive();
        try {
            //复制属性值
            archive = archive.copy(groupTopic);
        } catch (Exception e) {
            e.printStackTrace();
        }
        archive.setPost_type(0);//1为文档   0主题
        //保存文档
        if(archiveService.save(member,archive)){
          /*
          //帖子审核判断
            if(member.getIsAdmin()<1){
                groupTopic.setStatus(0);
            }if (member.getIsAdmin()>=1){
                groupTopic.setStatus(1);
            }*/

            //保存文章

            //groupTopic.setStatus(group.getTopicReview()==1?0:1);

            groupTopic.setStatus(1);
            groupTopic.setArchiveId(archive.getArchiveId());

            int result = groupTopicDao.save(groupTopic);
            if(result == 1){
                //@会员处理并发送系统消息
                messageService.atDeal(member.getId(),groupTopic.getContent(), AppTag.GROUP, MessageType.GROUP_TOPIC_REFER,groupTopic.getId());
                //群组发帖奖励
               scoreDetailService.scoreBonus(member.getId(), ScoreRuleConsts.GROUP_POST, groupTopic.getId());
                actionLogService.save(member.getCurrLoginIp(),member.getId(), ActionUtil.POST_GROUP_TOPIC,"", ActionLogType.GROUP_TOPIC.getValue(),groupTopic.getId());
                if (groupTopic.getStatus() == 0){
                    //System.out.println("保存状态==="+groupTopic.getStatus());
                    //System.out.println("贴子ID==="+groupTopic.getId());
                   // System.out.println("保存文档ID==="+archive.getArchiveId());
                    return new ResponseModel(2,"帖子发布成功，请等待管理员审核通过","../detail/"+groupTopic.getGroupId());
                }
               // System.out.println("保存状态==="+groupTopic.getStatus());
               // System.out.println("贴子ID==="+groupTopic.getId());
               // System.out.println("保存文档ID==="+archive.getArchiveId());
                return new ResponseModel(2,"帖子发布成功","../topic/"+groupTopic.getId());
            }

        }
        return new ResponseModel(-1,"帖子发布失败");
    }

    /**
     * 获取群组帖子列表
     * @param page
     * @param key
     * @param groupId
     * @param status
     * @param memberId
     * @return
     */
    @Override
    public ResponseModel listByPage(Page page, String key, int groupId, int status, int memberId) {
        if (StringUtils.isNotBlank(key)){
            key = "%"+key+"%";
        }
        List<GroupTopic> list = groupTopicDao.listByPage(page, key,groupId,status,memberId);
        ResponseModel model = new ResponseModel(0,page);
        model.setData(list);
        return model;
    }

    /**
     * 保存修改 编辑过的帖子
     * @param member
     * @param groupTopic
     * @return
     */
    @Override
    @Transactional
    public ResponseModel update(Member member,GroupTopic groupTopic) {

        GroupTopic findGroupTopic = this.findById(groupTopic.getId(),member);


        if(findGroupTopic == null){
            return new ResponseModel(-2);
        }

        System.out.println("isadmin===="+member.getIsAdmin());


        if(member.getId().intValue() != findGroupTopic.getMember().getId().intValue() && member.getIsAdmin()>2){
            return new ResponseModel(-1,"没有权限");
        }

        //把查到文档id放到帖子表里面
        groupTopic.setArchiveId(findGroupTopic.getArchiveId());


        System.out.println("浏览次数GroupTopic"+groupTopic.getViewCount());
        System.out.println("浏览次数"+findGroupTopic.getViewCount());

        if(groupTopic.getViewCount()==null){
            groupTopic.setViewCount(findGroupTopic.getViewCount());
        }

        System.out.println("浏览次数二"+groupTopic.getViewCount());




        //把查到的查看次数放到帖子表里面
        //groupTopic.setViewCount(findGroupTopic.getViewCount());



        Archive archive = new Archive();
        try {
            //复制属性值
            archive = archive.copy(groupTopic);
        } catch (Exception e) {
            e.printStackTrace();
        }

        if(archiveService.update(member,archive)){

            //更新群组
            findGroupTopic.setGroupstatus(groupTopic.getGroupstatus());
            findGroupTopic.setGroupId(groupTopic.getGroupId());

            groupTopicDao.update(findGroupTopic);
            System.out.println("====修改帖子后的帖子所属群组ID===="+findGroupTopic.getGroupId());

            return new ResponseModel(0,"更新成功");
        }
        return new ResponseModel(-1,"更新失败");
    }

    //删除帖子
    @Override
    @Transactional
    public ResponseModel delete(Member loginMember,int id) {
        GroupTopic groupTopic = this.findById(id);
        if(groupTopic == null){
            return new ResponseModel(-1,"帖子不存在");
        }

       // int result = groupTopicDao.delete(id);
       //if(result == 1){
            //扣除积分
            //scoreDetailService.scoreCancelBonus(loginMember.getId(),ScoreRuleConsts.GROUP_POST,id);
           groupTopicDao.delete(id);

            archiveService.delete(groupTopic.getArchiveId());
            groupTopicCommentService.deleteByTopic(id);

            actionLogService.save(loginMember.getCurrLoginIp(),loginMember.getId(), ActionUtil.DELETE_GROUP_TOPIC,"ID："+groupTopic.getId()+"，标题："+groupTopic.getTitle());
            return new ResponseModel(1,"删除成功");
        //}
        //return new ResponseModel(-1,"删除失败");
    }


    @Override
    @Transactional
    public ResponseModel indexDelete(HttpServletRequest request, Member loginMember, int id) {
        if(loginMember == null){
            return new ResponseModel(-1,"请先登录");
        }
        GroupTopic groupTopic = this.findById(id,loginMember);
        if (groupTopic == null){
            return new ResponseModel(-1,"帖子不存在");
        }
        Group group = groupService.findById(groupTopic.getGroup().getId());
        if(group == null){
            return new ResponseModel(-1,"出现异常");
        }
        String groupManagers = group.getManagers();
        String[] groupManagerArr = groupManagers.split(",");
        boolean isManager = false;
        for (String manager : groupManagerArr){
            if(loginMember.getId().intValue() == Integer.parseInt(manager)){
                isManager = true;
            }
        }
        //TODO
        // 2018年3月1日17:47:26

        if(loginMember.getId().intValue() != groupTopic.getMember().getId().intValue() && loginMember.getIsAdmin() < 2 ){
            return new ResponseModel(-1,"没有权限");
        }

        if(loginMember.getId().intValue() == groupTopic.getMember().getId().intValue() || loginMember.getIsAdmin() > 0 ||
                isManager || loginMember.getId().intValue() == group.getCreator().intValue()){
            ResponseModel responseModel = this.delete(loginMember,id);
            if(responseModel.getCode() > 0){
                responseModel.setCode(2);
                responseModel.setUrl(request.getContextPath() + "/group/detail/"+group.getId());
            }
            return responseModel;
        }
        return new ResponseModel(-1,"权限不足");
    }

    @Override
    public ResponseModel audit(Member member,int id) {
        if(member == null){
            return new ResponseModel(-1,"请先登录");
        }
        GroupTopic groupTopic = this.findById(id,member);
        if (groupTopic == null){
            return new ResponseModel(-1,"帖子不存在");
        }
        Group group = groupService.findById(groupTopic.getGroup().getId());
        if(group == null){
            return new ResponseModel(-1,"出现异常");
        }
        String groupManagers = group.getManagers();
        String[] groupManagerArr = groupManagers.split(",");
        boolean isManager = false;
        for (String manager : groupManagerArr){
            if(member.getId() == Integer.parseInt(manager)){
                isManager = true;
            }
        }
        if(member.getId().intValue() == groupTopic.getMember().getId().intValue() || member.getIsAdmin() > 0 ||
                isManager || member.getId().intValue() == group.getCreator().intValue()){
            if(groupTopicDao.audit(id) == 1){
                return new ResponseModel(1,"审核成功");
            }else {
                return new ResponseModel(-1,"审核失败");
            }
        }
        return new ResponseModel(-1,"权限不足");
    }

    @Override
    public ResponseModel top(Member member,int id, int top) {
        if(member == null){
            return new ResponseModel(-1,"请先登录");
        }
        GroupTopic groupTopic = this.findById(id,member);
        if (groupTopic == null){
            return new ResponseModel(-1,"帖子不存在");
        }
        Group group = groupService.findById(groupTopic.getGroup().getId());
        if(group == null){
            return new ResponseModel(-1,"出现异常");
        }
        String groupManagers = group.getManagers();
        String[] groupManagerArr = groupManagers.split(",");
        boolean isManager = false;
        for (String manager : groupManagerArr){
            if(member.getId() == Integer.parseInt(manager)){
                isManager = true;
            }
        }
        if(member.getId().intValue() == groupTopic.getMember().getId().intValue() || member.getIsAdmin() > 0 ||
                isManager || member.getId().intValue() == group.getCreator().intValue()){
            if(groupTopicDao.top(id,top) == 1){
                return new ResponseModel(1,"操作成功");
            }else {
                return new ResponseModel(-1,"操作失败");
            }
        }
        return new ResponseModel(-1,"权限不足");
    }

    /**
     * 将帖子设置精华
     * @param member
     * @param id
     * @param essence
     * @return
     */
    @Override
    public ResponseModel essence(Member member,int id, int essence) {
        if(member == null){
            return new ResponseModel(-1,"请先登录");
        }
        GroupTopic groupTopic = this.findById(id,member);
        if (groupTopic == null){
            return new ResponseModel(-1,"帖子不存在");
        }
        Group group = groupService.findById(groupTopic.getGroup().getId());
        if(group == null){
            return new ResponseModel(-1,"出现异常");
        }
        String groupManagers = group.getManagers();
        String[] groupManagerArr = groupManagers.split(",");
        boolean isManager = false;
        for (String manager : groupManagerArr){
            if(member.getId() == Integer.parseInt(manager)){
                isManager = true;
            }
        }
        if(member.getId().intValue() == groupTopic.getMember().getId().intValue() || member.getIsAdmin() > 0 ||
                isManager || member.getId().intValue() == group.getCreator().intValue()){
            if(groupTopicDao.essence(id,essence) == 1){
                return new ResponseModel(1,"操作成功");
            }else {
                return new ResponseModel(-1,"操作失败");
            }
        }
        return new ResponseModel(-1,"权限不足");
    }


    @Override
    public ResponseModel favor(Member loginMember, int id) {
        GroupTopic groupTopic = this.findById(id);
        if(groupTopic != null){
            ResponseModel responseModel = archiveService.favor(loginMember,groupTopic.getArchiveId());
            if(responseModel.getCode() == 0){
                //帖子收到喜欢
                scoreDetailService.scoreBonus(loginMember.getId(), ScoreRuleConsts.GROUP_TOPIC_RECEIVED_LIKE, id);
                //点赞之后发送系统信息
                messageService.diggDeal(loginMember.getId(),groupTopic.getMemberId(),AppTag.GROUP,MessageType.GROUP_TOPIC_LIKE,groupTopic.getId());
            }else if(responseModel.getCode() == 1){
                //帖子取消喜欢
                //扣除积分
                scoreDetailService.scoreCancelBonus(loginMember.getId(),ScoreRuleConsts.GROUP_TOPIC_RECEIVED_LIKE, id);
            }
            return responseModel;
        }
        return new ResponseModel(-1,"帖子不存在");
    }

    /**
     * 首页帖子列表
     * （自定义条件查询）
     * @param gid 群组ID，0不限制
     * @param sort 排序字段
     * @param num 获取数量
     * @param day 天，获取多少天之内的数据，0不限制
     * @param thumbnail 缩略图 0不限制，1必须有缩略图
     * @return
     */
    @Override
    public List<GroupTopic> listByCustom(int gid, String sort, int num, int day,int thumbnail) {
        return groupTopicDao.listByCustom(gid,sort,num,day,thumbnail);
    }

    public GroupTopic atFormat(GroupTopic groupTopic){
        groupTopic.setContent(memberService.atFormat(groupTopic.getContent()));
        return groupTopic;
    }


    /**
     * 后台帖子列表
     * @param page
     * @return
     */
    @Override
    public ResponseModel listByTopicPage(Page page,String key) {
        if (StringUtils.isNotBlank(key)){
            key = "%"+key+"%";
        }
        List<GroupTopic> list = groupTopicDao.listByTopicPage(page,key);
        ResponseModel model = new ResponseModel(0,page);
        model.setData(list);
        return model;
    }


    /**
     * 后台   修改审核状态
     * @param id
     * @return
     */
    @Override
    public ResponseModel changeTopicStatus(int id) {
        if(groupTopicDao.changeTopicStatus(id) == 1){
            return new ResponseModel(1,"操作成功");
        }
        return new ResponseModel(-1,"操作失败");
    }

    /**
     * 后台   帖子发布保存
     *2017年12月18日15:05:43
     * @param member
     * @param groupTopic
     * @return
     */
    @Override
    public ResponseModel add(Member member, GroupTopic groupTopic) {

        Map<String,String> config = configService.getConfigToMap();
        if(member.getIsAdmin() == 0 && "0".equals(config.get(ConfigUtil.CMS_POST))){
            return new ResponseModel(-1,"发帖功能已关闭");
        }
        if(groupTopic.getGroupId() == null || groupTopic.getGroupId() == 0){
            return new ResponseModel(-1,"群组不能为空");
        }
        groupTopic.setMemberId(member.getId());
        Archive archive = new Archive();
        try {
            //复制属性值
            archive = archive.copy(groupTopic);
        } catch (Exception e) {
            e.printStackTrace();
        }

        if(member.getIsAdmin() >=1 && "0".equals(config.get(ConfigUtil.CMS_POST_REVIEW))){
            groupTopic.setStatus(0);
        }else {
            groupTopic.setStatus(1);
        }
        archive.setPost_type(0);//0代表帖子  1代表文档
        //保存文档
        if(archiveService.save(member,archive)){
            //保存帖子
            groupTopic.setArchiveId(archive.getArchiveId());

            int result = groupTopicDao.save(groupTopic);

            if(result == 1){//保存成功之后
                //@会员处理并发送系统消息
                messageService.atDeal(member.getId(),groupTopic.getContent(), AppTag.CMS, MessageType.CMS_ARTICLE_REFER,groupTopic.getId());
                //保存动态表
                actionLogService.save(member.getCurrLoginIp(),member.getId(), ActionUtil.POST_ARTICLE,"", ActionLogType.ARTICLE.getValue(),groupTopic.getId());
               /* if (groupTopic.getStatus() == 0){
                    return new ResponseModel(0,"帖子发布成功，请等待审核");
                }*/
                return new ResponseModel(0,"帖子发布成功");
            }
        }
        return new ResponseModel(-1,"帖子发布失败");
    }

    /**
     * 首页所有帖子/文档
     *2018年1月5日09:01:18更新
     * @param status
     * @param page
     * @param key
     * @return
     */
    @Override
    public ResponseModel groupTopicList(int status, Page page, String key) {
        if (StringUtils.isNotBlank(key)){
            key = "%"+key+"%";
        }
        List<GroupTopic> list = groupTopicDao.groupTopicList(page, key,status);
        ResponseModel model = new ResponseModel(0,page);
        model.setData(list);
        return model;
    }

    /**
     * 搜索帖子
     *2018年1月6日14:10:46
     * @param status
     * @param page
     * @param key
     * @param memberId
     * @return
     */
    @Override
    public ResponseModel solrList(int status, Page page, String key, Integer memberId) {
        if (StringUtils.isNotBlank(key)){
            key = "%"+key+"%";
        }
        List<GroupTopic> list = groupTopicDao.solrList(status,page, key,memberId);
        ResponseModel model = new ResponseModel(0,page);
        model.setData(list);
        return model;
    }


    /**
     * 后台删除帖子
     *
     * @param request
     * @param loginMember
     * @param id
     * @return
     */
    @Override
    public ResponseModel deleteTopic(HttpServletRequest request, Member loginMember, int id) {
        if(loginMember == null){
            return new ResponseModel(-1,"请先登录");
        }
        GroupTopic groupTopic = this.findById(id,loginMember);
        if (groupTopic == null){
            return new ResponseModel(-1,"帖子不存在");
        }
        Group group = groupService.findById(groupTopic.getGroup().getId());
        if(group == null){
            return new ResponseModel(-1,"出现异常");
        }
        String groupManagers = group.getManagers();
        String[] groupManagerArr = groupManagers.split(",");
        boolean isManager = false;
        for (String manager : groupManagerArr){
            if(loginMember.getId().intValue() == Integer.parseInt(manager)){
                isManager = true;
            }
        }
        if(loginMember.getId().intValue() == groupTopic.getMember().getId().intValue() || loginMember.getIsAdmin() > 0 ||
                isManager || loginMember.getId().intValue() == group.getCreator().intValue()){
            ResponseModel responseModel = this.delete(loginMember,id);
            if(responseModel.getCode() > 0){
                responseModel.setCode(1);
               // responseModel.setUrl(request.getContextPath() + "/index");
            }
            return responseModel;
        }
        return new ResponseModel(-1,"权限不足");

    }


    /**
     * 热门问题帖子列表查询
     *
     * @return
     */
    @Override
    public List<GroupTopic> byGroupStatus() {
        return groupTopicDao.byGroupStatus();
    }

    /**
     * 热门文章帖子列表查询
     * @return
     */
    @Override
    public List<GroupTopic> byGroupStatusList() {
        return groupTopicDao.byGroupStatusList();
    }

    /**
     * 问题帖子列表
     * @param status
     * @param page
     * @param key
     * @return
     */
    @Override
    public ResponseModel solrWenTi(int status , Page page, String key) {
        if (StringUtils.isNotBlank(key)){
            key = "%"+key+"%";
        }
        List<GroupTopic> list = groupTopicDao.solrWenTi(page, key,status);
        ResponseModel model = new ResponseModel(0,page);
        model.setData(list);
        return model;
    }

    @Override
    public ResponseModel solrWenZhang(int status , Page page, String key) {
        if (StringUtils.isNotBlank(key)){
            key = "%"+key+"%";
        }
        List<GroupTopic> list = groupTopicDao.solrWenZhang(page, key,status);
        ResponseModel model = new ResponseModel(0,page);
        model.setData(list);
        return model;
    }

}
