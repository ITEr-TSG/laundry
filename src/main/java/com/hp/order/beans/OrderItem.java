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
 * @since 2019-11-29
 */
@TableName("tb_order_item")
public class OrderItem extends Model<OrderItem> {

    private static final long serialVersionUID = 1L;

    /**
     * 订单条目id
     */
    @TableId(value = "item_id", type = IdType.AUTO)
    private Integer itemId;
    /**
     * 条目标题
     */
    private String itemName;
    /**
     * 价格（积分）
     */
    private Integer itemPrice;
    /**
     * 描述1
     */
    private String descOne;
    /**
     * 描述2
     */
    private String descTwo;
    /**
     * 描述3
     */
    private String descThree;
    private String descFour;
    private String descFive;
    /**
     * 条目状态（上架或者下架）
     */
    private String itemState;
    /**
     * 条目上架的时间
     */
    @TableField(fill = FieldFill.INSERT)
    private Date createTime;
    /**
     * 是否删除
     */
    @TableField(fill = FieldFill.INSERT)
    @TableLogic
    private Integer isDel;


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

    public Integer getItemPrice() {
        return itemPrice;
    }

    public void setItemPrice(Integer itemPrice) {
        this.itemPrice = itemPrice;
    }
    
    public String getDescOne() {
		return descOne;
	}

	public void setDescOne(String descOne) {
		this.descOne = descOne;
	}

	public String getDescTwo() {
		return descTwo;
	}

	public void setDescTwo(String descTwo) {
		this.descTwo = descTwo;
	}

	public String getDescThree() {
		return descThree;
	}

	public void setDescThree(String descThree) {
		this.descThree = descThree;
	}

	public String getDescFour() {
		return descFour;
	}

	public void setDescFour(String descFour) {
		this.descFour = descFour;
	}

	public String getDescFive() {
		return descFive;
	}

	public void setDescFive(String descFive) {
		this.descFive = descFive;
	}

	public String getItemState() {
        return itemState;
    }

    public void setItemState(String itemState) {
        this.itemState = itemState;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getIsDel() {
        return isDel;
    }

    public void setIsDel(Integer isDel) {
        this.isDel = isDel;
    }

    @Override
    protected Serializable pkVal() {
        return this.itemId;
    }

	@Override
	public String toString() {
		return "OrderItem [itemId=" + itemId + ", itemName=" + itemName + ", itemPrice=" + itemPrice + ", descOne="
				+ descOne + ", descTwo=" + descTwo + ", descThree=" + descThree + ", descFour=" + descFour
				+ ", descFive=" + descFive + ", itemState=" + itemState + ", createTime=" + createTime + ", isDel="
				+ isDel + "]";
	}

  
}
