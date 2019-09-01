package com.sjp.pojo;

public class tianqiyubao {

    private int sid;
    private String city;
    private String time;
    private String tianqi;
    private String windy;
    private int wd_max;
    private int wd_min;
    private float jd;
    private float wd;
    private String feng;
    private int jibie;
    private int year;
    private int month;
    private int day;
    private float pred;



    public tianqiyubao() {
    }

    public tianqiyubao(int sid, String city, String time, String tianqi, String windy, int wd_max, int wd_min, float jd, float wd, String feng, int jibie, int year, int month, int day, float pred) {
        this.sid = sid;
        this.city = city;
        this.time = time;
        this.tianqi = tianqi;
        this.windy = windy;
        this.wd_max = wd_max;
        this.wd_min = wd_min;
        this.jd = jd;
        this.wd = wd;
        this.feng = feng;
        this.jibie = jibie;
        this.year = year;
        this.month = month;
        this.day = day;
        this.pred = pred;
    }

    public tianqiyubao(String city, String time, String tianqi, String windy, int wd_max, int wd_min, float jd, float wd, String feng, int jibie, int year, int month, int day, float pred) {
        this.city = city;
        this.time = time;
        this.tianqi = tianqi;
        this.windy = windy;
        this.wd_max = wd_max;
        this.wd_min = wd_min;
        this.jd = jd;
        this.wd = wd;
        this.feng = feng;
        this.jibie = jibie;
        this.year = year;
        this.month = month;
        this.day = day;
        this.pred = pred;
    }

    public float getPred() {
        return pred;
    }

    public void setPred(float pred) {
        this.pred = pred;
    }

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getTianqi() {
        return tianqi;
    }

    public void setTianqi(String tianqi) {
        this.tianqi = tianqi;
    }

    public String getWindy() {
        return windy;
    }

    public void setWindy(String windy) {
        this.windy = windy;
    }

    public int getWd_max() {
        return wd_max;
    }

    public void setWd_max(int wd_max) {
        this.wd_max = wd_max;
    }

    public int getWd_min() {
        return wd_min;
    }

    public void setWd_min(int wd_min) {
        this.wd_min = wd_min;
    }

    public float getJd() {
        return jd;
    }

    public void setJd(float jd) {
        this.jd = jd;
    }

    public float getWd() {
        return wd;
    }

    public void setWd(float wd) {
        this.wd = wd;
    }

    public String getFeng() {
        return feng;
    }

    public void setFeng(String feng) {
        this.feng = feng;
    }

    public int getJibie() {
        return jibie;
    }

    public void setJibie(int jibie) {
        this.jibie = jibie;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    public int getDay() {
        return day;
    }

    public void setDay(int day) {
        this.day = day;
    }

    @Override
    public String toString() {
        return "tianqiyubao{" +
                "sid=" + sid +
                ", city='" + city + '\'' +
                ", time='" + time + '\'' +
                ", tianqi='" + tianqi + '\'' +
                ", windy='" + windy + '\'' +
                ", wd_max=" + wd_max +
                ", wd_min=" + wd_min +
                ", jd=" + jd +
                ", wd=" + wd +
                ", feng='" + feng + '\'' +
                ", jibie=" + jibie +
                ", year=" + year +
                ", month=" + month +
                ", day=" + day +
                '}';
    }
}
