package com.lxinet.jeesns.model.common;

import java.io.Serializable;
import java.util.Date;

/**
 * 文档点赞（tbl_archive_favor）
 */
public class ArchiveFavor implements Serializable {
    private Integer id;
    private Date createTime;    //创建时间
    private Integer memberId;   //会员ID
    private Integer archiveId;  //文档ID

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getMemberId() {
        return memberId;
    }

    public void setMemberId(Integer memberId) {
        this.memberId = memberId;
    }

    public Integer getArchiveId() {
        return archiveId;
    }

    public void setArchiveId(Integer archiveId) {
        this.archiveId = archiveId;
    }
}
