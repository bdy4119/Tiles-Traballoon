package mul.cam.a.dto;

import java.io.Serializable;

public class MypageDto implements Serializable{
	
	// 검색기능에 필요한 요소 / 뿌려주기 위한 요소
	private int seq;	
	private String id;
	
	private String title;
    private String content;
    private String wdate;
    
    private int del;
    private int readcount;	
	
        
}
