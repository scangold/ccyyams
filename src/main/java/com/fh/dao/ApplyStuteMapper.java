package com.fh.dao;

import java.util.List;

import com.fh.entity.amsmodel.ApplyStute;
import com.fh.util.PageData;

public interface ApplyStuteMapper {
	/**
	 * This method was generated by MyBatis Generator.
	 * This method corresponds to the database table ams_apply_stute
	 *
	 * @mbggenerated Mon Jul 04 15:29:41 CST 2016
	 */
	int deleteByPrimaryKey(Integer id);

	/**
	 * This method was generated by MyBatis Generator.
	 * This method corresponds to the database table ams_apply_stute
	 *
	 * @mbggenerated Mon Jul 04 15:29:41 CST 2016
	 */
	int insert(ApplyStute record);

	/**
	 * This method was generated by MyBatis Generator.
	 * This method corresponds to the database table ams_apply_stute
	 *
	 * @mbggenerated Mon Jul 04 15:29:41 CST 2016
	 */
	int insertSelective(ApplyStute record);

	/**
	 * This method was generated by MyBatis Generator.
	 * This method corresponds to the database table ams_apply_stute
	 *
	 * @mbggenerated Mon Jul 04 15:29:41 CST 2016
	 */
	ApplyStute selectByPrimaryKey(Integer id);

	/**
	 * This method was generated by MyBatis Generator.
	 * This method corresponds to the database table ams_apply_stute
	 *
	 * @mbggenerated Mon Jul 04 15:29:41 CST 2016
	 */
	int updateByPrimaryKeySelective(ApplyStute record);

	/**
	 * This method was generated by MyBatis Generator.
	 * This method corresponds to the database table ams_apply_stute
	 *
	 * @mbggenerated Mon Jul 04 15:29:41 CST 2016
	 */
	int updateByPrimaryKey(ApplyStute record);
	/**
	 * 
	 * @param apply_id
	 * @return
	 * @email:401701706@qq.com
	 * @date:2016年7月14日 下午3:35:17
	 *
	 */
	List<PageData> selectByApplyKey(int apply_id);
}