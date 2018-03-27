package com.fh.entity.fms;

public class FmsDataDictItem {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column fms_datadict_item.NAME
     *
     * @mbggenerated Mon Jul 31 16:05:40 CST 2017
     */
    private String name;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column fms_datadict_item.ID
     *
     * @mbggenerated Mon Jul 31 16:05:40 CST 2017
     */
    private String id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column fms_datadict_item.SORT
     *
     * @mbggenerated Mon Jul 31 16:05:40 CST 2017
     */
    private Integer sorts;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column fms_datadict_item.VALUE
     *
     * @mbggenerated Mon Jul 31 16:05:40 CST 2017
     */
    private String value;
    
    private Short isvalid;
    
    private String datakey;
    

    public String getDatakey() {
		return datakey;
	}

	public void setDatakey(String datakey) {
		this.datakey = datakey;
	}

	/**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column fms_datadict_item.NAME
     *
     * @return the value of fms_datadict_item.NAME
     *
     * @mbggenerated Mon Jul 31 16:05:40 CST 2017
     */
    public String getName() {
        return name;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column fms_datadict_item.NAME
     *
     * @param name the value for fms_datadict_item.NAME
     *
     * @mbggenerated Mon Jul 31 16:05:40 CST 2017
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column fms_datadict_item.ID
     *
     * @return the value of fms_datadict_item.ID
     *
     * @mbggenerated Mon Jul 31 16:05:40 CST 2017
     */
    public String getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column fms_datadict_item.ID
     *
     * @param id the value for fms_datadict_item.ID
     *
     * @mbggenerated Mon Jul 31 16:05:40 CST 2017
     */
    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column fms_datadict_item.SORT
     *
     * @return the value of fms_datadict_item.SORT
     *
     * @mbggenerated Mon Jul 31 16:05:40 CST 2017
     */
    public Integer getSorts() {
        return sorts;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column fms_datadict_item.SORT
     *
     * @param sort the value for fms_datadict_item.SORT
     *
     * @mbggenerated Mon Jul 31 16:05:40 CST 2017
     */
    public void setSorts(Integer sorts) {
        this.sorts = sorts;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column fms_datadict_item.VALUE
     *
     * @return the value of fms_datadict_item.VALUE
     *
     * @mbggenerated Mon Jul 31 16:05:40 CST 2017
     */
    public String getValue() {
        return value;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column fms_datadict_item.VALUE
     *
     * @param value the value for fms_datadict_item.VALUE
     *
     * @mbggenerated Mon Jul 31 16:05:40 CST 2017
     */
    public void setValue(String value) {
        this.value = value == null ? null : value.trim();
    }


	@Override
	public String toString() {
		return "FmsDataDictItem [name=" + name + ", id=" + id + ", sorts=" + sorts + ", value=" + value + ", isvalid="
				+ isvalid + "]";
	}

	public Short getIsvalid() {
		return isvalid;
	}

	public void setIsvalid(Short isvalid) {
		this.isvalid = isvalid;
	}
    
    
}