package com.lxinet.jeesns.model.cms;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.lxinet.jeesns.model.member.Member;

import java.io.Serializable;
import java.util.Date;

/**
 * 文章评论实体类
 * Created by zchuanzhao on 2016/11/26.
 */
public class ArticleComment implements Serializable {
    private Integer id;

    private Date createTime;    //创建时间

    private Integer articleId;  //文章 id

    private Article article;    //文章实体

    private Integer memberId;   //用户id

    private Member member;      //用户实体

    private String content;     //评论内容


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

    public Integer getArticleId() {
        return articleId;
    }

    public void setArticleId(Integer articleId) {
        this.articleId = articleId;
    }

    public Article getArticle() {
        return article;
    }

    public void setArticle(Article article) {
        this.article = article;
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

    @Override
    public String toString() {
        return "ArticleComment{" +
                "id=" + id +
                ", createTime=" + createTime +
                ", articleId=" + articleId +
                ", article=" + article +
                ", memberId=" + memberId +
                ", member=" + member +
                ", content='" + content + '\'' +
                '}';
    }
}