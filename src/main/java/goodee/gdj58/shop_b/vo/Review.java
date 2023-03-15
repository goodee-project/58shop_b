package goodee.gdj58.shop_b.vo;

import lombok.Data;

@Data 
public class Review {
	private int reviewNo; // DB수정으로인한 컬럼추가
	private int goodsOrderNo;
	private String reviewContent; // 리뷰 내용
	private int reviewRating; // 별점
	private String createdate;
}
