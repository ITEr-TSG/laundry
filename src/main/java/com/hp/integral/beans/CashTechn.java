package com.hp.integral.beans;

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
 * @since 2019-11-27
 */
@TableName("tb_cash_techn")
public class CashTechn extends Model<CashTechn> {

    private static final long serialVersionUID = 1L;

    /**
     * 技师提现资金核对
     */
    @TableId(value = "cash_id", type = IdType.AUTO)
    private Integer cashId;
    /**
     * 技师id
     */
    private Integer technId;
    /**
     * 提现的方式（微信、支付宝）
     */
    private String cashWay;
    /**
     * 提现的账号
     */
    private String cashAccount;
    /**
     * 提现的金额
     */
    private Integer cashMoney;
    /**
     * 提现之前的积分
     */
    private Integer oldIntegral;
    /**
     * 提现的积分
     */
    private Integer cashIntegral;
    /**
     * 提现时间
     */
    @TableField(fill = FieldFill.INSERT)
    private Date createTime;
    /**
     * 提现的状态（100是申请，200是驳回，300同意）
     */
    private String cashState;
    /**
     * 是否删除（-1删除，1未删除）
     */
    @TableField(fill = FieldFill.INSERT)
    @TableLogic
    private Integer isDel;

    public Integer getIsDel() {
		return isDel;
	}

	public void setIsDel(Integer isDel) {
		this.isDel = isDel;
	}

	public Integer getCashId() {
        return cashId;
    }

    public void setCashId(Integer cashId) {
        this.cashId = cashId;
    }

    public Integer getTechnId() {
        return technId;
    }

    public void setTechnId(Integer technId) {
        this.technId = technId;
    }

    public String getCashWay() {
        return cashWay;
    }

    public void setCashWay(String cashWay) {
        this.cashWay = cashWay;
    }

    public String getCashAccount() {
        return cashAccount;
    }

    public void setCashAccount(String cashAccount) {
        this.cashAccount = cashAccount;
    }

    public Integer getCashMoney() {
        return cashMoney;
    }

    public void setCashMoney(Integer cashMoney) {
        this.cashMoney = cashMoney;
    }

    public Integer getOldIntegral() {
        return oldIntegral;
    }

    public void setOldIntegral(Integer oldIntegral) {
        this.oldIntegral = oldIntegral;
    }

    public Integer getCashIntegral() {
        return cashIntegral;
    }

    public void setCashIntegral(Integer cashIntegral) {
        this.cashIntegral = cashIntegral;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getCashState() {
        return cashState;
    }

    public void setCashState(String cashState) {
        this.cashState = cashState;
    }

    @Override
    protected Serializable pkVal() {
        return this.cashId;
    }

    @Override
    public String toString() {
        return "CashTechn{" +
        ", cashId=" + cashId +
        ", technId=" + technId +
        ", cashWay=" + cashWay +
        ", cashAccount=" + cashAccount +
        ", cashMoney=" + cashMoney +
        ", oldIntegral=" + oldIntegral +
        ", cashIntegral=" + cashIntegral +
        ", createTime=" + createTime +
        ", cashState=" + cashState +
        "}";
    }
}
