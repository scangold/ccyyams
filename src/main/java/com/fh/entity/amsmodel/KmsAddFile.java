package com.fh.entity.amsmodel;

import java.util.Date;

public class KmsAddFile {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column kms_addfile.ID
     *
     * @mbggenerated Mon Feb 05 03:14:58 CST 2018
     */
    private String id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column kms_addfile.KMS_ID
     *
     * @mbggenerated Mon Feb 05 03:14:58 CST 2018
     */
    private Integer kmsId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column kms_addfile.NAME
     *
     * @mbggenerated Mon Feb 05 03:14:58 CST 2018
     */
    private String name;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column kms_addfile.PATH
     *
     * @mbggenerated Mon Feb 05 03:14:58 CST 2018
     */
    private String path;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column kms_addfile.CREATETIME
     *
     * @mbggenerated Mon Feb 05 03:14:58 CST 2018
     */
    private Date createtime;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column kms_addfile.REMARK
     *
     * @mbggenerated Mon Feb 05 03:14:58 CST 2018
     */
    private String remark;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column kms_addfile.ID
     *
     * @return the value of kms_addfile.ID
     *
     * @mbggenerated Mon Feb 05 03:14:58 CST 2018
     */
    public String getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column kms_addfile.ID
     *
     * @param id the value for kms_addfile.ID
     *
     * @mbggenerated Mon Feb 05 03:14:58 CST 2018
     */
    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column kms_addfile.KMS_ID
     *
     * @return the value of kms_addfile.KMS_ID
     *
     * @mbggenerated Mon Feb 05 03:14:58 CST 2018
     */
    public Integer getKmsId() {
        return kmsId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column kms_addfile.KMS_ID
     *
     * @param kmsId the value for kms_addfile.KMS_ID
     *
     * @mbggenerated Mon Feb 05 03:14:58 CST 2018
     */
    public void setKmsId(Integer kmsId) {
        this.kmsId = kmsId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column kms_addfile.NAME
     *
     * @return the value of kms_addfile.NAME
     *
     * @mbggenerated Mon Feb 05 03:14:58 CST 2018
     */
    public String getName() {
        return name;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column kms_addfile.NAME
     *
     * @param name the value for kms_addfile.NAME
     *
     * @mbggenerated Mon Feb 05 03:14:58 CST 2018
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column kms_addfile.PATH
     *
     * @return the value of kms_addfile.PATH
     *
     * @mbggenerated Mon Feb 05 03:14:58 CST 2018
     */
    public String getPath() {
        return path;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column kms_addfile.PATH
     *
     * @param path the value for kms_addfile.PATH
     *
     * @mbggenerated Mon Feb 05 03:14:58 CST 2018
     */
    public void setPath(String path) {
        this.path = path == null ? null : path.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column kms_addfile.CREATETIME
     *
     * @return the value of kms_addfile.CREATETIME
     *
     * @mbggenerated Mon Feb 05 03:14:58 CST 2018
     */
    public Date getCreatetime() {
        return createtime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column kms_addfile.CREATETIME
     *
     * @param createtime the value for kms_addfile.CREATETIME
     *
     * @mbggenerated Mon Feb 05 03:14:58 CST 2018
     */
    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column kms_addfile.REMARK
     *
     * @return the value of kms_addfile.REMARK
     *
     * @mbggenerated Mon Feb 05 03:14:58 CST 2018
     */
    public String getRemark() {
        return remark;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column kms_addfile.REMARK
     *
     * @param remark the value for kms_addfile.REMARK
     *
     * @mbggenerated Mon Feb 05 03:14:58 CST 2018
     */
    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}