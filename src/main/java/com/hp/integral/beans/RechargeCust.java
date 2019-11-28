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
 * @since 2019-11-28
 */
@TableName("tb_recharge_cust")
public class RechargeCust extends Model<RechargeCust> {

    private static final long serialVersionUID = 1L;

    /**
     * 充值的id
     */
    @TableId(value = "recharge_id", type = IdType.AUTO)
    private Integer rechargeId;
    /**
     * 充值的账号
     */
    private Integer rechargeCustId;
    /**
     * 充值的金额
     */
    private Integer rechargeMoney;
    /**
     * 充值之前的积分
     */
    private Integer oldIntegral;
    /**
     * 充值的积分
     */
    private Integer rechargeIntegral;
    /**
     * 充值之后的积分
     */
    private Integer newIntegral;
    /**
     * 充值时间
     */
    @TableField(fill = FieldFill.INSERT)
    private Date createTime;
    /**
     * 提现的状态（100是同意，200是驳回）
     */
    private String rechargeState;
    /**
     * 是否删除
     */
    @TableField(fill = FieldFill.INSERT)
    @TableLogic
    private Integer isDel;


    public Integer getRechargeId() {
        return rechargeId;
    }

    public void setRechargeId(Integer rechargeId) {
        this.rechargeId = rechargeId;
    }

    public Integer getRechargeCustId() {
        return rechargeCustId;
    }

    public void setRechargeCustId(Integer rechargeCustId) {
        this.rechargeCustId = rechargeCustId;
    }

    public Integer getRechargeMoney() {
        return rechargeMoney;
    }

    public void setRechargeMoney(Integer rechargeMoney) {
        this.rechargeMoney = rechargeMoney;
    }

    public Integer getOldIntegral() {
        return oldIntegral;
    }

    public void setOldIntegral(Integer oldIntegral) {
        this.oldIntegral = oldIntegral;
    }

    public Integer getRechargeIntegral() {
        return rechargeIntegral;
    }

    public void setRechargeIntegral(Integer rechargeIntegral) {
        this.rechargeIntegral = rechargeIntegral;
    }

    public Integer getNewIntegral() {
        return newIntegral;
    }

    public void setNewIntegral(Integer newIntegral) {
        this.newIntegral = newIntegral;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getRechargeState() {
        return rechargeState;
    }

    public void setRechargeState(String rechargeState) {
        this.rechargeState = rechargeState;
    }

    public Integer getIsDel() {
        return isDel;
    }

    public void setIsDel(Integer isDel) {
        this.isDel = isDel;
    }

    @Override
    protected Serializable pkVal() {
        return this.rechargeId;
    }

    @Override
    public String toString() {
        return "RechargeCust{" +
        ", rechargeId=" + rechargeId +
        ", rechargeCustId=" + rechargeCustId +
        ", rechargeMoney=" + rechargeMoney +
        ", oldIntegral=" + oldIntegral +
        ", rechargeIntegral=" + rechargeIntegral +
        ", newIntegral=" + newIntegral +
        ", createTime=" + createTime +
        ", rechargeState=" + rechargeState +
        ", isDel=" + isDel +
        "}";
    }
}
