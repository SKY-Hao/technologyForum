package com.lxinet.jeesns.model.group;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.lxinet.jeesns.model.member.Member;

import java.io.Serializable;
import java.util.Date;

/**
 * 群组帖子评论
 * 2017年12月7日10:33:14
 */
public class GroupTopicComment implements Serializable {
    private Integer id;

    private Date createTime;//创建时间

    private Integer groupTopicId;//帖子ID

    private GroupTopic groupTopic;  //帖子实体

    private Integer memberId;       //会员ID

    private Member member;          //会员实体

    private String content;         //评论内容

    private Integer commentId;      //引用评论ID

    private GroupTopicComment groupTopicComment;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getGroupTopicId() {
        return groupTopicId;
    }

    public void setGroupTopicId(Integer groupTopicId) {
        this.groupTopicId = groupTopicId;
    }

    public GroupTopic getGroupTopic() {
        return groupTopic;
    }

    public void setGroupTopic(GroupTopic groupTopic) {
        this.groupTopic = groupTopic;
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getCommentId() {
        return commentId;
    }

    public void setCommentId(Integer commentId) {
        this.commentId = commentId;
    }

    public GroupTopicComment getGroupTopicComment() {
        return groupTopicComment;
    }

    public void setGroupTopicComment(GroupTopicComment groupTopicComment) {
        this.groupTopicComment = groupTopicComment;
    }

    @Override
    public String toString() {
        return "GroupTopicComment{" +
                "id=" + id +
                ", createTime=" + createTime +
                ", groupTopicId=" + groupTopicId +
                ", groupTopic=" + groupTopic +
                ", memberId=" + memberId +
                ", member=" + member +
                ", content='" + content + '\'' +
                ", commentId=" + commentId +
                ", groupTopicComment=" + groupTopicComment +
                '}';
    }
}