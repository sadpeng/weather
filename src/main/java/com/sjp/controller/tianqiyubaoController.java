package com.sjp.controller;


import com.sjp.pojo.Msg;
import com.sjp.pojo.Time;
import com.sjp.pojo.tianqiyubao;
import com.sjp.service.TianqiyubaoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/tianqisys")
public class tianqiyubaoController {

    @Autowired
    private TianqiyubaoService tianqiyubaoService;

    public void setTianqiyubaoService(TianqiyubaoService tianqiyubaoService) {
        this.tianqiyubaoService = tianqiyubaoService;
    }

//    //
//    @RequestMapping("/alltianqi")
//    public String alltianqi(Model model){
//        List<tianqiyubao> tianqiyubaos=this.tianqiyubaoService.findByAll();
//        model.addAttribute("tianqiyubaos",tianqiyubaos);
//        return "alltianqi";
//    }

    /**
     * 传入查询时间，查找到所需数据
     * @param time
     * @param model
     * @return
     */
    @RequestMapping("/totime")
    @ResponseBody
    public Msg getTianqiyubaoWithJson(Time time, Model model) {
        List<tianqiyubao> tianqiyubaos = this.tianqiyubaoService.findByTime(time);
        return Msg.success().add("tianqiyubaolist", tianqiyubaos);
    }
}
