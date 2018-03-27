package com.fh.service.kms.kmsfilebox;

import java.util.List;

import com.fh.entity.amsmodel.KmsFileBox;
import com.fh.entity.fms.FmsDocBox;
import com.fh.util.PageData;

/**
 * @author kioor
 * @date 2017年9月19日09:54:19
 *
 */
public interface KmsfileBoxManager {
	
	/**列出科技档案文件夹
	 * @param kmsFileBox
	 * @return
	 * @throws Exception
	 * @author:kioor
	 * @date:2017年9月19日 上午10:02:11
	 *
	 */
	public List<KmsFileBox> listFileBox(KmsFileBox kmsFileBox) throws Exception;
	
	/**编辑科技档案文件夹
	 * @param kmsFileBox
	 * @return
	 * @throws Exception
	 * @author:kioor
	 * @date:2017年9月19日 上午10:02:11
	 *
	 */
	public void editBox(KmsFileBox kmsFileBox) throws Exception;

	/**通过ID查询科技档案文件夹
	 * @param kmsFileBox
	 * @return
	 * @throws Exception
	 * @author:kioor
	 * @date:2017年9月19日 上午10:02:11
	 *
	 */
	public KmsFileBox findById(String id) throws Exception;

	/**添加科技档案文件夹
	 * @param kmsFileBox
	 * @return
	 * @throws Exception
	 * @author:kioor
	 * @date:2017年9月19日 上午10:02:11
	 *
	 */
	public void saveKBOX(KmsFileBox kmsFileBox) throws Exception;
	
	
	
	
}
