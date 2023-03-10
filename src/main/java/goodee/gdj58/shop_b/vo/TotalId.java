package goodee.gdj58.shop_b.vo;

import lombok.Data;

@Data
public class TotalId { // 전체 아이디
	private String id;
	private String totalIdKind; // '고객','쇼핑','예약','광고','플랫폼'
	private String totalIdActive; // 아이디 활성화 상태 ('활성화','비활성화')
	private String totalIdDeactiveMemo; // 아이디 비활성화 사유
	private String totalIdDeactiveDate; // 아이디 비활성화 날짜
	private String totalIdReactiveDate; // 아이디 재활성화 날짜
	private String createdate;
}
