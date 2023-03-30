package goodee.gdj58.shop_b.restcontroller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFColor;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import goodee.gdj58.shop_b.service.GoodsOptionService;
import goodee.gdj58.shop_b.util.TeamColor;
import goodee.gdj58.shop_b.vo.Company;
import goodee.gdj58.shop_b.vo.GoodsOption;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class GoodsOptionRestController {
	@Autowired private GoodsOptionService goodsOptionService;
	
	// 재고 목록 엑셀파일 다운로드
	@GetMapping("/download")
	public void download(HttpSession session, HttpServletResponse res) throws IOException {
		
		/**
		 * 엑셀 sheet 생성
		 */
        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("재고 목록");
        sheet.setDefaultColumnWidth(28); // 디폴트 너비 설정

        // 헤더 폰트 설정
        XSSFFont headerXSSFFont = (XSSFFont) workbook.createFont();
        headerXSSFFont.setFontName("맑은 고딕");
        headerXSSFFont.setColor(new XSSFColor(new byte[]{(byte) 0, (byte) 0, (byte) 0}));

        // 헤더 셀 설정
        XSSFCellStyle headerXssfCellStyle = (XSSFCellStyle)workbook.createCellStyle();

        // 테두리 설정
        headerXssfCellStyle.setBorderLeft(BorderStyle.THIN);
        headerXssfCellStyle.setBorderRight(BorderStyle.THIN);
        headerXssfCellStyle.setBorderTop(BorderStyle.THIN);
        headerXssfCellStyle.setBorderBottom(BorderStyle.THIN);

        // 배경 설정
        headerXssfCellStyle.setFillForegroundColor(new XSSFColor(new byte[]{(byte) 255, (byte) 250, (byte) 205}));
        headerXssfCellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        headerXssfCellStyle.setFont(headerXSSFFont);

        // body 셀 설정
        XSSFCellStyle bodyXssfCellStyle = (XSSFCellStyle)workbook.createCellStyle();

        // 테두리 설정
        bodyXssfCellStyle.setBorderLeft(BorderStyle.THIN);
        bodyXssfCellStyle.setBorderRight(BorderStyle.THIN);
        bodyXssfCellStyle.setBorderTop(BorderStyle.THIN);
        bodyXssfCellStyle.setBorderBottom(BorderStyle.THIN);

        // 헤더 데이터
        int rowCount = 0; // 데이터가 저장될 행
        String headerNames[] = new String[]{"상품 번호", "분류명", "상품 이름", "옵션 번호", "옵션 이름", "재고 수량"};

        Row headerRow = null;
        Cell headerCell = null;

        headerRow = sheet.createRow(rowCount++);
        for(int i=0; i<headerNames.length; i++) {
            headerCell = headerRow.createCell(i);
            headerCell.setCellValue(headerNames[i]); // 데이터 추가
            headerCell.setCellStyle(headerXssfCellStyle); // 스타일 추가
        }

        /**
         * body 데이터
         */
        // 로그인한 업체 아이디 가져오기 
 		Company loginCompany = (Company)session.getAttribute("loginCompany");
 		String companyId = loginCompany.getCompanyId();
 		
 		List<LinkedHashMap<String, Object>> list = goodsOptionService.selectGoodsOptionList(companyId); // 데이터 가져오기

 		Row bodyRow = null;
 		Cell bodyCell = null;

 		for (LinkedHashMap<String, Object> bodyDatas : list) {
 		    bodyRow = sheet.createRow(rowCount++); // 행 생성

 		    int i = 0;
 		    for (Object value : bodyDatas.values()) {
 		        bodyCell = bodyRow.createCell(i++); // 열 생성
 		        bodyCell.setCellValue(String.valueOf(value)); // 데이터 추가
 		        bodyCell.setCellStyle(bodyXssfCellStyle); // 스타일 추가
 		    }
 		}
 		
 		
 		/**
         * download
         */
        String fileName = "goods_stock_download";

        res.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        res.setHeader("Content-Disposition", "attachment;filename=" + fileName + ".xlsx");
        ServletOutputStream servletOutputStream = res.getOutputStream();

        workbook.write(servletOutputStream);
        workbook.close();
        servletOutputStream.flush();
        servletOutputStream.close();
	}
	
	// 재고 변경
	@PatchMapping("/quantity")
	public String updateGoodsOptionQuantity(@RequestBody List<GoodsOption> list) {
		log.debug(TeamColor.BLUE + list + "<- list, updateGoodsOptionQuantity");
		
		int row = goodsOptionService.updateGoodsQuantity(list);
		log.debug(TeamColor.BLUE + row + "<- row, updateGoodsOptionQuantity");
		
		String text = "fail";
		
		if(row == list.size()) {
			text = "success";
		}
		
		log.debug(TeamColor.BLUE + text + "<- text, updateGoodsOptionQuantity");
		return text;
	}

	// 재고 확인
	@PostMapping("/quantity")
	public List<GoodsOption> selectGoodsQuantity(@RequestParam(value="goodsNo", required=true) int goodsNo) {
		log.debug(TeamColor.BLUE + goodsNo + "<- goodsNo, selectGoodsQuantity");
		return goodsOptionService.selectGoodsQuantity(goodsNo);
	}
	
}
