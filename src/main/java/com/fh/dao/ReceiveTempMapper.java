package com.fh.dao;

import com.fh.entity.amsmodel.ReceiveTemp;

public interface ReceiveTempMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ams_receive_temp
     *
     * @mbggenerated Tue Aug 23 10:51:47 CST 2016
     */
    int deleteByPrimaryKey(Integer rctempId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ams_receive_temp
     *
     * @mbggenerated Tue Aug 23 10:51:47 CST 2016
     */
    int insert(ReceiveTemp record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ams_receive_temp
     *
     * @mbggenerated Tue Aug 23 10:51:47 CST 2016
     */
    int insertSelective(ReceiveTemp record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ams_receive_temp
     *
     * @mbggenerated Tue Aug 23 10:51:47 CST 2016
     */
    ReceiveTemp selectByPrimaryKey(Integer rctempId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ams_receive_temp
     *
     * @mbggenerated Tue Aug 23 10:51:47 CST 2016
     */
    int updateByPrimaryKeySelective(ReceiveTemp record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ams_receive_temp
     *
     * @mbggenerated Tue Aug 23 10:51:47 CST 2016
     */
    int updateByPrimaryKey(ReceiveTemp record);
}