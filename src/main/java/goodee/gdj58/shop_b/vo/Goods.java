package goodee.gdj58.shop_b.vo;

import org.springframework.beans.factory.annotation.Value;

import lombok.Data;

@Data
public class Goods {
	private int goodsNo;
	private String companyId;
	private int typeNo; // 카테고리
	private String goodsName;
	private int goodsPrice;
	private String goodsActive = "비활성화"; // 기본값 설정. 활성화 여부(강제로 보이거나 안보이도록) '판매중', '비활성화', '삭제'
	private int goodsLevel; // 가중치 (인기 상품 끌어올리기)
	private String updatedate;
	private String createdate;
}
