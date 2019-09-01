package com.sjp.service.impl;

import com.sjp.dao.Tianqiyubaodao;
import com.sjp.pojo.Time;
import com.sjp.pojo.tianqiyubao;
import com.sjp.service.TianqiyubaoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TianqiyubaoServiceimpl implements TianqiyubaoService {

    @Autowired
    private Tianqiyubaodao tianqiyubaodao;

    public void setTianqiyubaodao(Tianqiyubaodao tianqiyubaodao) {
        this.tianqiyubaodao = tianqiyubaodao;
    }

    @Override
    public List<tianqiyubao> findByAll() {
        return tianqiyubaodao.findByAll();
    }

    @Override
    public List<tianqiyubao> findByTime(Time time) {
        return tianqiyubaodao.findByTime(time);
    }


}
