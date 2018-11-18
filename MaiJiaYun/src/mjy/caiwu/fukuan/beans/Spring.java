package mjy.caiwu.fukuan.beans;

import java.io.InputStream;
import java.lang.reflect.Method;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.Map;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

/**
 * 对象仓库
 * 
 * @author student
 *
 */
public class Spring {
	private String xmlPath = "/mjy/caiwu/fukuan/beans/beans.xml";// 默认路径
	private Map<String, Object> beans = new Hashtable<>();// 存放对象

	public Spring() {
		init();
	}

	/**
	 * 设置路径
	 * 
	 * @param xmlPath
	 */
	public Spring(String xmlPath) {
		this.xmlPath = xmlPath;
	}

	/**
	 * 初始化对象
	 */
	@SuppressWarnings("unchecked")
	private void init() {
		// 获取XML输入流
		InputStream in = this.getClass().getClassLoader()
				.getResourceAsStream(xmlPath);

		// 通过dom4j解析
		SAXReader reader = new SAXReader();
		try {
			// 获取dom4j的document对象
			Document doc = reader.read(in);
			// 获取根节点
			Element root = doc.getRootElement();
			// 获取子元素的迭代器
			Iterator<Element> beanIt = root.elementIterator();

			while (beanIt.hasNext()) {
				Element beanElement = beanIt.next();

				if (beanElement.getName().equals("bean")) {
					// 获取属性值
					String id = beanElement.attributeValue("id");
					String className = beanElement.attributeValue("class");
					// ͨ通过反射创建对象
					Object obj = Class.forName(className).newInstance();
					// 存放进集合
					beans.put(id, obj);

					// 判断是否需要注入
					Iterator<Element> propertys = beanElement.elementIterator();
					while (propertys.hasNext()) {
						Element property = propertys.next();
						if (property.getName().equals("property")) {
							String arrtName = property.attributeValue("name");
							String refName = property.attributeValue("ref");
							// 需要注入的对象
							Object refObj = beans.get(refName);
							Class clazz = Class.forName(className);
							// 获取set的方法名
							String methodName = "set"
									+ arrtName.substring(0, 1).toUpperCase()
									+ arrtName.substring(1);
							// 获取set的方法
							Method method = clazz.getDeclaredMethod(methodName,
									refObj.getClass().getInterfaces()[0]);
							// 调用方法，进行注入
							method.invoke(obj, refObj);
						}
					}

				}

			}

		} catch (Exception e) {

			e.printStackTrace();
		}

	}

	/**
	 * 得到对象
	 * 
	 * @param id
	 * @return
	 */
	public Object getBeans(String id) {
		return beans.get(id);
	}

}
