package mjy.order.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import mjy.order.bean.po.OrderPO;
import mjy.order.bean.vo.Buyer;
import mjy.order.bean.vo.DetailGood;
import mjy.order.bean.vo.Order;
import mjy.order.dao.OrderDao;

public class OrderDaoImpl extends BaseDao<Order> implements OrderDao {

	@Override
	public List<Order> queryAll() {
		String sql = "select * from order_order";
		List<Object> parames = new ArrayList<Object>();
		return query(sql, parames, new RowMapAdaptive<Order>() {

			@Override
			public List<Order> mapRows(ResultSet res) {

				List<Order> list = null;
				try {
					list = new ArrayList<Order>();
					while (res.next()) {

						Order order = new Order();
						order.setOrderId(res.getInt("orderId"));
						order.setBuyerId(res.getInt("buyerId"));
						order.setLogisticId(res.getInt("logisticId"));
						order.setShopId(res.getInt("shopId"));
						order.setUserId(res.getInt("userId"));
						order.setOrderCode(res.getString("orderCode"));
						order.setOrderRemind(res.getInt("orderRemind"));
						order.setOrderBuyerRemark(res.getString("orderBuyerRemark"));
						order.setOrderSellerRemark(res.getString("orderSellerRemark"));
						order.setOrderPayWay(res.getInt("orderPayWay"));
						order.setOrderPayTpye(res.getInt("orderPayTpye"));
						order.setOrderPayMent(res.getDouble("orderPayMent"));
						order.setOrderFreight(res.getDouble("orderFreight"));
						order.setOrderTime(res.getString("orderTime"));
						order.setOrderPayTime(res.getString("orderPayTime"));
						order.setOrderExaTime(res.getString("orderExaTime"));
						order.setOrderSendTime(res.getString("orderSendTime"));
						order.setOrderWaybill(res.getString("orderWaybill"));
						order.setOrderSendCode(res.getString("orderSendCode"));
						order.setOrderState(res.getInt("orderState"));
						order.setOrderTotal(res.getDouble("orderTotal"));

						list.add(order);

					}
				} catch (SQLException e) {

					e.printStackTrace();
				}

				return list;
			}

		});

	}

	public List<Order> orderQuery(OrderPO orderPO) {
		// List<Order> orders = new ArrayList<Order>();

		List<Object> parames = new ArrayList<Object>();
		StringBuffer orderSql = new StringBuffer("SELECT * FROM order_order where 1=1");

		if (orderPO != null) {
			// Buyer buyer = null;
			// ����Ҫ�жϸ�ҳ���ѯ����ʲô״̬�µĶ���������״̬ͨ��ҳ���url��������ã�
			if (orderPO.getUserId()!=null) {
				orderSql.append(" and userId=?");
				parames.add(orderPO.getUserId());
			}
			if (orderPO.getOrderState() != null) {
				orderSql.append(" and orderState=?");
				parames.add(orderPO.getOrderState());
			}
			// �����ţ����ڶ�������Ψһ�ģ����е���ѯ��������ֶ�����ʱ������ֱ�Ӳ�ѯ������
			if (orderPO.getOrderCode() != null && !orderPO.getOrderCode().equals("")) {
				orderSql.append(" and orderCode = ?");
				parames.add(orderPO.getOrderCode());
			} else {
				// �жϵ���id
				if (orderPO.getShopId() != null) {
					orderSql.append(" and shopId = ?");
					parames.add(orderPO.getShopId());
				}
				// �������
				if (orderPO.getLogisticId() != null) {
					orderSql.append(" and logisticId = ?");
					parames.add(orderPO.getLogisticId());
				}
				// ֧����ʽ��int��
				if (orderPO.getOrderPayWay() != null) {
					orderSql.append(" and orderPayWay = ?");
					parames.add(orderPO.getOrderPayWay());
				}

				/**
				 * �߼�������ajax����в�ѯʱ�������й����ջ��˵���ݴ�����buyerPO��
				 * �ջ���,��servlet����ȡǰ̨���ʱ�������ջ��˵���Ϣȫ����װ��buyerPO�Ȼ��һ���װ��orderPO�
				 * ����Ҫ�õ�����ѯ
				 */
				if (orderPO.getBuyerPO().getBuyerAddress() != null||orderPO.getBuyerPO().getBuyerId() != null
						||orderPO.getBuyerPO().getBuyerName() != null||orderPO.getBuyerPO().getBuyerPhone() != null
						||orderPO.getBuyerPO().getBuyerTel() != null) {

					// BuyerDaoImpl new BuyerDaoImpl() = ;
					List<Buyer> buyers = new BuyerDaoImpl().queryBuyer(orderPO.getBuyerPO());
					/**
					 * ����Ҫ�����ǣ�ͨ���ѯ��õ�����buyer,������е�buyerId
					 * Ȼ����ͨ����Щ����е�id��ѯ�����еĶ���id;
					 * ������ӵĲ�ѯ����Ϊ��in(buyid),buyid�����飬ͨ��ϻ��
					 */
					StringBuffer buyerSql = new StringBuffer(" and buyerId in(");
					int index = 0;
					for (Buyer buyer : buyers) {
						if (index < buyers.size() - 1) {
							buyerSql.append("?,");
						} else {
							buyerSql.append("?)");
						}
						index++;
						parames.add(buyer.getBuyerId());
					}
					orderSql.append(buyerSql);
				}

				// ��Ʒ��ѯ
				if (orderPO.getDetailGoodPO().getDetailGoodNum() != null||orderPO.getDetailGoodPO().getGoodId() != null
						||orderPO.getDetailGoodPO().getGoodName() != null||orderPO.getDetailGoodPO().getOrderCode() != null
						||orderPO.getDetailGoodPO().getSku() != null) {
					List<DetailGood> DetailGoods = new DetailGoodDaoImpl().detailGoodQuery(orderPO.getDetailGoodPO());
					/**
					 * ��ѯ�����е���Ʒ��Ϣ������������ Ȼ����ͨ����Щ��Ʒ��Ϣ�е�id��ѯ����Ӧ�Ķ���Code(������)
					 */
					StringBuffer goodSql = new StringBuffer(" and orderCode in(");
					Set<String> orderCodeSet = new HashSet<String>();
					for (DetailGood detailGood : DetailGoods) {
						orderCodeSet.add(detailGood.getOrderCode());
					}
					int index = 0;
					for (String orderCode : orderCodeSet) {
						if (index < orderCodeSet.size() - 1) {
							goodSql.append("?,");
						} else {
							goodSql.append("?)");
						}
						index++;
						parames.add(orderCode);
					}
					orderSql.append(goodSql);
				}

				// ��ע���޵Ĳ�ѯ
				if (orderPO.getBuyerRemark() != null&&orderPO.getBuyerRemark()!=0) {
					/**
					 * ��orderPo���buyerRemark==1ʱ��˵����ѯ����Ϊ����ұ�ע
					 */
					if (orderPO.getBuyerRemark() == 1) {
						orderSql.append(" and orderBuyerRemark!=\"\"");
					} else {
						orderSql.append(" and ISNULL(orderBuyerRemark)");
					}
				}
				if (orderPO.getSellerRemark() != null&&orderPO.getSellerRemark()!=0) {
					/**
					 * ��orderPo���sellerRemark==1ʱ��˵����ѯ����Ϊ�����ұ�ע
					 */
					if (orderPO.getSellerRemark() == 1) {
						orderSql.append(" AND orderSellerRemark!=\"\"");
					} else {
						orderSql.append(" AND ISNULL(orderSellerRemark)");
					}
				}

				// ����ʱ��Ĳ�ѯ
				// 1.�µ�ʱ�䣨�κ����������Բ飩
				if (orderPO.getOrderTimeFrom() != null && !orderPO.getOrderTimeFrom().equals("")) {
					orderSql.append(" and orderTime > ?");
					parames.add(orderPO.getOrderTimeFrom());
				}
				if (orderPO.getOrderTimeTo() != null && !orderPO.getOrderTimeTo().equals("")) {
					orderSql.append(" and orderTime < ?");
					parames.add(orderPO.getOrderTimeTo());
				}
				// 2.��ʱ�䣨���Ժ�Ŀ��Բ飩
				if (orderPO.getOrderExaTimeFrom() != null && !orderPO.getOrderExaTimeFrom().equals("")) {
					orderSql.append(" and orderExaTime > ?");
					parames.add(orderPO.getOrderExaTimeFrom());
				}
				if (orderPO.getOrderExaTimeTo() != null && !orderPO.getOrderExaTimeTo().equals("")) {
					orderSql.append(" and orderExaTime < ?");
					parames.add(orderPO.getOrderExaTimeTo());
				}
				// 3.����ʱ�䣨�����Ժ�Ŀ��Բ飩
				if (orderPO.getOrderSendTimeFrom() != null && !orderPO.getOrderSendTimeFrom().equals("")) {
					orderSql.append(" and orderSendTime < ?");
					parames.add(orderPO.getOrderSendTimeFrom());
				}
				if (orderPO.getOrderSendTimeTo() != null && !orderPO.getOrderSendTimeTo().equals("")) {
					orderSql.append(" and orderSendTime > ?");
					parames.add(orderPO.getOrderSendTimeTo());
				}
			}
			if (orderPO.getBeginRow()!=null&&orderPO.getPageSize()!=null) {
				orderSql.append("  LIMIT "+orderPO.getBeginRow()+","+orderPO.getPageSize());
			}
		}
		
		String sql = orderSql.toString();
		System.out.println("数据库查询语句："+sql);
		return this.query(sql, parames, new RowMapAdaptive<Order>() {

			@Override
			public List<Order> mapRows(ResultSet res) {
				List<Order> list = null;
				try {
					list = new ArrayList<Order>();
					Order order = null;
					while (res.next()) {
						order = new Order();
						order.setOrderId(res.getInt("orderId"));
						order.setBuyerId(res.getInt("buyerId"));
						order.setLogisticId(res.getInt("logisticId"));
						order.setShopId(res.getInt("shopId"));
						order.setUserId(res.getInt("userId"));
						order.setOrderCode(res.getString("orderCode"));// ������
						order.setOrderRemind(res.getInt("orderRemind"));// ����
						
						order.setOrderBuyerRemark(res.getString("orderBuyerRemark"));
						order.setOrderSellerRemark(res.getString("orderSellerRemark"));
						order.setOrderPayWay(res.getInt("orderPayWay"));//���ʽ
						order.setOrderPayTpye(res.getInt("orderPayTpye"));//�������� 
						order.setOrderPayMent(res.getDouble("orderPayMent"));//ʵ����
						order.setOrderFreight(res.getDouble("orderFreight"));//�˷�
						
						//�˴���õ���yyyy-mm-dd hh:mm:ss ��ʽ��ͨ��toStringת����string���ͣ���ǰ̨��ͨ��date.formateת��Ϊdate��ݣ�
						order.setOrderTime(res.getTimestamp("orderTime")+"");//����ʱ��
						order.setOrderPayTime(res.getTimestamp("orderPayTime")+"");//����ʱ��
						order.setOrderExaTime(res.getTimestamp("orderExaTime")+"");//��ʱ��
						order.setOrderSendTime(res.getTimestamp("orderSendTime")+"");//����ʱ��
						
						order.setOrderWaybill(res.getString("orderWaybill"));//�˵���
						order.setOrderSendCode(res.getString("orderSendCode"));//��������
						order.setOrderState(res.getInt("orderState"));//����״̬
						order.setOrderTotal(res.getDouble("orderTotal"));//��������ܺϼ�
						order.setOrderGoodNum(res.getInt("orderGoodNum"));//��������Ʒ��������
						order.setOrderExpressCode(res.getString("orderExpressCode"));//��ݵ���
						order.setOrderFee(res.getDouble("orderFee"));//�����Ż�
						order.setOrderFavorable(res.getDouble("orderFavorable"));//��Ʒ���Ż�
						order.setOrderWeight(res.getDouble("orderWeight"));//��Ʒ������
						list.add(order);
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
				return list;
			}
		});
	}
	
	//��ѯ������
	public int orderCounts(OrderPO orderPO) {
		// List<Order> orders = new ArrayList<Order>();

		List<Object> parames = new ArrayList<Object>();
		StringBuffer orderSql = new StringBuffer("SELECT count(*) counts FROM order_order where 1=1");

		if (orderPO != null) {
			// Buyer buyer = null;
			// ����Ҫ�жϸ�ҳ���ѯ����ʲô״̬�µĶ���������״̬ͨ��ҳ���url��������ã�
			if (orderPO.getOrderState() != null) {
				orderSql.append(" and orderState=?");
				parames.add(orderPO.getOrderState());
			}
			// �����ţ����ڶ�������Ψһ�ģ����е���ѯ��������ֶ�����ʱ������ֱ�Ӳ�ѯ������
			if (orderPO.getOrderCode() != null && !orderPO.getOrderCode().equals("")) {
				orderSql.append(" and orderCode = ?");
				parames.add(orderPO.getOrderCode());
			} else {
				// �жϵ���id
				if (orderPO.getShopId() != null) {
					orderSql.append(" and shopId = ?");
					parames.add(orderPO.getShopId());
				}
				// �������
				if (orderPO.getLogisticId() != null) {
					orderSql.append(" and logisticId = ?");
					parames.add(orderPO.getLogisticId());
				}
				// ֧����ʽ��int��
				if (orderPO.getOrderPayWay() != null) {
					orderSql.append(" and orderPayWay = ?");
					parames.add(orderPO.getOrderPayWay());
				}

				if (orderPO.getBuyerPO().getBuyerAddress() != null||orderPO.getBuyerPO().getBuyerId() != null
						||orderPO.getBuyerPO().getBuyerName() != null||orderPO.getBuyerPO().getBuyerPhone() != null
						||orderPO.getBuyerPO().getBuyerTel() != null) {

					// BuyerDaoImpl new BuyerDaoImpl() = ;
					List<Buyer> buyers = new BuyerDaoImpl().queryBuyer(orderPO.getBuyerPO());
					StringBuffer buyerSql = new StringBuffer(" and buyerId in(");
					int index = 0;
					for (Buyer buyer : buyers) {
						if (index < buyers.size() - 1) {
							buyerSql.append("?,");
						} else {
							buyerSql.append("?)");
						}
						index++;
						parames.add(buyer.getBuyerId());
					}
					orderSql.append(buyerSql);
				}

				// ��Ʒ��ѯ
				if (orderPO.getDetailGoodPO().getDetailGoodNum() != null||orderPO.getDetailGoodPO().getGoodId() != null
						||orderPO.getDetailGoodPO().getGoodName() != null||orderPO.getDetailGoodPO().getOrderCode() != null
						||orderPO.getDetailGoodPO().getSku() != null) {
					List<DetailGood> DetailGoods = new DetailGoodDaoImpl().detailGoodQuery(orderPO.getDetailGoodPO());
					/**
					 * ��ѯ�����е���Ʒ��Ϣ������������ Ȼ����ͨ����Щ��Ʒ��Ϣ�е�id��ѯ����Ӧ�Ķ���Code(������)
					 */
					StringBuffer goodSql = new StringBuffer(" and orderCode in(");
					Set<String> orderCodeSet = new HashSet<String>();
					for (DetailGood detailGood : DetailGoods) {
						orderCodeSet.add(detailGood.getOrderCode());
					}
					int index = 0;
					for (String orderCode : orderCodeSet) {
						if (index < orderCodeSet.size() - 1) {
							goodSql.append("?,");
						} else {
							goodSql.append("?)");
						}
						index++;
						parames.add(orderCode);
					}
					orderSql.append(goodSql);
				}

				// ��ע���޵Ĳ�ѯ
				if (orderPO.getBuyerRemark() != null&&orderPO.getBuyerRemark()!=0) {
					/**
					 * ��orderPo���buyerRemark==1ʱ��˵����ѯ����Ϊ����ұ�ע
					 */
					if (orderPO.getBuyerRemark() == 1) {
						orderSql.append(" and orderBuyerRemark!=\"\"");
					} else {
						orderSql.append(" and ISNULL(orderBuyerRemark)");
					}
				}
				if (orderPO.getSellerRemark() != null&&orderPO.getSellerRemark()!=0) {
					if (orderPO.getSellerRemark() == 1) {
						orderSql.append(" AND orderSellerRemark!=\"\"");
					} else {
						orderSql.append(" AND ISNULL(orderSellerRemark)");
					}
				}

				// ����ʱ��Ĳ�ѯ
				// 1.�µ�ʱ�䣨�κ����������Բ飩
				if (orderPO.getOrderTimeFrom() != null && !orderPO.getOrderTimeFrom().equals("")) {
					orderSql.append(" and orderTime > ?");
					parames.add(orderPO.getOrderTimeFrom());
				}
				if (orderPO.getOrderTimeTo() != null && !orderPO.getOrderTimeTo().equals("")) {
					orderSql.append(" and orderTime < ?");
					parames.add(orderPO.getOrderTimeTo());
				}
				// 2.��ʱ�䣨���Ժ�Ŀ��Բ飩
				if (orderPO.getOrderExaTimeFrom() != null && !orderPO.getOrderExaTimeFrom().equals("")) {
					orderSql.append(" and orderExaTime > ?");
					parames.add(orderPO.getOrderExaTimeFrom());
				}
				if (orderPO.getOrderExaTimeTo() != null && !orderPO.getOrderExaTimeTo().equals("")) {
					orderSql.append(" and orderExaTime < ?");
					parames.add(orderPO.getOrderExaTimeTo());
				}
				// 3.����ʱ�䣨�����Ժ�Ŀ��Բ飩
				if (orderPO.getOrderSendTimeFrom() != null && !orderPO.getOrderSendTimeFrom().equals("")) {
					orderSql.append(" and orderSendTime < ?");
					parames.add(orderPO.getOrderSendTimeFrom());
				}
				if (orderPO.getOrderSendTimeTo() != null && !orderPO.getOrderSendTimeTo().equals("")) {
					orderSql.append(" and orderSendTime > ?");
					parames.add(orderPO.getOrderSendTimeTo());
				}
			}

		}
		String sql = orderSql.toString();
		return this.amount(sql, parames, new RowMapAdaptive<Order>(){
			@Override
			public int mapRowCounts(ResultSet res) {
				int counts = 0;
				try {
					if (res.next()) {
						counts = res.getInt("counts");
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
				return counts;
			}
		});
	}
	public static void main(String[] args) {
		OrderDaoImpl orderDaoImpl = new OrderDaoImpl();
		
//		OrderPO orderPO = new OrderPO();
//		orderPO.setOrderState(1);
//		BuyerPO buyerPO = new BuyerPO();
//		orderPO.setBuyerPO(buyerPO);
//		orderPO.setSellerRemark(1);
//		orderPO.setOrderCode("123456");
		/*//�ջ�����Ϣ
		BuyerPO buyerPO = new BuyerPO();
		buyerPO.setBuyerPhone("15345695428");
		buyerPO.setBuyerTel("6898348");
		buyerPO.setBuyerAddress("�ܿ�");
		buyerPO.setBuyerName("��");
		//��Ʒ��Ϣ
		DetailGoodPO detailGoodPO = new DetailGoodPO();
		detailGoodPO.setSku("606");
		detailGoodPO.setGoodId(606);
		detailGoodPO.setDetailGoodNum(1);
//		orderPO.setBuyerPO(buyerPO);
		orderPO.setDetailGoodPO(detailGoodPO);
		orderPO.setBuyerPO(buyerPO);
		orderPO.setShopId(2);
		orderPO.setLogisticId(2);
		orderPO.setOrderPayWay(1);
//		orderPO.setOrderCode(123456);
		orderPO.setBuyerRemark(1);
		orderPO.setSellerRemark(1);*/
//		orderPO.setBeginRow(2);
//		orderPO.setPageSize(5);
		/*List<Order> orders = orderDaoImpl.orderQuery(orderPO);
		System.out.println(orders.size());
		for (Order order : orders) {
			System.out.println(order);
		}*/
		
//		System.out.println(orderDaoImpl.orderCounts(orderPO));
		orderDaoImpl.update("OD201612061407001",1);
	}

	@Override
	public void update(String orderCheck,Integer state) {
		String sql = "UPDATE order_order SET orderState=? WHERE orderCode=?";
		List<Object> parames = new ArrayList<Object>();
		if (state!=0) {
			parames.add(state);
		}
		if (orderCheck!=null&&!orderCheck.equals("")) {
			parames.add(orderCheck);
		}
		this.alter(sql, parames);
	}
}
