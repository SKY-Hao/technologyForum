package com.lxinet.jeesns.service.member.impl;

import com.lxinet.jeesns.core.enums.MessageType;
import com.lxinet.jeesns.core.dto.ResponseModel;
import com.lxinet.jeesns.core.model.Page;
import com.lxinet.jeesns.core.utils.AtUtil;
import com.lxinet.jeesns.core.utils.StringUtils;
import com.lxinet.jeesns.dao.member.IMessageDao;
import com.lxinet.jeesns.model.member.Member;
import com.lxinet.jeesns.model.member.Message;
import com.lxinet.jeesns.service.member.IMemberService;
import com.lxinet.jeesns.service.member.IMessageService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by zchuanzhao on 2017/3/9.
 */
@Service("messageService")
public class MessageServiceImpl implements IMessageService {
    @Resource
    private IMessageDao messageDao;
    @Resource
    private IMemberService memberService;




    /**
     * 发送信息
     * @param fromMemberId
     * @param toMemberId
     * @param content
     * @return
     */
    @Override
    public ResponseModel sendOutMessage(Integer fromMemberId, Integer toMemberId, String content) {
        if(fromMemberId.intValue() == toMemberId.intValue()){
            return new ResponseModel(-1, "不能发信息给自己");
        }
        Message message = new Message();
        message.setFromMemberId(fromMemberId);//发信人ID
        message.setToMemberId(toMemberId);//收信人ID
        message.setContent(content);//发送内容
        if(messageDao.sentMsg(message) == 1){
            return new ResponseModel(0, "信息发送成功");
        }
        return new ResponseModel(-1, "信息发送失败");
    }

    /**
     *@会员处理并发送系统消息调用的方法
     * @param toMemberId
     * @param content
     * @param appTag
     * @param type
     * @param relateKeyId
     * @param loginMemberId
     * @param description
     * @return
     */
    @Override
    public ResponseModel systemMessageSave(Integer toMemberId, String content, Integer appTag,Integer type,Integer relateKeyId,Integer loginMemberId,String description) {
        Message message = new Message();
        message.setToMemberId(toMemberId);
        message.setContent(content);
        message.setAppTag(appTag);
        message.setRelateKeyId(relateKeyId);
        message.setType(type);
        message.setMemberId(loginMemberId);
        message.setDescription(description);
        if(messageDao.systemMsgSave(message) == 1){
            return new ResponseModel(0, "信息发送成功");
        }
        return new ResponseModel(-1, "信息发送失败");
    }

    @Override
    public ResponseModel<Message> listByPage(Page page, Integer fromMemberId, Integer toMemberId) {
        List<Message> list = messageDao.listByPage(page,fromMemberId, toMemberId);
        ResponseModel model = new ResponseModel(0,page);
        model.setData(list);
        return model;
    }

    /**
     * 获取聊天记录
     * @param page
     * @param fromMemberId
     * @param toMemberId
     * @return
     */
    @Override
    public ResponseModel<Message> messageRecords(Page page, Integer fromMemberId, Integer toMemberId) {
        List<Message> list = messageDao.messageRecords(page, fromMemberId, toMemberId);
        ResponseModel model = new ResponseModel(0, page);
        model.setData(list);
        //设置该会员聊天记录为已读
        this.setRead(fromMemberId,toMemberId);
        return model;
    }

    /**
     * 系统信息
     * @return
     */
    @Override
    public ResponseModel<Message> systemMessage(String key,Page page, Integer toMemberId,String basePath) {
        if (StringUtils.isNotBlank(key)){
            key = "%"+key+"%";
        }

        List<Message> list = messageDao.systemMessage(key,page, toMemberId,basePath);
        ResponseModel model = new ResponseModel(0, page);
        model.setData(list);
        //设置该会员聊天记录为已读
        this.setRead(null,toMemberId);
        return model;
    }

    /**
     * 删除某个会员的所有聊天记录
     * @param memberId
     * @return
     */
    @Override
    public int deleteByMember(Integer memberId) {
        return messageDao.deleteByMember(memberId);
    }

    /**
     * 清空两个会员的聊天记录
     * @param fromMemberId
     * @param toMemberId
     * @return
     */
    @Override
    public int clearMessageByMember(Integer fromMemberId, Integer toMemberId) {
        return messageDao.clearMessageByMember(fromMemberId, toMemberId);
    }


    /**
     * 会员未读私信数量
     * @param memberId
     * @return
     */
    @Override
    public int countUnreadNum(int memberId) {
        return messageDao.countUnreadNum(memberId);
    }

    /**
     * 系统未读信息数量
     * @param memberId
     * @return
     */
    @Override
    public int countSystemUnreadNum(int memberId) {
        return messageDao.countSystemUnreadNum(memberId);
    }

    /**
     * 设置已读状态
     * @param fromMemberId
     * @param toMemberId
     * @return
     */
    @Override
    public int setRead(Integer fromMemberId, Integer toMemberId) {
        return messageDao.setRead(fromMemberId,toMemberId);
    }

    /**
     * @会员处理并发送系统消息
     * @param loginMemberId
     * @param content
     * @param appTag
     * @param messageType
     * @param relateKeyId
     */
    @Override
    public void atDeal(int loginMemberId,String content,int appTag,MessageType messageType,int relateKeyId) {
        List<String> atMemberList = AtUtil.getAtNameList(content);
        if (atMemberList.size() > 0){
            for (String name : atMemberList){
                Member findAtMember = memberService.findByName(name);
                if (findAtMember != null && loginMemberId != findAtMember.getId()){
                    this.systemMessageSave(findAtMember.getId(),content,appTag,messageType.getCode(),relateKeyId,loginMemberId,messageType.getContent());

                }
            }
        }
    }

    /**
     * @会员处理并发送系统消息
     * @param loginMemberId
     * @param toMemberId
     * @param content
     * @param appTag
     * @param messageType
     * @param relateKeyId
     */
    @Override
    public void diggDeal(int loginMemberId, int toMemberId,String content, int appTag, MessageType messageType, int relateKeyId) {
        if (loginMemberId != toMemberId){
            this.systemMessageSave(toMemberId,content,appTag,messageType.getCode(),relateKeyId,loginMemberId,messageType.getContent());
        }
    }
    /**
     * 调用上面的diggDeal方法
     */
    @Override
    public void diggDeal(int loginMemberId, int toMemberId, int appTag, MessageType messageType, int relateKeyId) {
        diggDeal(loginMemberId,toMemberId,null,appTag,messageType,relateKeyId);
    }
}
