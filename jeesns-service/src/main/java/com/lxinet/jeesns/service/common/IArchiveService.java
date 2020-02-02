package com.lxinet.jeesns.service.common;

import com.lxinet.jeesns.core.model.Page;
import com.lxinet.jeesns.model.common.Archive;
import com.lxinet.jeesns.core.dto.ResponseModel;
import com.lxinet.jeesns.model.member.Member;


/**
 * Created by zchuanzhao on 2016/10/14.
 */
public interface IArchiveService {

    Archive findByArchiveId(int id);

    boolean save(Member member, Archive archive);

    boolean update(Member member, Archive archive);

    boolean delete(int id);

    /**
     * 更新阅读次数
     * @param id
     */
    void updateViewCount(int id);

    ResponseModel favor(Member loginMember, int archiveId);

    /**
     * 所有文档和帖子
     * @param status
     * @param page
     * @param key
     * @return
     */
    /*ResponseModel list(int status, Page page, String key);*/
}
