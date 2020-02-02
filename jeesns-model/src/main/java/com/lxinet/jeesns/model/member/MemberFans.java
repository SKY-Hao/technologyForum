package com.lxinet.jeesns.model.member;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by zchuanzhao on 17/2/15.
 */
public class MemberFans implements Serializable {

    private Integer id;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;    //创建时间

    private Integer followWho;  //被关注者

    private Member followWhoMember; //被关注者会员实体

    private Integer whoFollow;      //关注者

    private Member whoFollowMember; //关注者会员实体


    @Override
    public String toString() {
        return "MemberFans{" +
                "id=" + id +
                ", createTime=" + createTime +
                ", followWho=" + followWho +
                ", followWhoMember=" + followWhoMember +
                ", whoFollow=" + whoFollow +
                ", whoFollowMember=" + whoFollowMember +
                '}';
    }

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

    public Integer getFollowWho() {
        return followWho;
    }

    public void setFollowWho(Integer followWho) {
        this.followWho = followWho;
    }

    public Member getFollowWhoMember() {
        return followWhoMember;
    }

    public void setFollowWhoMember(Member followWhoMember) {
        this.followWhoMember = followWhoMember;
    }

    public Integer getWhoFollow() {
        return whoFollow;
    }

    public void setWhoFollow(Integer whoFollow) {
        this.whoFollow = whoFollow;
    }

    public Member getWhoFollowMember() {
        return whoFollowMember;
    }

    public void setWhoFollowMember(Member whoFollowMember) {
        this.whoFollowMember = whoFollowMember;
    }
}