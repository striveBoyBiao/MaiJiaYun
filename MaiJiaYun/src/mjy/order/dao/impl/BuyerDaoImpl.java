package mjy.order.dao.impl;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mjy.order.bean.po.BuyerPO;
import mjy.order.bean.vo.Buyer;
import mjy.order.dao.BuyerDao;
import mjy.order.dao.RowMap;


public class BuyerDaoImpl extends BaseDao<Buyer> implements BuyerDao{
	
	//����buyer�����ɾ��
	public int insert(Buyer buyer) {
		String sql = "INSERT INTO order_buyer(buyerName,userId,alipayId,buyerTel,buyerPhone,"
				+ "buyerPostcode,buyerProvince,buyerCity,buyerDistrict,buyerLocation)VALUES(?,?,?,?,?,?,?,?,?,?)";
		List<Object> parames = new ArrayList<Object>();
		
		parames.add(buyer.getBuyerName());
		parames.add(buyer.getUserId());
		parames.add(buyer.getAlipayId());
		parames.add(buyer.getBuyerTel());
		parames.add(buyer.getBuyerPhone());
		parames.add(buyer.getBuyerPostcode());
		parames.add(buyer.getBuyerProvince());
		parames.add(buyer.getBuyerCity());
		parames.add(buyer.getBuyerDistrict());
		parames.add(buyer.getBuyerLocation());
		return this.alter(sql, parames);
	}
	
	public int update(Buyer buyer) {
		//�޸Ŀ����޸��û��ĵ绰��Phone,�ʱ࣬��ַ��Ϣ���������ò�����
		String sql = "UPDATE order_buyer SET buyerTel=?,"
				+ "buyerPhone=?,buyerPostcode=?,buyerProvince=?,buyerCity=?,buyerDistrict=?,"
				+ "buyerLocation=? WHERE buyerId=?";
		List<Object> parames = new ArrayList<Object>();
		parames.add(buyer.getBuyerTel());
		parames.add(buyer.getBuyerPhone());
		parames.add(buyer.getBuyerPostcode());
		parames.add(buyer.getBuyerProvince());
		parames.add(buyer.getBuyerCity());
		parames.add(buyer.getBuyerDistrict());
		parames.add(buyer.getBuyerLocation());
		parames.add(buyer.getBuyerId());
		return this.alter(sql, parames);
	}
	
	//ɾ������
	public int delete(Buyer buyer) {
		String sql = "DELETE FROM order_buyer WHERE buyerId=?";
		List<Object> parames = new ArrayList<Object>();
		parames.add(buyer.getBuyerId());
		return this.alter(sql, parames);
	}
	
	
	
	/**
	 * ��ɾ�Ļ����ò�������Ҫ�ǲ�ѯ�����һ���ȫ����ѯ����
	 */
	public List<Buyer> queryBuyer(BuyerPO buyerPO) {
		StringBuffer buyerSql = new StringBuffer("SELECT * FROM order_buyer WHERE 1 = 1");
		List<Object> parames = new ArrayList<Object>();
		if (buyerPO!=null) {
			//buyerId��ѯ
			if (buyerPO.getBuyerId()!=null) {
				buyerSql.append(" and buyerId = ?");
				parames.add(buyerPO.getBuyerId());
			}
			//�ջ��˲�ѯ
			if (buyerPO.getBuyerName()!=null&&!buyerPO.getBuyerName().equals("")) {
				buyerSql.append(" and buyerName LIKE ?");
				parames.add("%"+buyerPO.getBuyerName()+"%");
			}
			//�ֻ��Ų�ѯ
			if (buyerPO.getBuyerPhone()!=null&&!buyerPO.getBuyerPhone().equals("")) {
				buyerSql.append(" and buyerPhone = ?");
				parames.add(buyerPO.getBuyerPhone());
			}
			//�绰�����ѯ
			if (buyerPO.getBuyerTel()!=null&&!buyerPO.getBuyerTel().equals("")) {
				buyerSql.append(" and buyerTel = ?");
				parames.add(buyerPO.getBuyerTel());
			}
			if (buyerPO.getBuyerAddress()!=null&&!buyerPO.getBuyerAddress().equals("")) {
				buyerSql.append(" and buyerAddress like ?");
				parames.add("%"+buyerPO.getBuyerAddress()+"%");
			}
		}
		String sql = buyerSql.toString();
		/*sql += sql + " limit "+"��ҳ����ʼ����" + "ÿҳ��ʾ������";*/
		return this.query(sql, parames, new RowMapAdaptive<Buyer>() {
			
			@Override
			public List<Buyer> mapRows(ResultSet res) {
				List<Buyer> list = null;
				try {
					list = new ArrayList<Buyer>();
					Buyer buyer = null;
					while (res.next()) {
						buyer = new Buyer();
						buyer.setBuyerId(res.getInt("buyerId"));
						buyer.setBuyerName(res.getString("buyerName"));
						buyer.setUserId(res.getInt("userId"));
						buyer.setAlipayId(res.getString("alipayId"));
						buyer.setBuyerTel(res.getString("buyerTel"));
						buyer.setBuyerPhone(res.getString("buyerPhone"));
						buyer.setBuyerPostcode(res.getString("buyerPostcode"));
						buyer.setBuyerProvince(res.getString("buyerProvince"));
						buyer.setBuyerCity(res.getString("buyerCity"));
						buyer.setBuyerDistrict(res.getString("buyerDistrict"));
						buyer.setBuyerLocation(res.getString("buyerLocation"));
						buyer.setBuyerAddress(res.getString("buyerAddress"));
						list.add(buyer);
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
				return list;
			}
		});
	}

	/*//������ݿ������еĶ���
	public int counts() {
		String sql = "select count(*) amount from order_buyer where 1=1";
		return this.amount(sql);
	}*/
	
	public static void main(String[] args) {
		BuyerDaoImpl buyerDaoImpl = new BuyerDaoImpl();
		BuyerPO buyerPO = new BuyerPO();
//		buyerPO.setBuyerId(1000);
//		buyerPO.setBuyerName("��");
		buyerPO.setBuyerAddress("Ǳ��");
		System.out.println(buyerPO);
		List<Buyer> list = buyerDaoImpl.queryBuyer(buyerPO);
		System.out.println(list.size());
		for (Buyer buyer : list) {
			System.out.println(buyer);
		}
	}
}
