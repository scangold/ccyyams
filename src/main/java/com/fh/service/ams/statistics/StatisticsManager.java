package com.fh.service.ams.statistics;

import java.util.List;

import com.fh.util.PageData;

public interface StatisticsManager {

	PageData getAllProject() throws Exception;

	List<PageData> getProjectFilelist() throws Exception;

}
