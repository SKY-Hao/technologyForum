package com.lxinet.jeesns.service.common;

import com.lxinet.jeesns.model.common.Picture;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by zchuanzhao on 2017/3/7.
 */
public interface IPictureService {

    List<Picture> find(Integer foreignId);

    int delete(HttpServletRequest request, Integer foreignId);

    int save(Picture picture);

    int update(Integer foreignId, String ids);
}