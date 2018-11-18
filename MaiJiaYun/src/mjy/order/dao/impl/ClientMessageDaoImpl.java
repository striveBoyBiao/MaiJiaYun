package mjy.order.dao.impl;

/**
 * ����-���ͻ���Ϣ
 */
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mjy.order.bean.po.ClientMessagePo;
import mjy.order.bean.vo.Buyer;
import mjy.order.bean.vo.ClientMessage;
import mjy.order.bean.vo.Order;
import mjy.order.dao.ClientMessageDao;
import mjy.order.dao.RowMap;

public class ClientMessageDaoImpl extends BaseDao<ClientMessage> implements ClientMessageDao {

	@Override
	public ClientMessage queryClientMessage(ClientMessagePo cmpo) {
		/* �����ұ���ϸ�����������������ѯ */
		StringBuffer clientSql = new StringBuffer(
				"select * from order_order o join  order_logistic l on l.logisticId=o.logisticId join order_detail d on d.orderCode=o.orderCode join order_buyer b on b.buyerId=o.buyerId where 1=1");
		List<Object> parames = new ArrayList<Object>();

		if (cmpo.getOrderCode() != null) {
			clientSql.append(" and o.orderCode=?");
			parames.add(cmpo.getOrderCode());
		}

		return query(clientSql.toString(), parames, new RowMapAdaptive<ClientMessage>() {

			@Override
			public List<ClientMessage> mapRows(ResultSet res) {
				List<ClientMessage> list = null;
				ClientMessage cmg = null;

				try {
					list = new ArrayList<ClientMessage>();
					while (res.next()) {
						cmg = new ClientMessage();
						cmg.setBuyerId(res.getInt("buyerId"));
						cmg.setBuyerName(res.getString("buyerName"));
						cmg.setBuyerTel(res.getString("buyerTel"));
						cmg.setBuyerPhone(res.getString("buyerPhone"));
						cmg.setLogisticId(res.getInt("logisticId"));
						cmg.setLogisticName(res.getString("logisticName"));
						cmg.setWareHouserId(res.getInt("wareHouserId"));
						// cmg.setBuyerProvince(res.getString("buyerProvince"));
						// cmg.setBuyerCity(res.getString("buyerCity"));
						// cmg.setBuyerDistrict(res.getString("buyerDistrict"));
						/*��ȡʡ��id*/
						cmg.setProvincesCode(res.getString("buyerProvince"));
						cmg.setCityCode(res.getString("buyerCity"));
						cmg.setAreaCode(res.getString("buyerDistrict"));
						
						/*��ȡʡ������*/
						List<String> adds = getAddress(res.getString("buyerDistrict"));
						cmg.setBuyerProvince(adds.get(0));
						cmg.setBuyerCity(adds.get(1));
						cmg.setBuyerDistrict(adds.get(2));

						cmg.setBuyerLocation(res.getString("buyerLocation"));
						cmg.setBuyerPostcode(res.getString("buyerPostcode"));
						list.add(cmg);
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
				return list;
			}
		}).get(0);

	}

	public List<String> getAddress(String buyerDistrict) {
		List<String> list = null;
		String sql = "select * from kefu_areas a join kefu_cities c on c.cityCode=a.cityCode join kefu_provinces p on p.provincesCode=c.provinceCode where a.areaCode="
				+ buyerDistrict;
		ResultSet res = queryAddress(sql);
		try {
			if (res.next()) {
				list = new ArrayList<String>();
				list.add(res.getString("provincesName"));// ʡ��
				list.add(res.getString("cityName"));// ��
				list.add(res.getString("areaName"));// ��
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	/* �޸�������Ϣ */
	/* �޸���ұ�Ͷ����� */
	public void update(Order order, Buyer buyer) {
		//�޸���ұ�
		String buyer_sql = "update order_buyer set buyerName=?,buyerTel=?,buyerPhone=?,buyerPostcode=?,buyerProvince=?,buyerCity=?,buyerDistrict=?,buyerLocation=? where buyerId=?";
		List<Object> buyer_parames = new ArrayList<Object>();
		if (buyer != null&&order!=null) {
			buyer_parames.add(buyer.getBuyerName());
			buyer_parames.add(buyer.getBuyerTel());
			buyer_parames.add(buyer.getBuyerPhone());
			buyer_parames.add(buyer.getBuyerPostcode());
			buyer_parames.add(buyer.getBuyerProvince());
			buyer_parames.add(buyer.getBuyerCity());
			buyer_parames.add(buyer.getBuyerDistrict());
			buyer_parames.add(buyer.getBuyerLocation());
			buyer_parames.add(order.getBuyerId());
		}
		alter(buyer_sql, buyer_parames);
		
		/*�޸Ķ�����*/
		String order_sql="update order_order set logisticId=?,orderBuyerRemark=?,orderSellerRemark=? where orderCode=?";
		List<Object> order_parames=new ArrayList<Object>();
		if(order!=null){
			order_parames.add(order.getLogisticId());
			order_parames.add(order.getOrderBuyerRemark());
			order_parames.add(order.getOrderSellerRemark());
			order_parames.add(order.getOrderCode());
		}
		alter(order_sql, order_parames);
		
	}

	// public static void main(String[] args) {
	// ClientMessageDaoImpl cmd=new ClientMessageDaoImpl();
	// List<String> list=cmd.getAddress("330822");
	// System.out.println(list.get(0));
	// for (String string : list) {
	// System.out.println(string);
	// }
	// }
	
//	public static void main(String[] args) {
//		/*�������Ա�ʾ����*/
//		ClientMessageDaoImpl cmd=new ClientMessageDaoImpl();
//		Order order=new Order();
//		order.setOrderCode("OD201612091546001");
//		order.setOrderBuyerRemark("������ұ�ע");
//		order.setOrderSellerRemark("�������ұ�ע");
//		order.setBuyerId(1055);
//		order.setLogisticId(1);
//		Buyer buyer=new Buyer();
//		buyer.setBuyerName("��С��");
//		buyer.setBuyerTel("123456");
//		buyer.setBuyerPhone("123456789");
//		buyer.setBuyerPostcode("663600");
//		buyer.setBuyerProvince("140000");
//		buyer.setBuyerCity("140300");
//		buyer.setBuyerDistrict("140303");
//		buyer.setBuyerLocation("����");
//		cmd.update(order, buyer);
//	}
}
