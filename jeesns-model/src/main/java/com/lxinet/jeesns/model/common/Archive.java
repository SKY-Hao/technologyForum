package com.lxinet.jeesns.model.common;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.lxinet.jeesns.model.member.Member;
import org.hibernate.validator.constraints.NotBlank;

import javax.validation.constraints.Digits;
import java.io.Serializable;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Date;

/**
 * 文章实体类
 * Created by zchuanzhao on 2016/9/26.
 */
public class Archive implements Serializable {
    private Integer archiveId;

    private Integer post_type;//发布类型，1是普通文章，2是群组文章

    @NotBlank(message = "文章标题不能为空")
    private String title;   //标题

    private Integer memberId;//会员ID

    private Member member;  //会员实体

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;    //创建时间

    private String description; //描述说明

    private String keywords;    //关键词

    @Digits(integer = 1,fraction = 0,message = "浏览权限只能是数字")
    private Integer viewRank;   //浏览权限，0不限制，1会员

    @Digits(integer = 11,fraction = 0,message = "浏览数只能是数字")
    private Integer viewCount;  //浏览次数

    private String writer;  // 作者

    private String source;  //来源

    private Date pubTime;   //发布日期

    private Date updateTime;//更新日期

    private String thumbnail;//缩略图

    private Date lastReply;//最后回复时间

    private Integer canReply;   //是否可以回复，0可以回复，1不可以回复

    private Integer goodNum;    //点赞数量

    private Integer badNum;     //踩的数量

    private Integer checkAdmin; //审核管理员ID

    @NotBlank(message = "文章内容不能为空")
    private String content;     //内容


    private String htmlcontent;     //markdown内容

    //喜欢数量
    private Integer favor;

    //会员是否已点击喜欢
    private Integer isFavor;

    public Integer getArchiveId() {
        return archiveId;
    }

    public void setArchiveId(Integer archiveId) {
        this.archiveId = archiveId;
    }

    public String getHtmlcontent() {
        return htmlcontent;
    }

    public void setHtmlcontent(String htmlcontent) {
        this.htmlcontent = htmlcontent;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getMemberId() {
        return memberId;
    }

    public void setMemberId(Integer memberId) {
        this.memberId = memberId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }

    public Integer getViewRank() {
        return viewRank;
    }

    public void setViewRank(Integer viewRank) {
        this.viewRank = viewRank;
    }

    public Integer getViewCount() {
        return viewCount;
    }

    public void setViewCount(Integer viewCount) {
        this.viewCount = viewCount;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public Date getPubTime() {
        return pubTime;
    }

    public void setPubTime(Date pubTime) {
        this.pubTime = pubTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getThumbnail() {
        return "".equals(thumbnail) ? null:thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public Date getLastReply() {
        return lastReply;
    }

    public void setLastReply(Date lastReply) {
        this.lastReply = lastReply;
    }

    public Integer getCanReply() {
        return canReply;
    }

    public void setCanReply(Integer canReply) {
        this.canReply = canReply;
    }

    public Integer getGoodNum() {
        return goodNum;
    }

    public void setGoodNum(Integer goodNum) {
        this.goodNum = goodNum;
    }

    public Integer getBadNum() {
        return badNum;
    }

    public void setBadNum(Integer badNum) {
        this.badNum = badNum;
    }

    public Integer getCheckAdmin() {
        return checkAdmin;
    }

    public void setCheckAdmin(Integer checkAdmin) {
        this.checkAdmin = checkAdmin;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }


    public Member getMember() {
        return member;
    }

    public void setMember(Member member) {
        this.member = member;
    }

    public Integer getFavor() {
        return favor;
    }

    public Integer getPost_type() {
        return post_type;
    }

    public void setPost_type(Integer post_type) {
        this.post_type = post_type;
    }

    public void setFavor(Integer favor) {
        this.favor = favor;
    }

    public Integer getIsFavor() {
        return isFavor;
    }

    public void setIsFavor(Integer isFavor) {
        this.isFavor = isFavor;
    }

    public Archive copy(Object object) throws Exception {
        Class<?> classType = object.getClass();
        //当前对象
        Class<?> newClassType = this.getClass();
        Object objectCopy = classType.getConstructor(new Class[]{}).newInstance(new Object[]{});
        //获得当前对象的所有成员变量
        Field[] fields = newClassType.getDeclaredFields();
        for(Field field : fields) {
            //获取成员变量的名字
            String name = field.getName();
            //获取get和set方法的名字
            String firstLetter = name.substring(0,1).toUpperCase();
            String getMethodName = "get" + firstLetter + name.substring(1);
            String setMethodName = "set" + firstLetter + name.substring(1);
            //获取方法对象
            Method getMethod = classType.getMethod(getMethodName, new Class[]{});
            Method setMethod = classType.getMethod(setMethodName, new Class[]{field.getType()});
            //调用get方法获取旧的对象的值
            Object value = getMethod.invoke(object, new Object[]{});
            //调用set方法将这个值复制到新的对象中去
            setMethod.invoke(objectCopy, new Object[]{value});
        }
        return (Archive) objectCopy;
    }

}