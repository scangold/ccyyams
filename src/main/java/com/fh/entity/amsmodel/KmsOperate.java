package com.fh.entity.amsmodel;

import java.util.Date;

public class KmsOperate {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column kms_operate.KMS_OP_ID
     *
     * @mbggenerated Wed Aug 16 11:38:43 CST 2017
     */
    private Integer kmsOpId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column kms_operate.OP_TIME
     *
     * @mbggenerated Wed Aug 16 11:38:43 CST 2017
     */
    private Date opTime;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column kms_operate.OP_USER_ID
     *
     * @mbggenerated Wed Aug 16 11:38:43 CST 2017
     */
    private Integer opUserId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column kms_operate.OP_NAME
     *
     * @mbggenerated Wed Aug 16 11:38:43 CST 2017
     */
    private String opName;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column kms_operate.OP_CONTENT_ID
     *
     * @mbggenerated Wed Aug 16 11:38:43 CST 2017
     */
    private Integer opContentId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column kms_operate.OP_REMARK
     *
     * @mbggenerated Wed Aug 16 11:38:43 CST 2017
     */
    private String opRemark;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column kms_operate.OP_TYPE_ID
     *
     * @mbggenerated Wed Aug 16 11:38:43 CST 2017
     */
    private Integer opTypeId;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column kms_operate.KMS_OP_ID
     *
     * @return the value of kms_operate.KMS_OP_ID
     *
     * @mbggenerated Wed Aug 16 11:38:43 CST 2017
     */
    public Integer getKmsOpId() {
        return kmsOpId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column kms_operate.KMS_OP_ID
     *
     * @param kmsOpId the value for kms_operate.KMS_OP_ID
     *
     * @mbggenerated Wed Aug 16 11:38:43 CST 2017
     */
    public void setKmsOpId(Integer kmsOpId) {
        this.kmsOpId = kmsOpId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column kms_operate.OP_TIME
     *
     * @return the value of kms_operate.OP_TIME
     *
     * @mbggenerated Wed Aug 16 11:38:43 CST 2017
     */
    public Date getOpTime() {
        return opTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column kms_operate.OP_TIME
     *
     * @param opTime the value for kms_operate.OP_TIME
     *
     * @mbggenerated Wed Aug 16 11:38:43 CST 2017
     */
    public void setOpTime(Date opTime) {
        this.opTime = opTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column kms_operate.OP_USER_ID
     *
     * @return the value of kms_operate.OP_USER_ID
     *
     * @mbggenerated Wed Aug 16 11:38:43 CST 2017
     */
    public Integer getOpUserId() {
        return opUserId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column kms_operate.OP_USER_ID
     *
     * @param opUserId the value for kms_operate.OP_USER_ID
     *
     * @mbggenerated Wed Aug 16 11:38:43 CST 2017
     */
    public void setOpUserId(Integer opUserId) {
        this.opUserId = opUserId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column kms_operate.OP_NAME
     *
     * @return the value of kms_operate.OP_NAME
     *
     * @mbggenerated Wed Aug 16 11:38:43 CST 2017
     */
    public String getOpName() {
        return opName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column kms_operate.OP_NAME
     *
     * @param opName the value for kms_operate.OP_NAME
     *
     * @mbggenerated Wed Aug 16 11:38:43 CST 2017
     */
    public void setOpName(String opName) {
        this.opName = opName == null ? null : opName.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column kms_operate.OP_CONTENT_ID
     *
     * @return the value of kms_operate.OP_CONTENT_ID
     *
     * @mbggenerated Wed Aug 16 11:38:43 CST 2017
     */
    public Integer getOpContentId() {
        return opContentId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column kms_operate.OP_CONTENT_ID
     *
     * @param opContentId the value for kms_operate.OP_CONTENT_ID
     *
     * @mbggenerated Wed Aug 16 11:38:43 CST 2017
     */
    public void setOpContentId(Integer opContentId) {
        this.opContentId = opContentId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column kms_operate.OP_REMARK
     *
     * @return the value of kms_operate.OP_REMARK
     *
     * @mbggenerated Wed Aug 16 11:38:43 CST 2017
     */
    public String getOpRemark() {
        return opRemark;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column kms_operate.OP_REMARK
     *
     * @param opRemark the value for kms_operate.OP_REMARK
     *
     * @mbggenerated Wed Aug 16 11:38:43 CST 2017
     */
    public void setOpRemark(String opRemark) {
        this.opRemark = opRemark == null ? null : opRemark.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column kms_operate.OP_TYPE_ID
     *
     * @return the value of kms_operate.OP_TYPE_ID
     *
     * @mbggenerated Wed Aug 16 11:38:43 CST 2017
     */
    public Integer getOpTypeId() {
        return opTypeId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column kms_operate.OP_TYPE_ID
     *
     * @param opTypeId the value for kms_operate.OP_TYPE_ID
     *
     * @mbggenerated Wed Aug 16 11:38:43 CST 2017
     */
    public void setOpTypeId(Integer opTypeId) {
        this.opTypeId = opTypeId;
    }
}