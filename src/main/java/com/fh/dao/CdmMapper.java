package com.fh.dao;

import com.fh.entity.amsmodel.Cdm;

public interface CdmMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ams_cdm
     *
     * @mbggenerated Tue Aug 09 09:42:51 CST 2016
     */
    int deleteByPrimaryKey(Integer storageId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ams_cdm
     *
     * @mbggenerated Tue Aug 09 09:42:51 CST 2016
     */
    int insert(Cdm record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ams_cdm
     *
     * @mbggenerated Tue Aug 09 09:42:51 CST 2016
     */
    int insertSelective(Cdm record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ams_cdm
     *
     * @mbggenerated Tue Aug 09 09:42:51 CST 2016
     */
    Cdm selectByPrimaryKey(Integer storageId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ams_cdm
     *
     * @mbggenerated Tue Aug 09 09:42:51 CST 2016
     */
    int updateByPrimaryKeySelective(Cdm record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ams_cdm
     *
     * @mbggenerated Tue Aug 09 09:42:51 CST 2016
     */
    int updateByPrimaryKey(Cdm record);
}