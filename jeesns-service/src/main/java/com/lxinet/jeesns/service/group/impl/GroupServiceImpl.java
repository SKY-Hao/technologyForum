package com.lxinet.jeesns.service.group.impl;

import com.lxinet.jeesns.common.utils.ActionLogType;
import com.lxinet.jeesns.core.dto.ResponseModel;
import com.lxinet.jeesns.core.model.Page;
import com.lxinet.jeesns.core.utils.*;
import com.lxinet.jeesns.model.group.Group;
import com.lxinet.jeesns.model.group.GroupTopic;
import com.lxinet.jeesns.model.member.Member;
import com.lxinet.jeesns.service.group.IGroupService;
import com.lxinet.jeesns.dao.group.IGroupDao;
import com.lxinet.jeesns.service.group.IGroupFansService;
import com.lxinet.jeesns.service.member.IMemberService;
import com.lxinet.jeesns.service.member.IScoreDetailService;
import com.lxinet.jeesns.service.system.IActionLogService;
import com.lxinet.jeesns.service.system.IConfigService;
import com.lxinet.jeesns.common.utils.ActionUtil;
import com.lxinet.jeesns.common.utils.ConfigUtil;
import com.lxinet.jeesns.common.utils.ScoreRuleConsts;
import org.apache.commons.io.FileUtils;
import org.omg.CORBA.SystemException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * Created by zchuanzhao on 2016/12/23.
 */
@Service("groupService")
public class GroupServiceImpl implements IGroupService {
    @Resource
    private IGroupDao groupDao;
    @Resource
    private IGroupFansService groupFansService;
    @Resource
    private IMemberService memberService;
    @Resource
    private IConfigService configService;
    @Resource
    private IActionLogService actionLogService;
    @Resource
    private IScoreDetailService scoreDetailService;

    /**
     * 前台群组列表页面
     * @param status
     * @param page
     * @param key
     * @return
     */
    @Override
    public ResponseModel listByPage(int status, Page page, String key) {
        if (StringUtils.isNotBlank(key)){
            key = "%"+key.trim()+"%";
        }
        List<Group> list = groupDao.listByPage(page, status,key);
        ResponseModel model = new ResponseModel(0,page);
        model.setData(list);
        return model;
    }

    /**
     * 主页index下的群组列表
     * @param status
     * @param num
     * @param sort
     * @return
     */
    @Override
    public List<Group> listByCustom(int status, int num, String sort) {
        return groupDao.listByCustom(status,num,sort);
    }


    /**
     * 关注、取消关注群组
     * @param loginMember
     * @param groupId
     * @param type 0关注，1取消关注
     * @return
     */
    @Override
    public ResponseModel follow(Member loginMember, Integer groupId, int type) {
        Group group = this.findById(groupId);
        if(group == null){
            return new ResponseModel(-1,"群组不存在");
        }
        if(type == 0){
            return groupFansService.save(loginMember,groupId);
        }else {
            //创建者无法取消关注
            if(loginMember.getId().intValue() == group.getCreator().intValue()){
                return new ResponseModel(-1,"管理员不能取消关注");
            }
            return groupFansService.delete(loginMember,groupId);
        }

    }

    //修改状态
    @Override
    public ResponseModel changeStatus(int id) {
        if(groupDao.changeStatus(id) == 1){
            return new ResponseModel(1,"操作成功");
        }
        return new ResponseModel(-1,"操作失败");
    }



    /**
     * 根据群组的ID查询群组的信息
     * @param id
     * @return
     */
    @Override
    public Group findById(int id) {
        return groupDao.findById(id);
    }

    /**
     * 申请群组保存
     * @param loginMember
     * @param group
     * @return
     */
    @Override
    @Transactional
    public ResponseModel save(Member loginMember,Group group) {
        Map<String,String> config = configService.getConfigToMap();
        group.setCreator(loginMember.getId());
        if(loginMember.getIsAdmin() > 0){
            group.setStatus(1);
        }else {
            if("0".equals(config.get(ConfigUtil.GROUP_APPLY))){
                return new ResponseModel(-1,"群组申请功能已关闭");
            }
            if("0".equals(config.get(ConfigUtil.GROUP_APPLY_REVIEW))){
                group.setStatus(0);
            }else {
                group.setStatus(1);
            }
        }
        //默认图标
        if(StringUtils.isEmpty(group.getLogo())){
            group.setLogo(Const.DEFAULT_IMG_URL);
        }
        //设置管理员
        String managerIds = String.valueOf(loginMember.getId());
        group.setManagers(managerIds);
        group.setCanPost(1);
        group.setTopicReview(0);
        if(groupDao.save(group) == 1){
            //创建者默认关注群组
            groupFansService.save(loginMember,group.getId());
            //申请群组奖励、扣款
            scoreDetailService.scoreBonus(loginMember.getId(), ScoreRuleConsts.APPLY_GROUP, group.getId());

            return new ResponseModel(1,"申请成功，请等待审核");
        }
        return new ResponseModel(-1,"操作失败，请重试");
    }




    /**
     * 前台修改 群组 保存
     * @param loginMember
     * @param group
     * @return
     */
    @Override
    public ResponseModel update(Member loginMember, Group group) {
        Group findGroup = this.findById(group.getId());
        if(findGroup == null){
            return new ResponseModel(-1,"群组不存在");
        }
        if(loginMember.getId().intValue() != findGroup.getCreator().intValue()){
            return new ResponseModel(-1,"没有权限");
        }

        //设置管理员
        String managerNames = group.getManagers();
        String managerIds = "";
        String[] names = managerNames.split(",");
        if(names.length > 10){
            return new ResponseModel(-1,"管理员不能超过10个");
        }
        for (String name : names){
            Member member = memberService.findByName(name.trim());
            if(member != null){
                managerIds += member.getId() + ",";
            }
        }
        if(managerIds.length() > 0){
            managerIds = managerIds.substring(0,managerIds.length()-1);
        }
        if(StringUtils.isNotEmpty(group.getLogo())){
            findGroup.setLogo(group.getLogo());
        }
        findGroup.setManagers(managerIds);
        findGroup.setName(group.getName());
        findGroup.setTags(group.getTags());
        findGroup.setCanPost(group.getCanPost());
        findGroup.setTopicReview(group.getTopicReview());
        findGroup.setIntroduce(group.getIntroduce());
        if(groupDao.update(findGroup) == 1){
            return new ResponseModel(1,"操作成功");
        }

        return new ResponseModel(-1,"操作失败，请重试");
    }

    /**
     * 删除群组
     * @param loginMember
     * @param id
     * @return
     */
    @Override
    public ResponseModel delete(Member loginMember, int id) {
        Group group = this.findById(id);
        if(group == null){
            return new ResponseModel(-1,"群组不存在");
        }
       /* if(loginMember.getIsAdmin() >2 && loginMember.getId().intValue() != group.getCreator().intValue()){
            return new ResponseModel(-1,"没有权限");
        }*/
        if(groupDao.delete(id) == 1){
            actionLogService.save(loginMember.getCurrLoginIp(),loginMember.getId(), ActionUtil.DELETE_GROUP,"ID："+group.getId()+"，名字："+group.getName());
            return new ResponseModel(1,"删除成功");
        }
        return new ResponseModel(-1,"删除失败");
    }


    /**
     * 后台   添加帖子时的群组列表
     * 2017年12月18日14:45:30
     *
     * @return
     */
    @Override
    public List<GroupTopic> list() {
        return groupDao.list();
    }

    @Override
    public List<Group> groupList() {
        return groupDao.groupList();
    }


    /**
     * 后台群组添加
     * @param loginMember
     * @param group
     * @return
     */
    @Override
    public ResponseModel saveManageGroup(Member loginMember, Group group,String logoPath,MultipartFile attach) throws Exception {

            Map<String,String> config = configService.getConfigToMap();
            group.setCreator(loginMember.getId());
            if(loginMember.getIsAdmin() > 0){
                group.setStatus(1);
            }else {
                if("0".equals(config.get(ConfigUtil.GROUP_APPLY))){
                    return new ResponseModel(-1,"群组申请功能已关闭");
                }
                if("0".equals(config.get(ConfigUtil.GROUP_APPLY_REVIEW))){
                    group.setStatus(0);
                }else {
                    group.setStatus(1);
                }
            }
            //默认图标
            if(StringUtils.isEmpty(group.getLogo())){
                group.setLogo(Const.DEFAULT_IMG_URL);
            }
            //设置管理员
            String managerIds = String.valueOf(loginMember.getId());
            group.setManagers(managerIds);
            group.setCanPost(1);
            group.setTopicReview(0);
            group = uploadPic(group,attach,logoPath);
            if(groupDao.save(group) == 1){
                //创建者默认关注群组
                groupFansService.save(loginMember,group.getId());
                //申请群组奖励、扣款
                scoreDetailService.scoreBonus(loginMember.getId(), ScoreRuleConsts.APPLY_GROUP, group.getId());
                return new ResponseModel(3,"申请成功，请等待审核");
            }
        return new ResponseModel(-1,"操作失败，请重试");
    }

    /**
     * 后台主题修改保存
     * @param loginMember
     * @param group
     * @return
     * @throws Exception
     */
    @Override
    public ResponseModel editGroupSave(Member loginMember, Group group) {

        Group findGroup = this.findById(group.getId());


        if(loginMember.getIsAdmin() >=1){
            System.out.println("tttt++==="+group.getLogo());
            System.out.println("ttttt2222==="+findGroup.getLogo());
            findGroup.setName(group.getName());
            findGroup.setTags(group.getTags());
            findGroup.setIntroduce(group.getIntroduce());
            findGroup.setStatus(group.getStatus());

            if(groupDao.update(findGroup) == 1){

                return new ResponseModel(3,"修改成功");
             }
        }else {
            return new ResponseModel(-1,"没有权限");
        }

        return new ResponseModel(-1,"操作失败，请重试");
    }




    private Group uploadPic(Group group, MultipartFile attach, String logoPath) throws Exception {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        String ymd = sdf.format(new Date());
        String path = "/upload/images/" + ymd + "/";

        logoPath = logoPath + path;
        System.out.println("logopath====="+logoPath);
        File filePath=new File(logoPath);
        if(!filePath.exists()){
            filePath.mkdirs();
        }

        String picNameOld = attach.getOriginalFilename();
        String picType = picNameOld.substring(picNameOld.lastIndexOf("."),picNameOld.length());
        String picNameNew = UUID.randomUUID() + picType;

        System.out.println("picNameOld===="+picNameOld);
        System.out.println("picType===="+picType);

        System.out.println("picNameNew===="+picNameNew);

        //最终文件名
        File realFile=new File(logoPath + File.separator + picNameNew);
        FileUtils.copyInputStreamToFile(attach.getInputStream(), realFile);


        System.out.println("realFile===="+realFile);

        group.setLogo(path+picNameNew);
        System.out.println("groupLOGO===="+group.getLogo());

        return group;
    }



}
