package goodee.gdj58.shop_b.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import goodee.gdj58.shop_b.mapper.GoodsImgMapper;
import goodee.gdj58.shop_b.mapper.GoodsMapper;
import goodee.gdj58.shop_b.util.TeamColor;
import goodee.gdj58.shop_b.vo.Goods;
import goodee.gdj58.shop_b.vo.GoodsImg;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class GoodsService {
	@Autowired private GoodsMapper goodsMapper;
	@Autowired private GoodsImgMapper goodsImgMapper;
	
	public int insertGoods(Goods goods, List<MultipartFile> picList, String path) {
		int row = 0;
		
		// 1. 상품 등록
		row = goodsMapper.insertGoods(goods); // row == 1 : 등록 성공, key값 반환 
		
		int index = 0; // picList의 index
		// 2. 파일 등록
		if(picList != null) { // 하나 이상의 업로드할 파일이 있을 경우
			for(MultipartFile mf : picList) {
				log.debug(TeamColor.BLUE+"상품 파일 등록 시작, insertGoods");
				
				String orginName = mf.getOriginalFilename(); // 확장자가 포함된 원본 파일 이름 
				
				log.debug(TeamColor.BLUE+orginName+"<- orginName, insertGoods");
				
				String ext = orginName.substring(orginName.lastIndexOf(".")+1); // 확장자,  마지막 . 위치를 구함(lastIndexOf(".") -> . 뒤로 글자 자르기
				UUID uuid = UUID.randomUUID(); // 랜덤 문자열을 생성하는 API
				String newName = uuid.toString().replace("-","")+"."+ext; // 확장자 포함 고유 파일 이름, (-) 제거
				String newFullName = path+newName; // 확장자, 경로 포함 고유 파일 이름
				
				log.debug(TeamColor.BLUE+newFullName+"<- newFullName, insertGoods");
				
				File f = new File(newFullName); // 빈 file 생성
				try {
					mf.transferTo(f); // 빈 file 안에 업로드된 파일 복사
				} catch (Exception e) {
					e.printStackTrace();
					/*
					 *  파일 업로드에 실패하면
					 *  try...catch 절이 필요하지 않은 RuntimeException을 발생시켜서
					 *  @Transactional이 감지하여 rollback 할 수 있도록
					 */
					throw new RuntimeException();
				} 
				
				// 3. 파일 정보를 goods_img 테이블에 저장
				GoodsImg gi = new GoodsImg();
				gi.setGoodsNo(goods.getGoodsNo()); 
				gi.setGoodsImgOriginName(orginName);
				gi.setGoodsImgSaveName(newName);
				gi.setGoodsImgType(mf.getContentType());
				gi.setGoodsImgSize(mf.getSize());
				gi.setGoodsImgLevel(index); 
				
				row += goodsImgMapper.insertGoodsImg(gi);
				
				index++; 
			}
		}
		
		return row;
	}
}
