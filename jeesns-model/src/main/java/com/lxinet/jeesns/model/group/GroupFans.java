package com.lxinet.jeesns.model.group;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.lxinet.jeesns.model.member.Member;

import java.io.Serializable;
import java.util.Date;

/**
 * 群组粉丝表（tbl_group_fans）
 * 2017年12月6日15:07:06更新
 *
 */
public class GroupFans implements Serializable {
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;    //创建时间
    private Integer groupId;    //群组ID
    private Group group;        //群组集合
    private Integer memberId;   //会员ID（用户ID）
    private Member member;      //会员集合

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getGroupId() {
        return groupId;
    }

    public void setGroupId(Integer groupId) {
        this.groupId = groupId;
    }

    public Group getGroup() {
        return group;
    }

    public void setGroup(Group group) {
        this.group = group;
    }

    public Integer getMemberId() {
        return memberId;
    }

    public void setMemberId(Integer memberId) {
        this.memberId = memberId;
    }

    public Member getMember() {
        return member;
    }

    public void setMember(Member member) {
        this.member = member;
    }
}