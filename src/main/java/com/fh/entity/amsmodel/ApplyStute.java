package com.fh.entity.amsmodel;

import java.util.Date;

public class ApplyStute {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column ams_apply_stute.ID
     *
     * @mbggenerated Mon Jul 04 15:29:41 CST 2016
     */
    private Integer id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column ams_apply_stute.Apply_id
     *
     * @mbggenerated Mon Jul 04 15:29:41 CST 2016
     */
    private Integer applyId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column ams_apply_stute.user_id
     *
     * @mbggenerated Mon Jul 04 15:29:41 CST 2016
     */
    private String userId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column ams_apply_stute.user_id2
     *
     * @mbggenerated Mon Jul 04 15:29:41 CST 2016
     */
    private String userId2;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column ams_apply_stute.stute
     *
     * @mbggenerated Mon Jul 04 15:29:41 CST 2016
     * 1，同意
     * 0，不同意
     * 2，提交给他人
     * 3，已经归还
     * 4，等待归还
     */
    private int stute;
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column ams_apply_stute.stute_desc
     *
     * @mbggenerated Mon Jul 04 15:29:41 CST 2016
     */
    private String stuteDesc;
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column ams_apply_stute.stute_time
     *
     * @mbggenerated Mon Jul 04 15:29:41 CST 2016
     */
    private Date stuteTime;
    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column ams_apply_stute.ID
     *
     * @return the value of ams_apply_stute.ID
     *
     * @mbggenerated Mon Jul 04 15:29:41 CST 2016
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column ams_apply_stute.ID
     *
     * @param id the value for ams_apply_stute.ID
     *
     * @mbggenerated Mon Jul 04 15:29:41 CST 2016
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column ams_apply_stute.Apply_id
     *
     * @return the value of ams_apply_stute.Apply_id
     *
     * @mbggenerated Mon Jul 04 15:29:41 CST 2016
     */
    public Integer getApplyId() {
        return applyId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column ams_apply_stute.Apply_id
     *
     * @param applyId the value for ams_apply_stute.Apply_id
     *
     * @mbggenerated Mon Jul 04 15:29:41 CST 2016
     */
    public void setApplyId(Integer applyId) {
        this.applyId = applyId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column ams_apply_stute.user_id
     *
     * @return the value of ams_apply_stute.user_id
     *
     * @mbggenerated Mon Jul 04 15:29:41 CST 2016
     */
    public String getUserId() {
        return userId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column ams_apply_stute.user_id
     *
     * @param userId the value for ams_apply_stute.user_id
     *
     * @mbggenerated Mon Jul 04 15:29:41 CST 2016
     */
    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column ams_apply_stute.user_id2
     *
     * @return the value of ams_apply_stute.user_id2
     *
     * @mbggenerated Mon Jul 04 15:29:41 CST 2016
     */
    public String getUserId2() {
        return userId2;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column ams_apply_stute.user_id2
     *
     * @param userId2 the value for ams_apply_stute.user_id2
     *
     * @mbggenerated Mon Jul 04 15:29:41 CST 2016
     */
    public void setUserId2(String userId2) {
        this.userId2 = userId2 == null ? null : userId2.trim();
    }


    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column ams_apply_stute.stute_desc
     *
     * @return the value of ams_apply_stute.stute_desc
     *
     * @mbggenerated Mon Jul 04 15:29:41 CST 2016
     */
    public String getStuteDesc() {
        return stuteDesc;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column ams_apply_stute.stute_desc
     *
     * @param stuteDesc the value for ams_apply_stute.stute_desc
     *
     * @mbggenerated Mon Jul 04 15:29:41 CST 2016
     */
    public void setStuteDesc(String stuteDesc) {
        this.stuteDesc = stuteDesc == null ? null : stuteDesc.trim();
    }
       
    

    public int getStute() {
		return stute;
	}

	public void setStute(int stute) {
		this.stute = stute;
	}

	/**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column ams_apply_stute.stute_time
     *
     * @return the value of ams_apply_stute.stute_time
     *
     * @mbggenerated Mon Jul 04 15:29:41 CST 2016
     */
    public Date getStuteTime() {
        return stuteTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column ams_apply_stute.stute_time
     *
     * @param stuteTime the value for ams_apply_stute.stute_time
     *
     * @mbggenerated Mon Jul 04 15:29:41 CST 2016
     */
    public void setStuteTime(Date stuteTime) {
        this.stuteTime = stuteTime;
    }
}