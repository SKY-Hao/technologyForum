package com.lxinet.jeesns.model.group;


import com.lxinet.jeesns.model.common.Archive;

import java.util.Date;

/**
 * 帖子实体类
 * 2017年12月7日10:31:21
 */
public class GroupTopic extends Archive {

    private Integer id;

    private Date collectTime;   //创建时间

    private Integer groupId;    //群组ID

    private Group group;        //群组

    private Integer status;     //状态，0未审核，1已审核

    private Integer isTop;      //置顶，0不置顶，1置顶，2超级置顶

    private Integer isEssence;  //精华贴，0不加精贴，1加精贴

    private  Integer topicComment;  //评论数量

    private  Integer groupstatus; //群组帖子状态 0 群组问题帖子  1群组文章帖子

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getCollectTime() {
        return collectTime;
    }

    public void setCollectTime(Date collectTime) {
        this.collectTime = collectTime;
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

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getIsTop() {
        return isTop;
    }

    public void setIsTop(Integer isTop) {
        this.isTop = isTop;
    }

    public Integer getIsEssence() {
        return isEssence;
    }

    public void setIsEssence(Integer isEssence) {
        this.isEssence = isEssence;
    }

    public Integer getTopicComment() {
        return topicComment;
    }

    public void setTopicComment(Integer topicComment) {
        this.topicComment = topicComment;
    }

    public Integer getGroupstatus() {
        return groupstatus;
    }

    public void setGroupstatus(Integer groupstatus) {
        this.groupstatus = groupstatus;
    }

    @Override
    public String toString() {
        return "GroupTopic{" +
                "id=" + id +
                ", collectTime=" + collectTime +
                ", groupId=" + groupId +
                ", group=" + group +
                ", status=" + status +
                ", isTop=" + isTop +
                ", isEssence=" + isEssence +
                ", topicComment=" + topicComment +
                ", groupstatus=" + groupstatus +
                '}';
    }
}