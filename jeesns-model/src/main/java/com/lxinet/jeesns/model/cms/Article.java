package com.lxinet.jeesns.model.cms;


import com.lxinet.jeesns.model.common.Archive;

import javax.validation.constraints.Digits;
import java.util.Date;

/**
 * 文章实体类
 * Created by zchuanzhao on 2016/11/26.
 */
public class Article extends Archive {
    private Integer id;     //自增
    private Date collectTime;   //创建时间
    @Digits(integer = 11,fraction = 0,message = "栏目不能为空")
    private Integer cateId; //栏目ID
    private Integer status; //状态 0未审核 1审核

    private ArticleCate articleCate;    //文字栏目实体类


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

    public Integer getCateId() {
        return cateId;
    }

    public void setCateId(Integer cateId) {
        this.cateId = cateId;
    }

    public ArticleCate getArticleCate() {
        return articleCate;
    }

    public void setArticleCate(ArticleCate articleCate) {
        this.articleCate = articleCate;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Article{" +
                "id=" + id +
                ", collectTime=" + collectTime +
                ", cateId=" + cateId +
                ", status=" + status +
                ", articleCate=" + articleCate +
                '}';
    }
}