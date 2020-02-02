package com.lxinet.jeesns.web.front;

import com.lxinet.jeesns.model.group.GroupTopic;
import com.lxinet.jeesns.service.cms.IArticleService;
import com.lxinet.jeesns.service.common.IArchiveService;
import com.lxinet.jeesns.common.utils.EmojiUtil;
import com.lxinet.jeesns.common.utils.MemberUtil;
import com.lxinet.jeesns.core.dto.ResponseModel;
import com.lxinet.jeesns.core.model.Page;
import com.lxinet.jeesns.core.utils.Const;
import com.lxinet.jeesns.core.utils.ErrorUtil;
import com.lxinet.jeesns.core.utils.JeesnsConfig;
import com.lxinet.jeesns.service.group.IGroupFansService;
import com.lxinet.jeesns.service.group.IGroupService;
import com.lxinet.jeesns.service.group.IGroupTopicService;
import com.lxinet.jeesns.service.member.IMemberFansService;
import com.lxinet.jeesns.web.common.BaseController;
import com.lxinet.jeesns.model.member.Member;
import com.lxinet.jeesns.service.member.IMemberService;
import com.lxinet.jeesns.model.system.ActionLog;
import com.lxinet.jeesns.service.system.IActionLogService;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * 首页controller
 * Created by zchuanzhao on 2016/11/25.
 */
@Controller("indexController")
@RequestMapping("/")
public class IndexController extends BaseController{
    @Resource
    private IArticleService articleService;
    @Resource
    private IGroupTopicService groupTopicService;
    @Resource
    private IGroupService groupService;
    @Resource
    private IMemberService memberService;
    @Resource
    private IArchiveService archiveService;
    @Resource
    private IActionLogService actionLogService;
    @Resource
    private JeesnsConfig jeesnsConfig;
    @Resource
    private IGroupFansService groupFansService;
    @Resource
    private IMemberFansService memberFansService;

    /**
     * 首页
     * @param key
     * @param cateid
     * @param model
     * @return
     */
    @RequestMapping(value={"/", "index"},method = RequestMethod.GET)
    public String index(@RequestParam(value = "key",required = false,defaultValue = "") String key, Integer cateid,Model model
                ) {
        Page page = new Page(request);
        if(cateid == null){
             cateid = 0;
         }
         page.setPageSize(10);

        //前台所有帖子和文档列表
         ResponseModel groupTopicModel = groupTopicService.groupTopicList(1,page,key);
        //ResponseModel groupTopicModel = archiveService.list(1,page,key);
         model.addAttribute("model",groupTopicModel);

         //热门问题帖子
         List<GroupTopic> byGroupStatusList=groupTopicService.byGroupStatus();
         model.addAttribute("byGroupStatusList",byGroupStatusList);

        //热门文章帖子
        List<GroupTopic> byGroupStatus=groupTopicService.byGroupStatusList();
        model.addAttribute("byGroupStatus",byGroupStatus);

        return jeesnsConfig.getFrontTemplate() + "/index";
    }

    /**
     *  U.FTL  动态主页面
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "user/{id}",method = RequestMethod.GET)
    public String u(@PathVariable("id") Integer id, Model model){

        Page page = new Page(request);

        Member member = memberService.findById(id);
        if(member == null){
            return jeesnsConfig.getFrontTemplate() + ErrorUtil.error(model,-1005, Const.INDEX_ERROR_FTL_PATH);
        }
        model.addAttribute("member",member);

        Member loginMember = MemberUtil.getLoginMember(request);
        model.addAttribute("loginMember", loginMember);

        ResponseModel<ActionLog> list = actionLogService.memberActionLog(page,id);
        model.addAttribute("actionLogModel",list);

        return jeesnsConfig.getFrontTemplate() + "/user";
    }

    /**
     * 主页面 左侧栏目跳转（属性跳转）例如:粉丝 跳fans页面 群组 跳group页面
     * @param id
     * @param type
     * @param model
     * @return
     */
    @RequestMapping(value = "user/{id}/home/{type}",method = RequestMethod.GET)
    public String home(@PathVariable("id") Integer id, @PathVariable("type") String type, Model model){
        Page page = new Page(request);
        Member member = memberService.findById(id);
        if(member == null){
            return jeesnsConfig.getFrontTemplate() + ErrorUtil.error(model,-1005, Const.INDEX_ERROR_FTL_PATH);
        }
        model.addAttribute("member",member);

        Member loginMember = MemberUtil.getLoginMember(request);
        model.addAttribute("loginMember", loginMember);
        int loginMemberId = 0;
        if(loginMember != null){
            loginMemberId = loginMember.getId().intValue();
        }
        if("article".equals(type)){//文章
            model.addAttribute("model", articleService.listByPage(page,"",0,1, id));
        } else if("groupTopic".equals(type)){//帖子
            model.addAttribute("model", groupTopicService.listByPage(page,"",0,1, id));
        } else if("group".equals(type)){//群组
            model.addAttribute("model", groupFansService.listByMember(page, id));
        } else  if("follows".equals(type)){//关注
            model.addAttribute("model", memberFansService.followsList(page,id));
        } else if("fans".equals(type)){//粉丝
            model.addAttribute("model", memberFansService.fansList(page,id));
        }
        model.addAttribute("type",type);
        return jeesnsConfig.getFrontTemplate() + "/home";
    }


    @RequestMapping(value = "newVersion",method = RequestMethod.GET)
    public void newVersion(@RequestParam("callback") String callback){
        response.setCharacterEncoding("utf-8");
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("LAST_SYSTEM_VERSION",Const.LAST_SYSTEM_VERSION);
        jsonObject.put("LAST_SYSTEM_UPDATE_TIME", Const.LAST_SYSTEM_UPDATE_TIME);
        PrintWriter out = null;
        try {
            out = response.getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }
        out.print(callback + "(" + jsonObject.toString() + ")");
        out.flush();
        out.close();
    }
    /**
     * 获取Emoji数据
     * @return
     */
    @RequestMapping(value="/emoji/emojiJsonData.json",method = RequestMethod.GET)
    @ResponseBody
    public Object emojiJsonData(){
        return EmojiUtil.emojiJson();
    }

    @RequestMapping(value="/404",method = RequestMethod.GET)
    public String jeesns404(){
        return jeesnsConfig.getFrontTemplate() + "/common/404";
    }

    @RequestMapping(value="/error",method = RequestMethod.GET)
    public String error(){
        return jeesnsConfig.getFrontTemplate() + "/common/error";
    }

}
