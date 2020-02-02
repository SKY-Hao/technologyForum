package com.lxinet.jeesns.service.member;

import com.lxinet.jeesns.core.enums.MessageType;
import com.lxinet.jeesns.core.dto.ResponseModel;
import com.lxinet.jeesns.core.model.Page;
import com.lxinet.jeesns.model.member.Message;

/**
 * 会员私信Service
 * Created by zchuanzhao on 17/3/9.
 */
public interface IMessageService {

    /**
     * 发送信息
     * @param fromMemberId
     * @param toMemberId
     * @param content
     * @return
     */
    ResponseModel sendOutMessage(Integer fromMemberId, Integer toMemberId, String content);
    ResponseModel systemMessageSave(Integer toMemberId, String content, Integer appTag,Integer type,Integer relateKeyId,Integer memberId,String description);

    ResponseModel<Message> listByPage(Page page, Integer fromMemberId, Integer toMemberId);

    /**
     * 获取聊天记录
     * @return
     */
    ResponseModel<Message> messageRecords(Page page, Integer fromMemberId, Integer toMemberId);
    /**
     * 系统信息
     * @return
     */
    ResponseModel<Message> systemMessage(String key,Page page, Integer toMemberId,String basePath);

    /**
     * 删除某个会员的所有聊天记录
     * @param memberId
     * @return
     */
    int deleteByMember(Integer memberId);

    /**
     * 清空两个会员的聊天记录
     * @param fromMemberId
     * @param toMemberId
     * @return
     */
    int clearMessageByMember(Integer fromMemberId, Integer toMemberId);

    /**
     * 会员未读私信数量
     * @param memberId
     * @return
     */
    int countUnreadNum(int memberId);

    /**
     * 系统未读信息数量
     * @param memberId
     * @return
     */
    int countSystemUnreadNum(int memberId);

    /**
     * 设置已读状态
     * @param fromMemberId
     * @param toMemberId
     * @return
     */
    int setRead(Integer fromMemberId, Integer toMemberId);

    /**
     * @会员处理并发送系统消息
     * @param loginMemberId
     * @param content
     * @param appTag
     * @param messageType
     * @param relateKeyId
     */
    void atDeal(int loginMemberId,String content,int appTag,MessageType messageType,int relateKeyId);

    /**
     * @会员处理并发送系统消息
     * @param loginMemberId
     * @param toMemberId
     * @param content
     * @param appTag
     * @param messageType
     * @param relateKeyId
     */
    void diggDeal(int loginMemberId,int toMemberId, String content, int appTag,MessageType messageType,int relateKeyId);

    /**
     * 调用上面的diggDeal方法
     */
    void diggDeal(int loginMemberId,int toMemberId, int appTag,MessageType messageType,int relateKeyId);
}