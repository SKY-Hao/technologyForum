package com.lxinet.jeesns.dao.group;

import com.lxinet.jeesns.dao.common.IBaseDao;
import com.lxinet.jeesns.core.model.Page;
import com.lxinet.jeesns.model.cms.Article;
import com.lxinet.jeesns.model.group.GroupTopic;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by zchuanzhao on 16/12/26.
 */
public interface IGroupTopicDao extends IBaseDao<GroupTopic> {

    int save(GroupTopic groupTopic);

    List<GroupTopic> listByPage(@Param("page") Page page, @Param("key") String key, @Param("groupId") Integer groupId, @Param("status") Integer status, @Param("memberId") Integer memberId);

    int audit(@Param("id") Integer id);
    //查询贴子详情
    GroupTopic findById(@Param("id") Integer id,@Param("loginMemberId") Integer loginMemberId);

    /**
     * 置顶
     * @param top 0取消置顶，1置顶，2超级置顶
     * @return
     */
    int top(@Param("id") Integer id,@Param("top") Integer top);

    /**
     * 加精
     * @param essence 0取消加精，1加精
     * @return
     */
    int essence(@Param("id") Integer id,@Param("essence") Integer essence);

    /**
     * 首页帖子列表
     * (自定义条件查询)
     * @param gid 群组ID，0不限制
     * @param sort 排序字段
     * @param num 获取数量
     * @param day 天，获取多少天之内的数据，0不限制
     * @param thumbnail 缩略图 0不限制，1必须有缩略图
     * @return
     */
    List<GroupTopic> listByCustom(@Param("gid") int gid,@Param("sort") String sort,@Param("num") int num,@Param("day") int day,@Param("thumbnail") int thumbnail);

    /**
     * 后台帖子列表
     * 2017年12月18日09:58:37测试更新
     * @param page
     * @return
     */
    List<GroupTopic> listByTopicPage(@Param("page") Page page,@Param("key") String key);

    /**
     * 后台修改审核参数
     * @param id
     * @return
     */
    int changeTopicStatus(@Param("id") Integer id);

    /**
     * 首页所有帖子
     * 2018年1月6日14:10:53
     * @param page
     * @param key
     * @param status
     * @return
     */

    List<GroupTopic> groupTopicList(@Param("page") Page page, @Param("key") String key, @Param("status") Integer status);

    /**
     * 搜索帖子
     * 2018年1月6日11:58:06
     * @param status
     * @param page
     * @param key
     * @param memberId
     * @return
     */
    List<GroupTopic> solrList(@Param("status") int status, @Param("page") Page page,@Param("key")  String key, @Param("memberId")  Integer memberId);

    /**
     * 热门问题帖子查询
     * @return
     */
    List<GroupTopic> byGroupStatus();

    /**
     * 热门文章帖子查询
     * @return
     */
    List<GroupTopic> byGroupStatusList();

    List<GroupTopic> solrWenTi(@Param("page") Page page, @Param("key") String key, @Param("status") Integer status);
    List<GroupTopic> solrWenZhang(@Param("page") Page page, @Param("key") String key, @Param("status") Integer status);

}