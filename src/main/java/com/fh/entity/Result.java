package com.fh.entity;

public class Result<T> {

	private boolean result;

	private T res;

	private String desc;

	public Result() {
		// TODO Auto-generated constructor stub
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public boolean isResult() {
		return result;
	}

	public void setResult(boolean result) {
		this.result = result;
	}

	public T getRes() {
		return res;
	}

	public void setRes(T res) {
		this.res = res;
	}

	@Override
	public String toString() {
		return "Result [result=" + result + ", res=" + res + "]";
	}





}
