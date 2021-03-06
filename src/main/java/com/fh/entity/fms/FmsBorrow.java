package com.fh.entity.fms;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

public class FmsBorrow {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column fms_borrow.ID
     *
     * @mbggenerated Mon Jul 31 16:05:40 CST 2017
     */
    private String id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column fms_borrow.NAME
     *
     * @mbggenerated Mon Jul 31 16:05:40 CST 2017
     */
    private String name;
    private String borrow_user_id;
    private String return_user_id;
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column fms_borrow.DESCRIBLE
     *
     * @mbggenerated Mon Jul 31 16:05:40 CST 2017
     */
    private String describle;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column fms_borrow.CREATETIME
     *
     * @mbggenerated Mon Jul 31 16:05:40 CST 2017
     */
    private Date createtime;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column fms_borrow.STARTTIME
     *
     * @mbggenerated Mon Jul 31 16:05:40 CST 2017
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd") 
    private Date starttime;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column fms_borrow.ENDTiME
     *
     * @mbggenerated Mon Jul 31 16:05:40 CST 2017
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd") 
    private Date endtime;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column fms_borrow.NOWENDTIME
     *
     * @mbggenerated Mon Jul 31 16:05:40 CST 2017
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd") 
    private Date nowendtime;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column fms_borrow.ISVALID
     *
     * @mbggenerated Mon Jul 31 16:05:40 CST 2017
     */
    private Integer isvalid;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column fms_borrow.STATE
     *
     * @mbggenerated Mon Jul 31 16:05:40 CST 2017
     */
    private String state;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column fms_borrow.ID
     *
     * @return the value of fms_borrow.ID
     *
     * @mbggenerated Mon Jul 31 16:05:40 CST 2017    private Date endtime;
     */
    private List<FmsDocMain> fmsDocMains;
    
    public List<FmsDocMain> getFmsDocMains() {
		return fmsDocMains;
	}

	public void setFmsDocMains(List<FmsDocMain> fmsDocMains) {
		this.fmsDocMains = fmsDocMains;
	}

	public String getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column fms_borrow.ID
     *
     * @param id the value for fms_borrow.ID
     *
     * @mbggenerated Mon Jul 31 16:05:40 CST 2017
     */
    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column fms_borrow.NAME
     *
     * @return the value of fms_borrow.NAME
     *
     * @mbggenerated Mon Jul 31 16:05:40 CST 2017
     */
    public String getName() {
        return name;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column fms_borrow.NAME
     *
     * @param name the value for fms_borrow.NAME
     *
     * @mbggenerated Mon Jul 31 16:05:40 CST 2017
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column fms_borrow.DESCRIBLE
     *
     * @return the value of fms_borrow.DESCRIBLE
     *
     * @mbggenerated Mon Jul 31 16:05:40 CST 2017
     */
    public String getDescrible() {
        return describle;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column fms_borrow.DESCRIBLE
     *
     * @param describle the value for fms_borrow.DESCRIBLE
     *
     * @mbggenerated Mon Jul 31 16:05:40 CST 2017
     */
    public void setDescrible(String describle) {
        this.describle = describle == null ? null : describle.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column fms_borrow.CREATETIME
     *
     * @return the value of fms_borrow.CREATETIME
     *
     * @mbggenerated Mon Jul 31 16:05:40 CST 2017
     */
    public Date getCreatetime() {
        return createtime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column fms_borrow.CREATETIME
     *
     * @param createtime the value for fms_borrow.CREATETIME
     *
     * @mbggenerated Mon Jul 31 16:05:40 CST 2017
     */
    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column fms_borrow.STARTTIME
     *
     * @return the value of fms_borrow.STARTTIME
     *
     * @mbggenerated Mon Jul 31 16:05:40 CST 2017
     */
    public Date getStarttime() {
        return starttime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column fms_borrow.STARTTIME
     *
     * @param starttime the value for fms_borrow.STARTTIME
     *
     * @mbggenerated Mon Jul 31 16:05:40 CST 2017
     */
    public void setStarttime(Date starttime) {
        this.starttime = starttime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column fms_borrow.ENDTiME
     *
     * @return the value of fms_borrow.ENDTiME
     *
     * @mbggenerated Mon Jul 31 16:05:40 CST 2017
     */
    public Date getEndtime() {
        return endtime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column fms_borrow.ENDTiME
     *
     * @param endtime the value for fms_borrow.ENDTiME
     *
     * @mbggenerated Mon Jul 31 16:05:40 CST 2017
     */
    public void setEndtime(Date endtime) {
        this.endtime = endtime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column fms_borrow.NOWENDTIME
     *
     * @return the value of fms_borrow.NOWENDTIME
     *
     * @mbggenerated Mon Jul 31 16:05:40 CST 2017
     */
    public Date getNowendtime() {
        return nowendtime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column fms_borrow.NOWENDTIME
     *
     * @param nowendtime the value for fms_borrow.NOWENDTIME
     *
     * @mbggenerated Mon Jul 31 16:05:40 CST 2017
     */
    public void setNowendtime(Date nowendtime) {
        this.nowendtime = nowendtime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column fms_borrow.ISVALID
     *
     * @return the value of fms_borrow.ISVALID
     *
     * @mbggenerated Mon Jul 31 16:05:40 CST 2017
     */
    public Integer getIsvalid() {
        return isvalid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column fms_borrow.ISVALID
     *
     * @param isvalid the value for fms_borrow.ISVALID
     *
     * @mbggenerated Mon Jul 31 16:05:40 CST 2017
     */
    public void setIsvalid(Integer isvalid) {
        this.isvalid = isvalid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column fms_borrow.STATE
     *
     * @return the value of fms_borrow.STATE
     *
     * @mbggenerated Mon Jul 31 16:05:40 CST 2017
     */
    public String getState() {
        return state;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column fms_borrow.STATE
     *
     * @param state the value for fms_borrow.STATE
     *
     * @mbggenerated Mon Jul 31 16:05:40 CST 2017
     */
    public void setState(String state) {
        this.state = state == null ? null : state.trim();
    }

	public String getBorrow_user_id() {
		return borrow_user_id;
	}

	public void setBorrow_user_id(String borrow_user_id) {
		this.borrow_user_id = borrow_user_id;
	}

	public String getReturn_user_id() {
		return return_user_id;
	}

	public void setReturn_user_id(String return_user_id) {
		this.return_user_id = return_user_id;
	}
}