<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<% String appPath = request.getContextPath(); %>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    基于SSM框架的管理系统：简单实现增、删、改、查。
                </h1>
            </div>
        </div>
    </div>

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>论文列表 —— 显示所有论文</small>
                </h1>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 column">
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>编号</th>
                    <th>城市</th>
                    <th>时间</th>
                    <th>天气</th>
                    <th>风力风向</th>
                    <th>温度最大值</th>
                    <th>温度最小值</th>
                    <th>经度</th>
                    <th>纬度</th>
                    <th>风力</th>
                    <th>级别</th>
                    <th>年</th>
                    <th>月</th>
                    <th>日</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="tianqiyubao" items="${requestScope.get('tianqiyubaos')}" varStatus="status">
                    <tr>
                        <td>${tianqiyubao.sid}</td>
                        <td>${tianqiyubao.city}</td>
                        <td>${tianqiyubao.time}</td>
                        <td>${tianqiyubao.tianqi}</td>
                        <td>${tianqiyubao.windy}</td>
                        <td>${tianqiyubao.wd_max}</td>
                        <td>${tianqiyubao.wd_min}</td>
                        <td>${tianqiyubao.jd}</td>
                        <td>${tianqiyubao.wd}</td>
                        <td>${tianqiyubao.feng}</td>
                        <td>${tianqiyubao.jibie}</td>
                        <td>${tianqiyubao.year}</td>
                        <td>${tianqiyubao.month}</td>
                        <td>${tianqiyubao.day}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
