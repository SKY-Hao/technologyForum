package com.lxinet.jeesns.model.member;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * 验证码
 * Created by zchuanzhao on 17/01/20.
 */
public class ValidateCode implements Serializable {

	private Integer id;

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date createTime;//创建时间

	private String email;	//邮箱

	private String code;	//验证码

	private Integer status;	//状态，0未使用，1已使用  默认：0

	private Integer type;	//类型，1是重置密码，2会员激活

	public ValidateCode(){

	}

	public ValidateCode(String email, String code, Integer type) {
		this.email = email;
		this.code = code;
		this.type = type;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "ValidateCode{" +
				"id=" + id +
				", createTime=" + createTime +
				", email='" + email + '\'' +
				", code='" + code + '\'' +
				", status=" + status +
				", type=" + type +
				'}';
	}
}