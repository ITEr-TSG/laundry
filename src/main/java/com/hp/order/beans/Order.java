package com.hp.order.beans;

import com.baomidou.mybatisplus.enums.FieldFill;
import com.baomidou.mybatisplus.enums.IdType;
import java.util.Date;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableLogic;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author ITEr
 * @since 2019-11-30
 */
@TableName("tb_order")
public class Order extends Model<Order> {

    private static final long serialVersionUID = 1L;

    /**
     * 订单表的id
     */
    @TableId(value = "order_id", type = IdType.AUTO)
    private Integer orderId;
    /**
     * 订单号
     */
    private String orderNumber;
    /**
     * 下单人id
     */
    private Integer custId;
    /**
     * 下单人名
     */
    private String custName;
    /**
     * 指定技师id
     */
    private Integer technId;
    /**
     * 技师名
     */
    private String technName;
    /**
     * 顾客
     */
    private String shopper;
    /**
     * 地址
     */
    private String address;
    /**
     * 顾客联系方式
     */
    private String email;
    /**
     * 订单状态
     */
    private String state;
    /**
     * 订单条目
     */
    private Integer itemId;
    /**
     * 条目类型
     * */
    private String itemSort;
    /**
     * 订单名称
     */
    private String itemName;
    /**
     * 订单价格
     */
    private Integer price;
    /**
     * 约定的取货时间
     */
    private Date appointTime;
    /**
     * 下单时间
     */
    @TableField(fill = FieldFill.INSERT)
    private Date createTime;
    /**
     * 收货时间
     */
    private Date overTime;
    /**
     * 订单评价（打五星）
     */
    
    private Integer evaluate;
    /**
     * 是否删除
     */
    @TableField(fill = FieldFill.INSERT)
    @TableLogic
    private Integer isDel;


    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
    }

    public Integer getCustId() {
        return custId;
    }

    public void setCustId(Integer custId) {
        this.custId = custId;
    }

    public String getCustName() {
        return custName;
    }

    public void setCustName(String custName) {
        this.custName = custName;
    }

    public Integer getTechnId() {
        return technId;
    }

    public void setTechnId(Integer technId) {
        this.technId = technId;
    }

    public String getTechnName() {
        return technName;
    }

    public void setTechnName(String technName) {
        this.technName = technName;
    }

    public String getShopper() {
        return shopper;
    }

    public void setShopper(String shopper) {
        this.shopper = shopper;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public Integer getItemId() {
        return itemId;
    }

    public void setItemId(Integer itemId) {
        this.itemId = itemId;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public Date getAppointTime() {
        return appointTime;
    }

    public void setAppointTime(Date appointTime) {
        this.appointTime = appointTime;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getOverTime() {
        return overTime;
    }

    public void setOverTime(Date overTime) {
        this.overTime = overTime;
    }

    public Integer getEvaluate() {
        return evaluate;
    }

    public void setEvaluate(Integer evaluate) {
        this.evaluate = evaluate;
    }

    public Integer getIsDel() {
        return isDel;
    }

    public void setIsDel(Integer isDel) {
        this.isDel = isDel;
    }

    @Override
    protected Serializable pkVal() {
        return this.orderId;
    }

	public String getItemSort() {
		return itemSort;
	}

	public void setItemSort(String itemSort) {
		this.itemSort = itemSort;
	}

	@Override
	public String toString() {
		return "Order [orderId=" + orderId + ", orderNumber=" + orderNumber + ", custId=" + custId + ", custName="
				+ custName + ", technId=" + technId + ", technName=" + technName + ", shopper=" + shopper + ", address="
				+ address + ", email=" + email + ", state=" + state + ", itemId=" + itemId + ", itemSort=" + itemSort
				+ ", itemName=" + itemName + ", price=" + price + ", appointTime=" + appointTime + ", createTime="
				+ createTime + ", overTime=" + overTime + ", evaluate=" + evaluate + ", isDel=" + isDel + "]";
	}
    
}
