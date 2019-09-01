package com.sjp.dao;

import com.sjp.pojo.Time;
import com.sjp.pojo.tianqiyubao;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface Tianqiyubaodao {

    //全查天气
    List<tianqiyubao> findByAll();

    //时间查找天气
    List<tianqiyubao> findByTime(Time time);

}
