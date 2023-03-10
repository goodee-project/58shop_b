package goodee.gdj58.shop_b.vo;

import lombok.Data;

@Data
public class CustomerImg { // 고객 사진
	private String customerId;
	private String customerImgSaveName; // 이미지 파일 이름
	private String customerImgOriginName; // 이미지 원본 파일 이름
	private String customerImgKind; // 파일 타입
	private Long customerImgSize; // 파일 용량
}
