package com.lxinet.jeesns.model.member;

import java.io.Serializable;
import java.util.Date;

/**
 * 积分明细表
 * 2017年12月7日10:48:57
 */
public class ScoreDetail implements Serializable {

    private Integer id;

    private Date createTime;    //创建时间

    private Integer type;       //类型，0是普通积分增加，1是奖励，2是撤销奖励

    private Integer memberId;   //会员id

    private Member member;      //会员实体

    private Integer score;      //变化积分 默认：0

    private Integer balance;    //账户剩余积分

    private String remark;      //说明

    private Integer foreignId;  //外键ID，产生该奖励记录的ID

    private Integer scoreRuleId; //积分规则ID

    private Integer status;     //状态，1是成功，0是取消  默认：1

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

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getMemberId() {
        return memberId;
    }

    public void setMemberId(Integer memberId) {
        this.memberId = memberId;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public Integer getBalance() {
        return balance;
    }

    public void setBalance(Integer balance) {
        this.balance = balance;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Integer getForeignId() {
        return foreignId;
    }

    public void setForeignId(Integer foreignId) {
        this.foreignId = foreignId;
    }

    public Member getMember() {
        return member;
    }

    public void setMember(Member member) {
        this.member = member;
    }

    public Integer getScoreRuleId() {
        return scoreRuleId;
    }

    public void setScoreRuleId(Integer scoreRuleId) {
        this.scoreRuleId = scoreRuleId;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "ScoreDetail{" +
                "id=" + id +
                ", createTime=" + createTime +
                ", type=" + type +
                ", memberId=" + memberId +
                ", member=" + member +
                ", score=" + score +
                ", balance=" + balance +
                ", remark='" + remark + '\'' +
                ", foreignId=" + foreignId +
                ", scoreRuleId=" + scoreRuleId +
                ", status=" + status +
                '}';
    }
}