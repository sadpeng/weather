package com.sjp.service;

import com.sjp.pojo.Time;
import com.sjp.pojo.tianqiyubao;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface TianqiyubaoService {
    //全查天气
    List<tianqiyubao> findByAll();

    //时间查找天气
    List<tianqiyubao> findByTime(Time time);
}
