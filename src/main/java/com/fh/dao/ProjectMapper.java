package com.fh.dao;

import com.fh.entity.amsmodel.Project;

public interface ProjectMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ams_project
     *
     * @mbggenerated Wed Aug 03 15:37:35 CST 2016
     */
    int deleteByPrimaryKey(Integer prjId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ams_project
     *
     * @mbggenerated Wed Aug 03 15:37:35 CST 2016
     */
    int insert(Project record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ams_project
     *
     * @mbggenerated Wed Aug 03 15:37:35 CST 2016
     */
    int insertSelective(Project record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ams_project
     *
     * @mbggenerated Wed Aug 03 15:37:35 CST 2016
     */
    Project selectByPrimaryKey(Integer prjId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ams_project
     *
     * @mbggenerated Wed Aug 03 15:37:35 CST 2016
     */
    int updateByPrimaryKeySelective(Project record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ams_project
     *
     * @mbggenerated Wed Aug 03 15:37:35 CST 2016
     */
    int updateByPrimaryKey(Project record);
}