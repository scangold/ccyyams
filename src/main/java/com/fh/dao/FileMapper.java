package com.fh.dao;

import com.fh.entity.amsmodel.File;
import com.fh.util.PageData;

public interface FileMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ams_file
     *
     * @mbggenerated Sun Aug 07 16:48:26 CST 2016
     */
    int deleteByPrimaryKey(Integer fileId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ams_file
     *
     * @mbggenerated Sun Aug 07 16:48:26 CST 2016
     */
    int insert(File record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ams_file
     *
     * @mbggenerated Sun Aug 07 16:48:26 CST 2016
     */
    int insertSelective(File record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ams_file
     *
     * @mbggenerated Sun Aug 07 16:48:26 CST 2016
     */
    File selectByPrimaryKey(Integer fileId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ams_file
     *
     * @mbggenerated Sun Aug 07 16:48:26 CST 2016
     */
    int updateByPrimaryKeySelective(File record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ams_file
     *
     * @mbggenerated Sun Aug 07 16:48:26 CST 2016
     */
    int updateByPrimaryKey(File record);
    
    PageData selectPathByPrimaryKey(String file);
}