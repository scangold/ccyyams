package com.fh.dao;

import com.fh.entity.fms.FmsPZDocBox;

public interface FmsPZDocBoxMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table fms_pzdocbox
     *
     * @mbggenerated Mon Jul 31 16:05:40 CST 2017
     */
    int deleteByPrimaryKey(String acBoxId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table fms_pzdocbox
     *
     * @mbggenerated Mon Jul 31 16:05:40 CST 2017
     */
    int insert(FmsPZDocBox record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table fms_pzdocbox
     *
     * @mbggenerated Mon Jul 31 16:05:40 CST 2017
     */
    int insertSelective(FmsPZDocBox record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table fms_pzdocbox
     *
     * @mbggenerated Mon Jul 31 16:05:40 CST 2017
     */
    FmsPZDocBox selectByPrimaryKey(String acBoxId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table fms_pzdocbox
     *
     * @mbggenerated Mon Jul 31 16:05:40 CST 2017
     */
    int updateByPrimaryKeySelective(FmsPZDocBox record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table fms_pzdocbox
     *
     * @mbggenerated Mon Jul 31 16:05:40 CST 2017
     */
    int updateByPrimaryKey(FmsPZDocBox record);
}