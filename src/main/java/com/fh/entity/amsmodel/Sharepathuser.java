package com.fh.entity.amsmodel;

import com.fh.entity.system.Department;

public class Sharepathuser {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column ams_path_user.id
     *
     * @mbggenerated Mon Jul 25 16:16:52 CST 2016
     */
    private Integer id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column ams_path_user.sharepath_id
     *
     * @mbggenerated Mon Jul 25 16:16:52 CST 2016
     */
    private Integer sharepathId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column ams_path_user.user_id
     *
     * @mbggenerated Mon Jul 25 16:16:52 CST 2016
     */
    private String DEPARTMENT_ID;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column ams_path_user.id
     *
     * @return the value of ams_path_user.id
     *
     * @mbggenerated Mon Jul 25 16:16:52 CST 2016
     */
    public Integer getId() {
        return id;
    }
	private Department department; 
	
    public Department getDepartment() {
		return department;
	}



	public void setDepartment(Department department) {
		this.department = department;
	}



	/**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column ams_path_user.id
     *
     * @param id the value for ams_path_user.id
     *
     * @mbggenerated Mon Jul 25 16:16:52 CST 2016
     */
    public void setId(Integer id) {
        this.id = id;
    }

    

	/**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column ams_path_user.sharepath_id
     *
     * @return the value of ams_path_user.sharepath_id
     *
     * @mbggenerated Mon Jul 25 16:16:52 CST 2016
     */
    public Integer getSharepathId() {
        return sharepathId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column ams_path_user.sharepath_id
     *
     * @param sharepathId the value for ams_path_user.sharepath_id
     *
     * @mbggenerated Mon Jul 25 16:16:52 CST 2016
     */
    public void setSharepathId(Integer sharepathId) {
        this.sharepathId = sharepathId;
    }

	public String getDEPARTMENT_ID() {
		return DEPARTMENT_ID;
	}

	public void setDEPARTMENT_ID(String dEPARTMENT_ID) {
		DEPARTMENT_ID = dEPARTMENT_ID;
	}

 
}