package com.fh.dao;

import com.fh.entity.fms.FmsDataDictItem;

public interface FmsDataDictItemMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table fms_datadict_item
     *
     * @mbggenerated Mon Jul 31 16:05:40 CST 2017
     */
    int deleteByPrimaryKey(String name);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table fms_datadict_item
     *
     * @mbggenerated Mon Jul 31 16:05:40 CST 2017
     */
    int insert(FmsDataDictItem record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table fms_datadict_item
     *
     * @mbggenerated Mon Jul 31 16:05:40 CST 2017
     */
    int insertSelective(FmsDataDictItem record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table fms_datadict_item
     *
     * @mbggenerated Mon Jul 31 16:05:40 CST 2017
     */
    FmsDataDictItem selectByPrimaryKey(String name);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table fms_datadict_item
     *
     * @mbggenerated Mon Jul 31 16:05:40 CST 2017
     */
    int updateByPrimaryKeySelective(FmsDataDictItem record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table fms_datadict_item
     *
     * @mbggenerated Mon Jul 31 16:05:40 CST 2017
     */
    int updateByPrimaryKey(FmsDataDictItem record);
}