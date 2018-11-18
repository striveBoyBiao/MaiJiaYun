package mjy.kefu.dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import mjy.common.util.jdbc.BaseDao;
import mjy.kefu.beans.OrderBeanPO;
import mjy.kefu.beans.OrderQueryBeanVOLYL;

public class OrderQuery extends BaseDao<OrderBeanPO> {
	//��������ҳ��ѯ����
	public List<OrderBeanPO> orderQueryLYL(OrderQueryBeanVOLYL orderQueryBeanVO) {
		String sql = "SELECT orderCode,orderRemind,orderSellerRemark,orderBuyerRemark,orderPayMent,orderFreight,orderTime,orderPayTime,orderExaTime,orderSendTime,orderWaybill,orderSendCode,orderState," + "buyerName,buyerTel,buyerPhone,buyerPostcode,buyerProvince,buyerCity,buyerDistrict,buyerLocation,orderGoodNum,logisticName,shopName,buyerAddress " + " FROM order_order " + " Inner Join order_buyer ON order_order.buyerId = order_buyer.buyerId" + " Inner Join order_logistic ON order_logistic.logisticId = order_order.logisticId" + " Inner Join caigou_shop ON caigou_shop.shopId = order_order.shopId";
		String sqlWhere = " where 1=1 and order_order.userId = '"+orderQueryBeanVO.getUserId()+"' ";
		String sqlOrderBy = "order by ";
		ArrayList<Object> params = new ArrayList<Object>();
		
		if (orderQueryBeanVO.getSearchText() != null && !orderQueryBeanVO.getSearchText().trim().equals("")) {
			//System.out.println("geteShopName " + orderQueryBeanVO.geteShopName());
				String sousuo = orderQueryBeanVO.getSearchText();
				sqlWhere = sqlWhere + " and (shopName like '%" +sousuo+ "%' or logisticName like '%" +sousuo+ "%' or orderCode like '%" +sousuo+ "%' or orderWaybill like '%" +sousuo+ "%' or buyerName like '%" +sousuo+ "%' or orderSendCode like '%" +sousuo+ "%') ";
		}
		if (orderQueryBeanVO.geteShopName() != null && !orderQueryBeanVO.geteShopName().trim().equals("")) {
			//System.out.println("geteShopName " + orderQueryBeanVO.geteShopName());
			if (orderQueryBeanVO.geteShopName().trim().equals("升序")) {
				sqlOrderBy = sqlOrderBy + "shopName asc ";
			} else if (orderQueryBeanVO.geteShopName().trim().equals("降序")) {
				sqlOrderBy = sqlOrderBy + "shopName desc ";
			} else {
				sqlWhere = sqlWhere + " and shopName=? ";
				params.add(orderQueryBeanVO.geteShopName());
			}
		}
		
		if (orderQueryBeanVO.getStatus() != null && !orderQueryBeanVO.getStatus().trim().equals("")) {
			//System.out.println("geteShopName " + orderQueryBeanVO.geteShopName());
			if (orderQueryBeanVO.getStatus().trim().equals("升序")) {
				sqlOrderBy = sqlOrderBy + "orderState asc ";
			} else if (orderQueryBeanVO.getStatus().trim().equals("降序")) {
				sqlOrderBy = sqlOrderBy + "orderState desc ";
			} else {
				sqlWhere = sqlWhere + " and orderState=? ";
				params.add(orderQueryBeanVO.getStatus());
			}
		}
		
		if (orderQueryBeanVO.getBuyerMemo() != null && !orderQueryBeanVO.getBuyerMemo().trim().equals("")) {
			//System.out.println("getBuyerMemo " + orderQueryBeanVO.getBuyerMemo());
			if (orderQueryBeanVO.getBuyerMemo().trim().equals("有买家备注")) {
				sqlWhere = sqlWhere + " and orderBuyerRemark is not null ";
			} else if (orderQueryBeanVO.getBuyerMemo().trim().equals("无买家备注")) {
				sqlWhere = sqlWhere + " and orderBuyerRemark is null ";
			}
		}
		if (orderQueryBeanVO.getSellerMemo() != null && !orderQueryBeanVO.getSellerMemo().trim().equals("")) {
			//System.out.println("getSellerMemo " + orderQueryBeanVO.getSellerMemo());
			if (orderQueryBeanVO.getSellerMemo().trim().equals("有卖家备注")) {
				sqlWhere = sqlWhere + " and orderSellerRemark is not null ";
			}
			if (orderQueryBeanVO.getSellerMemo().trim().equals("无卖家备注")) {
				sqlWhere = sqlWhere + " and orderSellerRemark is null ";
			}
		}
		if (orderQueryBeanVO.getReceiverAddress() != null && !orderQueryBeanVO.getReceiverAddress().trim().equals("")) {
			//System.out.println("getReceiverAddress " + orderQueryBeanVO.getReceiverAddress());
			if (orderQueryBeanVO.getReceiverAddress().trim().equals("升序")) {
				sqlOrderBy = sqlOrderBy + "buyerAddress asc ";
			}
			if (orderQueryBeanVO.getReceiverAddress().trim().equals("降序")) {
				sqlOrderBy = sqlOrderBy + "buyerAddress desc ";
			}
		}
		// expressCompanyNameExpressCode
		if (orderQueryBeanVO.getExpressCompanyNameExpressCode() != null && !orderQueryBeanVO.getExpressCompanyNameExpressCode().trim().equals("")) {
			//System.out.println("getExpressCompanyNameExpressCode " + orderQueryBeanVO.getExpressCompanyNameExpressCode());
			if (orderQueryBeanVO.getExpressCompanyNameExpressCode().trim().equals("升序")) {
				sqlOrderBy = sqlOrderBy + "logisticName asc ";
			} else if (orderQueryBeanVO.getExpressCompanyNameExpressCode().trim().equals("降序")) {
				sqlOrderBy = sqlOrderBy + "logisticName desc ";
			} else {
				sqlWhere = sqlWhere + " and logisticName=? ";
				params.add(orderQueryBeanVO.getExpressCompanyNameExpressCode());
			}
		}
		// expressCompanyName
		if (orderQueryBeanVO.getExpressCompanyName() != null && !orderQueryBeanVO.getExpressCompanyName().trim().equals("")) {
			//System.out.println("getExpressCompanyName " + orderQueryBeanVO.getExpressCompanyName());
			if (orderQueryBeanVO.getExpressCompanyName().trim().equals("升序")) {
				sqlOrderBy = sqlOrderBy + "logisticName asc ";
			} else if (orderQueryBeanVO.getExpressCompanyName().trim().equals("降序")) {
				sqlOrderBy = sqlOrderBy + "logisticName desc ";
			} else {
				sqlWhere = sqlWhere + " and logisticName=? ";
				params.add(orderQueryBeanVO.getExpressCompanyName());
			}
		}
		// skuTotalQuantity
		if (orderQueryBeanVO.getSkuTotalQuantity() != null && !orderQueryBeanVO.getSkuTotalQuantity().trim().equals("")) {
			//System.out.println("getSkuTotalQuantity " + orderQueryBeanVO.getSkuTotalQuantity());
			if (orderQueryBeanVO.getSkuTotalQuantity().trim().equals("升序")) {
				sqlOrderBy = sqlOrderBy + "orderGoodNum asc ";
			}
			if (orderQueryBeanVO.getSkuTotalQuantity().trim().equals("降序")) {
				sqlOrderBy = sqlOrderBy + "orderGoodNum desc ";
			}
		}
		// �ж��Ƿ���orderby����
		if (sqlOrderBy.equals("order by ")) {
			sql = sql + sqlWhere;
		} else {
			sql = sql + sqlWhere + sqlOrderBy;
		}

		/*
		 * ��ҳ
		 */
		sql = sql + " limit ?,? ";
		params.add(orderQueryBeanVO.getCurrentPageNum());
		params.add(orderQueryBeanVO.getCurrentPageSize());
		return queryForList(sql, params);
	}
	//�������޷�ҳ��ѯ��������
	public int orderQueryLYLCount(OrderQueryBeanVOLYL orderQueryBeanVO) {
		String sql = "SELECT orderCode,orderRemind,orderSellerRemark,orderBuyerRemark,orderPayMent,orderFreight,orderTime,orderPayTime,orderExaTime,orderSendTime,orderWaybill,orderSendCode,orderState," + "buyerName,buyerTel,buyerPhone,buyerPostcode,buyerProvince,buyerCity,buyerDistrict,buyerLocation,orderGoodNum,logisticName,shopName,buyerAddress " + " FROM order_order " + " Inner Join order_buyer ON order_order.buyerId = order_buyer.buyerId" + " Inner Join order_logistic ON order_logistic.logisticId = order_order.logisticId" + " Inner Join caigou_shop ON caigou_shop.shopId = order_order.shopId";
		String sqlWhere = " where 1=1 and order_order.userId = '"+orderQueryBeanVO.getUserId()+"' ";
		String sqlOrderBy = "order by ";
		ArrayList<Object> params = new ArrayList<Object>();
		if (orderQueryBeanVO.getSearchText() != null && !orderQueryBeanVO.getSearchText().trim().equals("")) {
			//System.out.println("geteShopName " + orderQueryBeanVO.geteShopName());
				String sousuo = orderQueryBeanVO.getSearchText();
				sqlWhere = sqlWhere + " and shopName like '%" +sousuo+ "%' or logisticName like '%" +sousuo+ "%' or orderCode like '%" +sousuo+ "%' or orderWaybill like '%" +sousuo+ "%' or buyerName like '%" +sousuo+ "%' or orderSendCode like '%" +sousuo+ "%' ";
		}
		if (orderQueryBeanVO.geteShopName() != null && !orderQueryBeanVO.geteShopName().trim().equals("")) {
			if (orderQueryBeanVO.geteShopName().trim().equals("升序")) {
				sqlOrderBy = sqlOrderBy + "shopName asc ";
			} else if (orderQueryBeanVO.geteShopName().trim().equals("降序")) {
			} else {
				sqlWhere = sqlWhere + " and shopName=? ";
				params.add(orderQueryBeanVO.geteShopName());
			}
		}
		
		if (orderQueryBeanVO.getStatus() != null && !orderQueryBeanVO.getStatus().trim().equals("")) {
			//System.out.println("geteShopName " + orderQueryBeanVO.geteShopName());
			if (orderQueryBeanVO.getStatus().trim().equals("升序")) {
				sqlOrderBy = sqlOrderBy + "orderState asc ";
			} else if (orderQueryBeanVO.getStatus().trim().equals("降序")) {
				sqlOrderBy = sqlOrderBy + "orderState desc ";
			} else {
				sqlWhere = sqlWhere + " and orderState=? ";
				params.add(orderQueryBeanVO.getStatus());
			}
		}
		
		if (orderQueryBeanVO.getBuyerMemo() != null && !orderQueryBeanVO.getBuyerMemo().trim().equals("")) {
			if (orderQueryBeanVO.getBuyerMemo().trim().equals("有买家备注")) {
				sqlWhere = sqlWhere + " and orderBuyerRemark is not null ";
			}
			if (orderQueryBeanVO.getBuyerMemo().trim().equals("无买家备注")) {
				sqlWhere = sqlWhere + " and orderBuyerRemark is null ";
			}
		}
		if (orderQueryBeanVO.getSellerMemo() != null && !orderQueryBeanVO.getSellerMemo().trim().equals("")) {
			if (orderQueryBeanVO.getSellerMemo().trim().equals("有卖家备注")) {
				sqlWhere = sqlWhere + " and orderSellerRemark is not null ";
			}
			if (orderQueryBeanVO.getSellerMemo().trim().equals("无卖家备注")) {
				sqlWhere = sqlWhere + " and orderSellerRemark is null ";
			}
		}
		if (orderQueryBeanVO.getReceiverAddress() != null && !orderQueryBeanVO.getReceiverAddress().trim().equals("")) {
			if (orderQueryBeanVO.getReceiverAddress().trim().equals("升序")) {
				sqlOrderBy = sqlOrderBy + "buyerAddress asc ";
			}
			if (orderQueryBeanVO.getReceiverAddress().trim().equals("降序")) {
				sqlOrderBy = sqlOrderBy + "buyerAddress desc ";
			}
		}
		// expressCompanyNameExpressCode
		if (orderQueryBeanVO.getExpressCompanyNameExpressCode() != null && !orderQueryBeanVO.getExpressCompanyNameExpressCode().trim().equals("")) {
			if (orderQueryBeanVO.getExpressCompanyNameExpressCode().trim().equals("升序")) {
				sqlOrderBy = sqlOrderBy + "logisticName asc ";
			} else if (orderQueryBeanVO.getExpressCompanyNameExpressCode().trim().equals("降序")) {
				sqlOrderBy = sqlOrderBy + "logisticName desc ";
			} else {
				sqlWhere = sqlWhere + " and logisticName=? ";
				params.add(orderQueryBeanVO.getExpressCompanyNameExpressCode());
			}
		}
		// expressCompanyName
		if (orderQueryBeanVO.getExpressCompanyName() != null && !orderQueryBeanVO.getExpressCompanyName().trim().equals("")) {
			if (orderQueryBeanVO.getExpressCompanyName().trim().equals("升序")) {
				sqlOrderBy = sqlOrderBy + "logisticName asc ";
			} else if (orderQueryBeanVO.getExpressCompanyName().trim().equals("降序")) {
				sqlOrderBy = sqlOrderBy + "logisticName desc ";
			} else {
				sqlWhere = sqlWhere + " and logisticName=? ";
				params.add(orderQueryBeanVO.getExpressCompanyName());
			}
		}
		// skuTotalQuantity
		if (orderQueryBeanVO.getSkuTotalQuantity() != null && !orderQueryBeanVO.getSkuTotalQuantity().trim().equals("")) {
			if (orderQueryBeanVO.getSkuTotalQuantity().trim().equals("升序")) {
				sqlOrderBy = sqlOrderBy + "orderGoodNum asc ";
			}
			if (orderQueryBeanVO.getSkuTotalQuantity().trim().equals("降序")) {
				sqlOrderBy = sqlOrderBy + "orderGoodNum desc ";
			}
		}
		// �ж��Ƿ���orderby����
		if (sqlOrderBy.equals("order by ")) {
			sql = sql + sqlWhere;
		} else {
			sql = sql + sqlWhere + sqlOrderBy;
		}
		

		return (queryForList(sql, params)).size();

	}


	@Override
	public List<OrderBeanPO> mapRow(ResultSet rs) throws Exception {
		List<OrderBeanPO> list = new ArrayList<OrderBeanPO>();
		OrderBeanPO order = null;
		while (rs.next()) {
			order = new OrderBeanPO();
			order.setBuyerCity(rs.getString("buyerCity"));
			order.setBuyerDistrict(rs.getString("buyerDistrict"));
			order.setBuyerLocation(rs.getString("buyerLocation"));
			order.setBuyerName(rs.getString("buyerName"));
			order.setBuyerPhone(rs.getString("buyerPhone"));
			order.setBuyerPostcode(rs.getString("buyerPostcode"));
			order.setBuyerProvince(rs.getString("buyerProvince"));
			order.setBuyerTel(rs.getString("buyerTel"));
			order.setOrderGoodNum(rs.getString("orderGoodNum"));
			order.setLogisticName(rs.getString("logisticName"));
			order.setOrderBuyerRemark(rs.getString("orderBuyerRemark"));
			order.setOrderExaTime(rs.getString("orderExaTime"));
			order.setOrderFreight(rs.getString("orderFreight"));
			order.setOrderCode(rs.getString("orderCode"));
			order.setOrderPayMent(rs.getString("orderPayMent"));
			order.setOrderPayTime(rs.getString("orderPayTime"));
			order.setOrderTime(rs.getString("orderTime"));
			order.setOrderRemind(rs.getString("orderRemind"));
			order.setOrderSellerRemark(rs.getString("orderSellerRemark"));
			order.setOrderSendCode(rs.getString("orderSendCode"));
			order.setOrderSendTime(rs.getString("orderSendTime"));
			order.setOrderState(rs.getString("orderState"));
			order.setOrderWaybill(rs.getString("orderWaybill"));
			order.setShopName(rs.getString("shopName"));
			order.setBuyerAddress(rs.getString("buyerAddress"));
			
//			System.out.println(rs.getString("buyerName"));
		
			list.add(order);
		}
		return list;
	}

}
