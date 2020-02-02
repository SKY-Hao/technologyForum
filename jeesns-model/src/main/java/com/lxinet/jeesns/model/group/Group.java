package com.lxinet.jeesns.model.group;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.lxinet.jeesns.model.member.Member;
import org.hibernate.validator.constraints.NotBlank;
import java.io.Serializable;
import java.util.Date;

/**
 * 2017年12月6日15:08:23更新
 * 群组实体类
 *
 */
public class Group implements Serializable {

    private Integer id;         //自增
    private Date createTime;    //创建时间
    @NotBlank(message = "群组名称不能为空")
    private String name;        //文章群组名称
    private String logo;        //群组logo
    private Integer creator;    //创建人的ID

    private Member creatorMember;//创建人集合信息

    private String managers;    //管理员
    private String tags;        //标签
    private String introduce;   //介绍
    private Integer status;     //状态 0未审核，1已审核，-1审核不通过
    private Integer canPost;    //是否可以发帖子 0不可以 1可以
    private Integer topicReview;//贴子是否需要审核 0不审核 1审核
    private Integer topicCount; //贴子的数量
    private Integer fansCount;  //粉丝的数量
    private  Integer topicComment;   //帖子评论的数量


    @Override
    public String toString() {
        return "Group{" +
                "id=" + id +
                ", createTime=" + createTime +
                ", name='" + name + '\'' +
                ", logo='" + logo + '\'' +
                ", creator=" + creator +
                ", creatorMember=" + creatorMember +
                ", managers='" + managers + '\'' +
                ", tags='" + tags + '\'' +
                ", introduce='" + introduce + '\'' +
                ", status=" + status +
                ", canPost=" + canPost +
                ", topicReview=" + topicReview +
                ", topicCount=" + topicCount +
                ", fansCount=" + fansCount +
                ", topicComment=" + topicComment +
                '}';
    }

    public Integer getTopicComment() {
        return topicComment;
    }

    public void setTopicComment(Integer topicComment) {
        this.topicComment = topicComment;
    }

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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public Integer getCreator() {
        return creator;
    }

    public void setCreator(Integer creator) {
        this.creator = creator;
    }

    public String getManagers() {
        return managers;
    }

    public void setManagers(String managers) {
        this.managers = managers;
    }

    public String getTags() {
        return tags;
    }

    public void setTags(String tags) {
        this.tags = tags;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public Member getCreatorMember() {
        return creatorMember;
    }

    public void setCreatorMember(Member creatorMember) {
        this.creatorMember = creatorMember;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getCanPost() {
        return canPost;
    }

    public void setCanPost(Integer canPost) {
        this.canPost = canPost;
    }

    public Integer getTopicReview() {
        return topicReview;
    }

    public void setTopicReview(Integer topicReview) {
        this.topicReview = topicReview;
    }

    public Integer getTopicCount() {
        return topicCount;
    }

    public void setTopicCount(Integer topicCount) {
        this.topicCount = topicCount;
    }

    public Integer getFansCount() {
        return fansCount;
    }

    public void setFansCount(Integer fansCount) {
        this.fansCount = fansCount;
    }

}