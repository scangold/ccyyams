package com.fh.entity;

import java.util.List;

public class BootstrapTable<T>{
	private String order;
	private String search;	
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	private int offset;
	private int limit = 10;
	private String  sort; 
	private int  total;
	private List<T>  rows;
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public List<T> getRows() {
		return rows;
	}
	public void setRows(List<T> rows) {
		this.rows = rows;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	public int getOffset() {
		return offset;
	}
	public void setOffset(int offset) {
		this.offset = offset;
	}
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	@Override
	public String toString() {
		return "BootstrapTable [order=" + order + ", offset=" + offset + ", limit=" + limit + ", sort=" + sort
				+ ", total=" + total + ", rows=" + rows + "]";
	}
	


}
