package com.lxinet.jeesns.web.front;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

/**
 * 说明：markdown编辑器UploadController
 * 创建人：黄天浩
 * 创建时间：2017年11月7日11:04:24
 */
@Controller
@RequestMapping("upload")
public class UploadController {




    @RequestMapping(value="/uploadfile",method= RequestMethod.POST)
    public void uploadfile(HttpServletRequest request, HttpServletResponse response,
                           @RequestParam(value = "editormd-image-file", required = false) MultipartFile attach){
        try {
            request.setCharacterEncoding( "utf-8" );
            response.setHeader( "Content-Type" , "text/html" );

            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
            String ymd = sdf.format(new Date());
            String path = "/upload/images/" + ymd + "/";

            String rootPath = request.getSession().getServletContext().getRealPath("/")+ path;

            System.out.println("sdf====="+sdf);
            System.out.println("ymd====="+ymd);
            System.out.println("path========"+path);
            System.out.println("rootPath======="+rootPath);

            /**
             * 文件路径不存在则需要创建文件路径
             */
            File filePath=new File(rootPath);
            System.out.println("filePath======"+filePath);
            if(!filePath.exists()){
                filePath.mkdirs();
            }

            String picNameOld = attach.getOriginalFilename();
            String picType = picNameOld.substring(picNameOld.lastIndexOf("."),picNameOld.length());
            String picNameNew = UUID.randomUUID() + picType;

            //最终文件名
            File realFile=new File(rootPath + File.separator + picNameNew);
            FileUtils.copyInputStreamToFile(attach.getInputStream(), realFile);

            System.out.println("最终文件名realFile=========="+realFile);


            //下面response返回的json格式是editor.md限制
            response.getWriter().write( "{\"success\": 1, \"message\":\"上传成功\",\"url\":\""+ path +"/" + picNameNew + "\"}" );
        } catch (Exception e) {
            try {
                response.getWriter().write( "{\"success\":0}" );
            } catch (IOException e1) {
                e1.printStackTrace();
            }
        }
    }
}


