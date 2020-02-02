package com.lxinet.jeesns.dao.group;

import com.lxinet.jeesns.core.dto.ResponseModel;
import com.lxinet.jeesns.dao.common.IBaseDao;
import com.lxinet.jeesns.core.model.Page;
import com.lxinet.jeesns.model.group.Group;
import com.lxinet.jeesns.model.group.GroupTopic;
import org.apache.ibatis.annotations.Param;
import java.util.List;

/**
 * Created by zchuanzhao on 16/12/23.
 */
public interface IGroupDao extends IBaseDao<Group> {

    /**
     * 获取群组  （前台群组列表页面）
     * @return
     */
    List<Group> listByPage(@Param("page") Page page, @Param("status") Integer status, @Param("key") String key);

    /**
     * 修改状态
     * @param id
     * @return
     */
    Integer changeStatus(@Param("id") Integer id);

    /**
     * 主页index下的群群组列表
     * @param status
     * @param num
     * @param sort
     * @return
     */
    List<Group> listByCustom(@Param("status") int status, @Param("num") int num, @Param("sort") String sort);


    /**
     * 后台添加帖子时的群组列表
     * @return
     */
    List<GroupTopic> list();

    List<Group> groupList();

}