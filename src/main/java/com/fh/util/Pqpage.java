package com.fh.util;

public class Pqpage<T> {	
	private int pq_curpage;//页数
	private int total_Records;//总共条数
	private String pq_datatype;//数据类型
	private int pq_rpp=10;//条数
	private int skip;
	public Pqpage() {
		// TODO Auto-generated constructor stub
	}
	public int getPq_curpage() {
		return pq_curpage;
	}
	public void setPq_curpage(int pq_curpage) {
		this.pq_curpage = pq_curpage;
	}
	public int getTotal_Records() {
		return total_Records;
	}
	public void setTotal_Records(int total_Records) {
		this.total_Records = total_Records;
	}

	public String getPq_datatype() {
		return pq_datatype;
	}
	public void setPq_datatype(String pq_datatype) {
		this.pq_datatype = pq_datatype;
	}
	public int getPq_rpp() {
		return pq_rpp;
	}
	public void setPq_rpp(int pq_rpp) {
		this.pq_rpp = pq_rpp;
	}
	public int getSkip() {
		return skip;
	}
	public void setSkip(int skip) {
		this.skip = skip;
	}
	 
}
