package mjy.caigou.service;

import java.util.List;

import mjy.caigou.vo.ShopGoodsVO;
import mjy.caigou.vo.ShopVO;

public interface ImportGoodsService {
	public List<String> getShopNames();//�õ����е��̵�����
	public List<ShopGoodsVO> getShopGoodss(int shopId,int isImport);//���ݵ���id�õ���Ʒ
	public void updateShopGoodss(List<ShopGoodsVO> shopGoodss); 
}

