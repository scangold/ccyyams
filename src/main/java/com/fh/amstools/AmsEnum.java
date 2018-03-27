package com.fh.amstools;

public class AmsEnum {
	
	public AmsEnum(){
		
	}
	
	/**
	 * IFARCHIVE 枚举类 
	 * 1代表成果资料
	 * 2代表过程资料
	 * 3代表收集资料
	 * 4代表待分配资料
	 * 5代表档案资料
	 * 
	 * @author kioor
	 *
	 */
	public enum IfArchiveEnum {
	    CHENGGUO(1), GUOCHENG(2), SHOUJI(3), DAIFENLEI(4), DANGAN(5){
	        @Override
	        public boolean isRest() {
	            return true;
	        }
	    };
	 
	    private int value;
	 
	    private IfArchiveEnum(int value) {
	        this.value = value;
	    }
	 
	    public int getValue() {
	        return value;
	    }
	 
	    public boolean isRest() {
	        return false;
	    }
	}
	
	
	
	
	
	
	
	
	
	
	
}
