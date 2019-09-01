<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<% String appPath = request.getContextPath();
    pageContext.setAttribute("path", request.getContextPath());
%>
<html>
<head>
    <title>天气</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" type="text/css" href="${path}/static/css/font.css">
    <link rel="stylesheet" type="text/css" href="${path}/static/css/xadmin.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/static/css/mycss.css"/>
    <link rel="stylesheet" href="https://cdn.bootcss.com/Swiper/3.4.2/css/swiper.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/Swiper/3.4.2/js/swiper.jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.bootcss.com/Swiper/3.4.2/js/swiper.jquery.min.js"></script>
    <script src="${path}/static/lib/layui/layui.js"></script>
    <script type="text/javascript" src="${path}/static/js/xadmin.js"></script>
    <script type="text/javascript" src="${path}/static/js/echarts.js"></script>
    <script type="text/javascript" src="${path}/static/js/china.js"></script>
    <script src="http://oss.sheetjs.com/js-xlsx/xlsx.full.min.js"></script>
</head>
<body>
<div class="container">
    <div class="logo">全国各地气温指数热力指示图</div>
    <div class="open-nav"><i class="iconfont">&#xe699;</i></div>
    <ul class="layui-nav right" lay-filter="">
    </ul>
</div>
<!-- 顶部结束 -->

<!-- 中部开始 -->
<div class="wrapper">
    <!-- 左侧菜单开始 -->
    <div class="left-nav">
        <div id="side-nav">
            <ul id="nav">
                <li class="my-btn">
                    <a href="javascript:;">
                        <i class="iconfont">&#xe761;</i>各地气温<i class="iconfont nav_right">&#xe697;</i>
                    </a>
                </li>
                <li class="my-btn">
                    <a href="javascript:;">
                        <i class="iconfont">&#xe70b;</i>各地风力指数<i class="iconfont nav_right">&#xe697;</i>
                    </a>
                </li>
                <li class="my-btn">
                    <a href="javascript:;">
                        <i class="iconfont">&#xe6a3;</i>预测气温<i class="iconfont nav_right">&#xe697;</i>
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <!-- 左侧菜单结束 -->
    <!-- 右侧主体开始 -->
    <div class="page-content">
        <div id="id3" class="content"></div>
        <!-- 右侧内容框架，更改从这里开始 -->
        <form action="" method="" id="submit_form">
            <p>
                年：
                <input type="number" id="year" name="year" min="2018" max="2018" style="width: 60px;color:black"/>
                <br>
                月：
                <input type="number" id="month" name="month" min="7" max="12" style="width: 60px;color:black"/>
                <br>
                日：
                <input type="number" id="day" name="day" min="1" max="31" style="width: 60px;color:black"/>
                <br>
                <input id="id-btn" type="button" value="提交"
                       style="background-color: white;color: black;border: 2px solid #4CAF50;height: 30px;width: 100px">
            </p>
        </form>
        <br>
        <script type="text/javascript">

            var myChart = echarts.init(document.getElementById('id3'));

            //页面加载完成之后直接发送一个ajax请求要到数据
            //页面初始胡显示2018.7.1的数据
            $(function () {
                $.ajax({
                    url: "${path}/tianqisys/totime",
                    data: "year=2018&month=12&day=1",
                    type: "GET",
                    success: function (result) {
                        wendu_Data(result);
                        fengli_Data(result);
                    }
                });
            });

            $(function () {
                $.ajax({
                    url: "${path}/tianqisys/totime",
                    data: "year=2019&month=1&day=1",
                    type: "GET",
                    success: function (result) {
                        // console.log(result);
                        //预测气温
                        pred_temperature(result);
                    }
                });
            });

            //对最高温最低温数据进行处理
            function wendu_Data(result) {

                maxwendu = [];
                minwendu = [];

                var tianqi = result.extend.tianqiyubaolist;

                $.each(tianqi, function (index, item) {
                    maxwendu.push({
                        name: item.city,
                        value: [item.jd, item.wd, item.wd_max]
                    });
                    minwendu.push({
                        name: item.city,
                        value: [item.jd, item.wd, item.wd_min]
                    });
                });

                option2 = {
                    backgroundColor: '000000',
                    title: {
                        text: '全国各地气温',
                        left: 'center',
                        top: 'top',
                        textStyle: {
                            color: '#fff'
                        }
                    },
                    tooltip: {
                        trigger: 'item'
                    },
                    legend: {
                        left: 'left',
                        data: ['最高温', '最低温'],
                        textStyle: {
                            color: '#ccc'
                        }
                    },
            //
                    visualMap:
                        {
                            min: -40,
                            max: 45,
                            left: 'left',
                            top: 'bottom',
                            calculable: true,
                            inRange:
                                {
                                    color: ['#24b7f2', '#f2c31a','#ff0000']
                                },
                            textStyle:
                                {
                                    color: '#fff'
                                }
                        },
                    geo: {
                        map: 'china',
                        roam: true,
                        label: {
                            emphasis: {
                                show: false
                            }
                        },
                        itemStyle: {
                            normal: {
                                areaColor: '#323c48',
                                borderColor: '#111'
                            },
                            emphasis: {
                                areaColor: '#2a333d'
                            }
                        }
                    },
                    series: [{
                        name: '最高温',
                        type: 'scatter',
                        coordinateSystem: 'geo',
                        symbolSize: 4,
                        large: true,
                        itemStyle: {
                            normal: {
                                shadowBlur: 2,
                                shadowColor: 'rgba(37, 140, 249, 0.8)',
                                color: 'rgba(37, 140, 249, 0.8)'
                            }
                        },

                        data: maxwendu
                    }, {
                        name: '最低温',
                        type: 'scatter',
                        coordinateSystem: 'geo',
                        symbolSize: 4,
                        large: true,
                        itemStyle: {
                            normal: {
                                shadowBlur: 2,
                                shadowColor: 'rgba(14,230,242, 0.8)',
                                color: 'rgba(14,230,242, 0.8)'
                            }
                        },

                        data: minwendu
                    }]
                };
                myChart.setOption(option2);
            }

            //预测气温
            function pred_temperature(result){
                temperature=[];

                //获取天气列表数据
                var tianqi=result.extend.tianqiyubaolist;

                $.each(tianqi,function (index,item) {
                    temperature.push({
                        name:item.city,
                        value:[item.jd,item.wd,item.pred]
                    });
                });

                option1 = {
                    backgroundColor: '000000',
                    title: {
                        text: '2019年1月1日全国各地气温预测',
                        left: 'center',
                        top: 'top',
                        textStyle: {
                            color: '#fff'
                        }
                    },
                    tooltip: {
                        trigger: 'item'
                    },
                    visualMap:
                        {
                            min: -29,
                            max: 20,
                            left: 'left',
                            top: 'bottom',
                            calculable: true,
                            inRange:
                                {
                                    color: ['#24b7f2', '#f2c31a','#ff0000']
                                },
                            textStyle:
                                {
                                    color: '#fff'
                                }
                        },
                    geo: {
                        map: 'china',
                        roam: true,
                        label: {
                            emphasis: {
                                show: false
                            }
                        },
                        itemStyle: {
                            normal: {
                                areaColor: '#323c48',
                                borderColor: '#111'
                            },
                            emphasis: {
                                areaColor: '#2a333d'
                            }
                        }
                    },
                    series: [{
                        name: '预测气温',
                        type: 'scatter',
                        coordinateSystem: 'geo',
                        symbolSize: 4,
                        large: true,
                        itemStyle: {
                            normal: {
                                shadowBlur: 2,
                                shadowColor: 'rgba(37, 140, 249, 0.8)',
                                color: 'rgba(37, 140, 249, 0.8)'
                            }
                        },
                        data: temperature
                    }]
                    };
                }

            //对提交按钮进行添加动作
            $("#id-btn").click(function () {
                $.ajax({
                    url: "${path}/tianqisys/totime",
                    type: "GET",
                    data: $("#submit_form").serialize(),
                    success: function (result) {
                        alert("提价成功！");
                        wendu_Data(result);
                        fengli_Data(result);
                    }

                })
            });

            //对风力等级数据进行处理
            function fengli_Data(result) {
                dengji_data = [];

                var tianqi = result.extend.tianqiyubaolist;

                $.each(tianqi, function (index, item) {
                    dengji_data.push({
                        name: item.city,
                        value: [item.jd, item.wd, item.jibie]
                    });
                });

                d1 = [];
                d2 = [];
                d3 = [];
                d4 = [];
                for (var i = 0; i < dengji_data.length; i++) {
                    if (dengji_data[i].value[2] > 0 && dengji_data[i].value[2] <= 3) {
                        d1.push({
                            name: dengji_data[i].name,
                            value: dengji_data[i].value
                        });
                    } else if (dengji_data[i].value[2] >= 4 && dengji_data[i].value[2] <= 6) {
                        d2.push({
                            name: dengji_data[i].name,
                            value: dengji_data[i].value
                        });
                    } else if (dengji_data[i].value[2] >= 7 && dengji_data[i].value[2] <= 10) {
                        d3.push({
                            name: dengji_data[i].name,
                            value: dengji_data[i].value
                        });
                    } else {
                        d4.push({
                            name: dengji_data[i].name,
                            value: dengji_data[i].value
                        });
                    }
                }


                //风力指数
                option5 = {

                    backgroundColor: '000000',
                    title: {
                        text: '全国各地风力指数',
                        left: 'center',
                        top: 'top',
                        textStyle: {
                            color: '#fff'
                        }
                    },
                    tooltip: {},
                    legend: {
                        left: 'left',
                        data: ['微风', '强风', '大风', '狂风'],
                        textStyle: {
                            color: '#ccc'
                        }
                    },
                    geo: {
                        map: 'china',
                        roam: true,
                        label: {
                            emphasis: {
                                show: false
                            }
                        },
                        itemStyle: {
                            normal: {
                                areaColor: '#323c48',
                                borderColor: '#111'
                            },
                            emphasis: {
                                areaColor: '#2a333d'
                            }
                        }
                    },
                    series: [{
                        name: '微风',
                        type: 'scatter',
                        coordinateSystem: 'geo',
                        symbolSize: 4,
                        large: true,
                        itemStyle: {
                            normal: {
                                shadowBlur: 2,
                                shadowColor: 'rgba(37, 140, 249, 0.8)',
                                color: 'rgba(37, 140, 249, 0.8)'
                            }
                        },
                        data: d1
                    }, {
                        name: '强风',
                        type: 'scatter',
                        coordinateSystem: 'geo',
                        symbolSize: 4,
                        large: true,
                        itemStyle: {
                            normal: {
                                shadowBlur: 2,
                                shadowColor: 'rgba(50,190,242, 0.8)',
                                color: 'rgba(50,190,242, 0.8)'
                            }
                        },
                        data: d2

                    }, {
                        name: '大风',
                        type: 'scatter',
                        coordinateSystem: 'geo',
                        symbolSize: 4,
                        large: true,
                        itemStyle: {
                            normal: {
                                shadowBlur: 2,
                                shadowColor: 'rgba(14,230,242, 0.8)',
                                color: 'rgba(14,230,242, 0.8)'
                            }
                        },
                        data: d3
                    }, {
                        name: '狂风',
                        type: 'scatter',
                        coordinateSystem: 'geo',
                        symbolSize: 4,
                        large: true,
                        itemStyle: {
                            normal: {
                                shadowBlur: 2,
                                shadowColor: 'rgba(255,255,255, 0.8)',
                                color: 'rgba(255,255,255, 0.8)'
                            }
                        },
                        data: d4
                    }]
                };
            }

            //设置对页面进行切换操作
            $(".my-btn").click(function () {

                $(".model").eq(0).show();
                var index = $(this).index()
                switch (index) {
                    case 0:
                        $("#id3").addClass("active");

                        myChart.clear();
                        myChart.setOption(option2);
                        ;
                        break;
                    case 1:
                        $("#id3").removeClass("active");

                        myChart.clear();
                        myChart.setOption(option5);

                        break;
                    case 2:
                        $("#id3").addClass("active");

                        myChart.clear();
                        // 预测气温
                        myChart.setOption(option1);
                        break;

                    default:
                        break;
                }
            });
        </script>

        <!-- 右侧主体结束 -->

        <!-- 中部结束 -->
        <!-- 底部开始 -->
        <div class="footer">

        </div>
        <!-- 底部结束 -->
        <!-- 背景切换开始 -->
        <div class="bg-changer">
            <div class="swiper-container changer-list">
                <div class="swiper-wrapper">
                    <div class="swiper-slide"><img class="item" src="<c:url value="//static/images/a.jpg"/>" alt="">
                    </div>
                    <div class="swiper-slide"><img class="item" src="<c:url value="//static/images/b.jpg"/>" alt="">
                    </div>
                    <div class="swiper-slide"><img class="item" src="<c:url value="//static/images/c.jpg"/>" alt="">
                    </div>
                    <div class="swiper-slide"><img class="item" src="<c:url value="//static/images/d.jpg"/>" alt="">
                    </div>
                    <div class="swiper-slide"><img class="item" src="<c:url value="//static/images/e.jpg"/>" alt="">
                    </div>
                    <div class="swiper-slide"><img class="item" src="<c:url value="//static/images/f.jpg"/>" alt="">
                    </div>
                    <div class="swiper-slide"><img class="item" src="<c:url value="//static/images/j.jpg"/>" alt="">
                    </div>
                    <div class="swiper-slide"><img class="item" src="<c:url value="//static/images/h.jpg"/>" alt="">
                    </div>
                    <div class="swiper-slide"><img class="item" src="<c:url value="//static/images/i.jpg"/>" alt="">
                    </div>
                    <div class="swiper-slide"><img class="item" src="<c:url value="//static/images/j.jpg"/>" alt="">
                    </div>
                    <div class="swiper-slide"><img class="item" src="<c:url value="//static/images/k.jpg"/>" alt="">
                    </div>
                    <div class="swiper-slide"><span class="reset">初始化</span></div>
                </div>
            </div>
            <div class="bg-out"></div>
        </div>
    </div>
</div>
</body>
</html>
