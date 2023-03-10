package goodee.gdj58.shop_b.vo;

import lombok.Data;

@Data
public class GoodsImg {
	private int goodsImgNo;
	private int goodsNo;
	private String goodsImgSaveName; // 이미지 파일 이름
	private String goodsImgOriginName; // 이미지 원본 파일 이름
	private int goodsImgLevel; // 가중치 (대표이미지, 상세설명이미지 구별)
	private String goodsImgType; // 이미지 타입
	private Long goodsImgSize; // 파일 용량 
	private String createdate;
}
