package com.lxinet.jeesns.dao.common;

import com.lxinet.jeesns.core.model.Page;
import com.lxinet.jeesns.model.common.Archive;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 文章DAO接口
 * Created by zchuanzhao on 2016/9/26.
 */
public interface IArchiveDao extends IBaseDao<Archive> {

    Archive findByArchiveId(@Param("archiveId") Integer archiveId);

    /**
     * 更新阅读数
     * @param archiveId
     * @return
     */
    int updateViewCount(@Param("archiveId") int archiveId);

    int favor(@Param("archiveId") int archiveId, @Param("num") int num);

    /*List<Archive> list(@Param("page") Page page, @Param("key") String key, @Param("status") Integer status);*/
}