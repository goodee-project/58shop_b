package goodee.gdj58.shop_b.vo;

import lombok.Data;

@Data
public class ReviewImg { // 리뷰 사진
	private int reviewNo;
	private String reviewImgSaveName; // 이미지 파일 이름
	private String reviewImgOriginName; // 이미지 원본 파일 이름
	private String reviewImgType; // 이미지 타입 
	private Long reviewImgSize; // 용량
	private String createdate;
}
