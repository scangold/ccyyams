package com.fh.entity.fms;

import java.util.Date;
import java.util.List;

import com.fh.entity.system.Department;
import com.fh.entity.system.User;

public class FmsDocMain {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column fms_docmain.ID
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    private String id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column fms_docmain.fms_ID
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    private String fmsId;
    
    private FmsDocBox fmsDocBox;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column fms_docmain.USER_ID
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    private String userId;
    /**
     * 操作者
     */
    private  User  user;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column fms_docmain.TITLE
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    private String title;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column fms_docmain.KEYWORD
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    private String keyword;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column fms_docmain.PRECISE
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    private String precise;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column fms_docmain.CLASSTYPE
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    private String classtype;
    
    private FmsDataDictItem classtypeFmsDataDictItem;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column fms_docmain.OWNER
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    private String owner;
    
    private Department ownerDepartment;
    
   

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column fms_docmain.SUBOWNER
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    private String subowner;
    private Department subownerDepartment;
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column fms_docmain.DOCNUM
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    private String docnum;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column fms_docmain.SEQUENCENUM
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    private String sequencenum;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column fms_docmain.PS
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    private String ps;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column fms_docmain.DOCLEVEL
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    private String doclevel;
    private FmsDataDictItem doclevelFmsDataDictItem;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column fms_docmain.CREATETIME
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    private Date createtime;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column fms_docmain.SFNUMBER
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    private String sfnumber;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column fms_docmain.SFTIIME
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    private Date sftiime;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column fms_docmain.SUMNUMBER
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    private String sumnumber;
    private FmsDataDictItem sumnumberFmsDataDictItem;


    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column fms_docmain.FILEYEAR
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    private String fileyear;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column fms_docmain.VALIDPERIOD
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    private Integer validperiod;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column fms_docmain.SECRETLEVEL
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    private String secretlevel;
    private FmsDataDictItem secretlevelFmsDataDictItem;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column fms_docmain.PAGES
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    private Integer pages;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column fms_docmain.SUBCOPIES
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    private Integer subcopies;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column fms_docmain.ISVALID
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    private Short isvalid;
  

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column fms_docmain.Superordinateclass
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    private String superordinateclass;
    private FmsDataDictItem superordinateclassFmsDataDictItem;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column fms_docmain.SubordinateCLASS
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    private String subordinateclass;
    private FmsDataDictItem subordinateclassFmsDataDictItem;
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column fms_docmain.Medianclass
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    private String medianclass;
    private FmsDataDictItem medianclassFmsDataDictItem;
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column fms_docmain.spec
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    private String spec;

    private FmsDataDictItem specFmsDataDictItem;
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column fms_docmain.carrier
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    private String carrier;
    private FmsDataDictItem carrierDataDictItem;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column fms_docmain. pagination
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    private Integer pagination;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column fms_docmain.docid
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    private String docid;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column fms_docmain.ID
     *
     * @return the value of fms_docmain.ID
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    
    private List<FmsAddFile> fmsAddFiles;
    
    
    
  


	public List<FmsAddFile> getFmsAddFiles() {
		return fmsAddFiles;
	}

	public void setFmsAddFiles(List<FmsAddFile> fmsAddFiles) {
		this.fmsAddFiles = fmsAddFiles;
	}

	public String getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column fms_docmain.ID
     *
     * @param id the value for fms_docmain.ID
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column fms_docmain.fms_ID
     *
     * @return the value of fms_docmain.fms_ID
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    public String getFmsId() {
        return fmsId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column fms_docmain.fms_ID
     *
     * @param fmsId the value for fms_docmain.fms_ID
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    public void setFmsId(String fmsId) {
        this.fmsId = fmsId == null ? null : fmsId.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column fms_docmain.USER_ID
     *
     * @return the value of fms_docmain.USER_ID
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    public String getUserId() {
        return userId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column fms_docmain.USER_ID
     *
     * @param userId the value for fms_docmain.USER_ID
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column fms_docmain.TITLE
     *
     * @return the value of fms_docmain.TITLE
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    public String getTitle() {
        return title;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column fms_docmain.TITLE
     *
     * @param title the value for fms_docmain.TITLE
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column fms_docmain.KEYWORD
     *
     * @return the value of fms_docmain.KEYWORD
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    public String getKeyword() {
        return keyword;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column fms_docmain.KEYWORD
     *
     * @param keyword the value for fms_docmain.KEYWORD
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    public void setKeyword(String keyword) {
        this.keyword = keyword == null ? null : keyword.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column fms_docmain.PRECISE
     *
     * @return the value of fms_docmain.PRECISE
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    public String getPrecise() {
        return precise;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column fms_docmain.PRECISE
     *
     * @param precise the value for fms_docmain.PRECISE
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    public void setPrecise(String precise) {
        this.precise = precise == null ? null : precise.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column fms_docmain.CLASSTYPE
     *
     * @return the value of fms_docmain.CLASSTYPE
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    public String getClasstype() {
        return classtype;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column fms_docmain.CLASSTYPE
     *
     * @param classtype the value for fms_docmain.CLASSTYPE
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    public void setClasstype(String classtype) {
        this.classtype = classtype == null ? null : classtype.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column fms_docmain.OWNER
     *
     * @return the value of fms_docmain.OWNER
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    public String getOwner() {
        return owner;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column fms_docmain.OWNER
     *
     * @param owner the value for fms_docmain.OWNER
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    public void setOwner(String owner) {
        this.owner = owner == null ? null : owner.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column fms_docmain.SUBOWNER
     *
     * @return the value of fms_docmain.SUBOWNER
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    public String getSubowner() {
        return subowner;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column fms_docmain.SUBOWNER
     *
     * @param subowner the value for fms_docmain.SUBOWNER
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    public void setSubowner(String subowner) {
        this.subowner = subowner == null ? null : subowner.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column fms_docmain.DOCNUM
     *
     * @return the value of fms_docmain.DOCNUM
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    public String getDocnum() {
        return docnum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column fms_docmain.DOCNUM
     *
     * @param docnum the value for fms_docmain.DOCNUM
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    public void setDocnum(String docnum) {
        this.docnum = docnum == null ? null : docnum.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column fms_docmain.SEQUENCENUM
     *
     * @return the value of fms_docmain.SEQUENCENUM
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    public String getSequencenum() {
        return sequencenum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column fms_docmain.SEQUENCENUM
     *
     * @param sequencenum the value for fms_docmain.SEQUENCENUM
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    public void setSequencenum(String sequencenum) {
        this.sequencenum = sequencenum == null ? null : sequencenum.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column fms_docmain.PS
     *
     * @return the value of fms_docmain.PS
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    public String getPs() {
        return ps;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column fms_docmain.PS
     *
     * @param ps the value for fms_docmain.PS
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    public void setPs(String ps) {
        this.ps = ps == null ? null : ps.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column fms_docmain.DOCLEVEL
     *
     * @return the value of fms_docmain.DOCLEVEL
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    public String getDoclevel() {
        return doclevel;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column fms_docmain.DOCLEVEL
     *
     * @param doclevel the value for fms_docmain.DOCLEVEL
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    public void setDoclevel(String doclevel) {
        this.doclevel = doclevel == null ? null : doclevel.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column fms_docmain.CREATETIME
     *
     * @return the value of fms_docmain.CREATETIME
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    public Date getCreatetime() {
        return createtime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column fms_docmain.CREATETIME
     *
     * @param createtime the value for fms_docmain.CREATETIME
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column fms_docmain.SFNUMBER
     *
     * @return the value of fms_docmain.SFNUMBER
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    public String getSfnumber() {
        return sfnumber;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column fms_docmain.SFNUMBER
     *
     * @param sfnumber the value for fms_docmain.SFNUMBER
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    public void setSfnumber(String sfnumber) {
        this.sfnumber = sfnumber == null ? null : sfnumber.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column fms_docmain.SFTIIME
     *
     * @return the value of fms_docmain.SFTIIME
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    public Date getSftiime() {
        return sftiime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column fms_docmain.SFTIIME
     *
     * @param sftiime the value for fms_docmain.SFTIIME
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    public void setSftiime(Date sftiime) {
        this.sftiime = sftiime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column fms_docmain.SUMNUMBER
     *
     * @return the value of fms_docmain.SUMNUMBER
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    public String getSumnumber() {
        return sumnumber;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column fms_docmain.SUMNUMBER
     *
     * @param sumnumber the value for fms_docmain.SUMNUMBER
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    public void setSumnumber(String sumnumber) {
        this.sumnumber = sumnumber == null ? null : sumnumber.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column fms_docmain.FILEYEAR
     *
     * @return the value of fms_docmain.FILEYEAR
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    public String getFileyear() {
        return fileyear;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column fms_docmain.FILEYEAR
     *
     * @param fileyear the value for fms_docmain.FILEYEAR
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    public void setFileyear(String fileyear) {
        this.fileyear = fileyear == null ? null : fileyear.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column fms_docmain.VALIDPERIOD
     *
     * @return the value of fms_docmain.VALIDPERIOD
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    public Integer getValidperiod() {
        return validperiod;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column fms_docmain.VALIDPERIOD
     *
     * @param validperiod the value for fms_docmain.VALIDPERIOD
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    public void setValidperiod(Integer validperiod) {
        this.validperiod = validperiod;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column fms_docmain.SECRETLEVEL
     *
     * @return the value of fms_docmain.SECRETLEVEL
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    public String getSecretlevel() {
        return secretlevel;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column fms_docmain.SECRETLEVEL
     *
     * @param secretlevel the value for fms_docmain.SECRETLEVEL
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    public void setSecretlevel(String secretlevel) {
        this.secretlevel = secretlevel == null ? null : secretlevel.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column fms_docmain.PAGES
     *
     * @return the value of fms_docmain.PAGES
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    public Integer getPages() {
        return pages;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column fms_docmain.PAGES
     *
     * @param pages the value for fms_docmain.PAGES
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    public void setPages(Integer pages) {
        this.pages = pages;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column fms_docmain.SUBCOPIES
     *
     * @return the value of fms_docmain.SUBCOPIES
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    public Integer getSubcopies() {
        return subcopies;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column fms_docmain.SUBCOPIES
     *
     * @param subcopies the value for fms_docmain.SUBCOPIES
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    public void setSubcopies(Integer subcopies) {
        this.subcopies = subcopies;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column fms_docmain.ISVALID
     *
     * @return the value of fms_docmain.ISVALID
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    public Short getIsvalid() {
        return isvalid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column fms_docmain.ISVALID
     *
     * @param isvalid the value for fms_docmain.ISVALID
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    public void setIsvalid(Short isvalid) {
        this.isvalid = isvalid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column fms_docmain.Superordinateclass
     *
     * @return the value of fms_docmain.Superordinateclass
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    public String getSuperordinateclass() {
        return superordinateclass;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column fms_docmain.Superordinateclass
     *
     * @param superordinateclass the value for fms_docmain.Superordinateclass
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    public void setSuperordinateclass(String superordinateclass) {
        this.superordinateclass = superordinateclass == null ? null : superordinateclass.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column fms_docmain.SubordinateCLASS
     *
     * @return the value of fms_docmain.SubordinateCLASS
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    public String getSubordinateclass() {
        return subordinateclass;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column fms_docmain.SubordinateCLASS
     *
     * @param subordinateclass the value for fms_docmain.SubordinateCLASS
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    public void setSubordinateclass(String subordinateclass) {
        this.subordinateclass = subordinateclass == null ? null : subordinateclass.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column fms_docmain.Medianclass
     *
     * @return the value of fms_docmain.Medianclass
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    public String getMedianclass() {
        return medianclass;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column fms_docmain.Medianclass
     *
     * @param medianclass the value for fms_docmain.Medianclass
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    public void setMedianclass(String medianclass) {
        this.medianclass = medianclass == null ? null : medianclass.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column fms_docmain.spec
     *
     * @return the value of fms_docmain.spec
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    public String getSpec() {
        return spec;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column fms_docmain.spec
     *
     * @param spec the value for fms_docmain.spec
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    public void setSpec(String spec) {
        this.spec = spec == null ? null : spec.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column fms_docmain.carrier
     *
     * @return the value of fms_docmain.carrier
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    public String getCarrier() {
        return carrier;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column fms_docmain.carrier
     *
     * @param carrier the value for fms_docmain.carrier
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    public void setCarrier(String carrier) {
        this.carrier = carrier == null ? null : carrier.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column fms_docmain. pagination
     *
     * @return the value of fms_docmain. pagination
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    public Integer getPagination() {
        return pagination;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column fms_docmain. pagination
     *
     * @param pagination the value for fms_docmain. pagination
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    public void setPagination(Integer pagination) {
        this.pagination = pagination;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column fms_docmain.docid
     *
     * @return the value of fms_docmain.docid
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    public String getDocid() {
        return docid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column fms_docmain.docid
     *
     * @param docid the value for fms_docmain.docid
     *
     * @mbggenerated Thu Aug 24 11:10:45 CST 2017
     */
    public void setDocid(String docid) {
        this.docid = docid == null ? null : docid.trim();
    }

	public FmsDocBox getFmsDocBox() {
		return fmsDocBox;
	}

	public void setFmsDocBox(FmsDocBox fmsDocBox) {
		this.fmsDocBox = fmsDocBox;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public FmsDataDictItem getClasstypeFmsDataDictItem() {
		return classtypeFmsDataDictItem;
	}

	public void setClasstypeFmsDataDictItem(FmsDataDictItem classtypeFmsDataDictItem) {
		this.classtypeFmsDataDictItem = classtypeFmsDataDictItem;
	}

	public Department getOwnerDepartment() {
		return ownerDepartment;
	}

	public void setOwnerDepartment(Department ownerDepartment) {
		this.ownerDepartment = ownerDepartment;
	}

	public Department getSubownerDepartment() {
		return subownerDepartment;
	}

	public void setSubownerDepartment(Department subownerDepartment) {
		this.subownerDepartment = subownerDepartment;
	}

	public FmsDataDictItem getDoclevelFmsDataDictItem() {
		return doclevelFmsDataDictItem;
	}

	public void setDoclevelFmsDataDictItem(FmsDataDictItem doclevelFmsDataDictItem) {
		this.doclevelFmsDataDictItem = doclevelFmsDataDictItem;
	}

	public FmsDataDictItem getSecretlevelFmsDataDictItem() {
		return secretlevelFmsDataDictItem;
	}

	public void setSecretlevelFmsDataDictItem(FmsDataDictItem secretlevelFmsDataDictItem) {
		this.secretlevelFmsDataDictItem = secretlevelFmsDataDictItem;
	}

	public FmsDataDictItem getSuperordinateclassFmsDataDictItem() {
		return superordinateclassFmsDataDictItem;
	}

	public void setSuperordinateclassFmsDataDictItem(FmsDataDictItem superordinateclassFmsDataDictItem) {
		this.superordinateclassFmsDataDictItem = superordinateclassFmsDataDictItem;
	}

	public FmsDataDictItem getSubordinateclassFmsDataDictItem() {
		return subordinateclassFmsDataDictItem;
	}

	public void setSubordinateclassFmsDataDictItem(FmsDataDictItem subordinateclassFmsDataDictItem) {
		this.subordinateclassFmsDataDictItem = subordinateclassFmsDataDictItem;
	}

	public FmsDataDictItem getMedianclassFmsDataDictItem() {
		return medianclassFmsDataDictItem;
	}

	public void setMedianclassFmsDataDictItem(FmsDataDictItem medianclassFmsDataDictItem) {
		this.medianclassFmsDataDictItem = medianclassFmsDataDictItem;
	}

	public FmsDataDictItem getSpecFmsDataDictItem() {
		return specFmsDataDictItem;
	}

	public void setSpecFmsDataDictItem(FmsDataDictItem specFmsDataDictItem) {
		this.specFmsDataDictItem = specFmsDataDictItem;
	}

	public FmsDataDictItem getCarrierDataDictItem() {
		return carrierDataDictItem;
	}

	public void setCarrierDataDictItem(FmsDataDictItem carrierDataDictItem) {
		this.carrierDataDictItem = carrierDataDictItem;
	}

	public FmsDataDictItem getSumnumberFmsDataDictItem() {
		return sumnumberFmsDataDictItem;
	}

	public void setSumnumberFmsDataDictItem(FmsDataDictItem sumnumberFmsDataDictItem) {
		this.sumnumberFmsDataDictItem = sumnumberFmsDataDictItem;
	}
    
    
}