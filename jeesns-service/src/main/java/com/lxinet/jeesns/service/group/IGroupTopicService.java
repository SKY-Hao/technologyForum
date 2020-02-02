package com.lxinet.jeesns.service.group;

import com.lxinet.jeesns.core.dto.ResponseModel;
import com.lxinet.jeesns.core.model.Page;
import com.lxinet.jeesns.model.group.GroupTopic;
import com.lxinet.jeesns.model.member.Member;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


/**
 * Created by zchuanzhao on 2016/12/26.
 */
public interface IGroupTopicService {
    GroupTopic findById(int id);
    //查询贴子详情
    GroupTopic findById(int id,Member loginMember);

    ResponseModel save(Member member, GroupTopic groupTopic);

    ResponseModel update(Member member, GroupTopic groupTopic);

    ResponseModel delete(Member loginMember,int id);

    ResponseModel indexDelete(HttpServletRequest request, Member loginMember, int id);

    /**
     * 获取群组帖子列表
     * @param page
     * @param key
     * @param groupId
     * @param status
     * @param memberId
     * @return
     */
    ResponseModel listByPage(Page page, String key, int groupId, int status, int memberId);

    ResponseModel audit(Member member,int id);

    ResponseModel top(Member member,int id,int top);

    ResponseModel essence(Member member,int id,int essence);

    ResponseModel favor(Member loginMember, int id);

    /**
     *  首页帖子（自定义条件查询）
     * @param gid 群组ID，0不限制
     * @param sort 排序字段
     * @param num 获取数量
     * @param day 天，获取多少天之内的数据，0不限制
     * @param thumbnail 缩略图 0不限制，1必须有缩略图
     * @return
     */
    List<GroupTopic> listByCustom(int gid, String sort, int num, int day, int thumbnail);

    //后台帖子列表
    ResponseModel listByTopicPage(Page page,String key);
    //修改后台帖子的审核状态
    ResponseModel changeTopicStatus(int id);

    /**
     * 后台   帖子发布保存
     * 2017年12月18日15:05:45
     * @param loginMember
     * @param groupTopic
     * @return
     */
    ResponseModel add(Member loginMember, GroupTopic groupTopic);

    /**
     * 首页所有帖子/文档
     * 2018年1月6日14:10:31
     * @param status
     * @param page
     * @param key
     * @return
     */
    ResponseModel groupTopicList(int status, Page page, String key);

    /**
     * 搜索帖子
     * 2018年1月6日14:10:35
     * @param status
     * @param page
     * @param key
     * @param memberId
     * @return
     */
    ResponseModel solrList(int status, Page page, String key, Integer memberId);

    /**
     * 后台删除帖子
     * @param request
     * @param loginMember
     * @param id
     * @return
     */
    ResponseModel deleteTopic(HttpServletRequest request, Member loginMember, int id);

    /**
     * 热门文帖子查询
     * @return
     */
    List<GroupTopic> byGroupStatus();

    List<GroupTopic> byGroupStatusList();

    ResponseModel solrWenTi(int status, Page page, String key);

    ResponseModel solrWenZhang(int status, Page page, String key);

}
