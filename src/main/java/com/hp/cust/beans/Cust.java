package com.hp.cust.beans;

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
 * @since 2019-11-22
 */
@TableName("tb_cust")
public class Cust extends Model<Cust> {

    private static final long serialVersionUID = 1L;

    /**
     * 客户表id
     */
    @TableId(value = "cust_id", type = IdType.AUTO)
    private Integer custId;
    /**
     * 客户称呼
     */
    private String custName;
    /**
     * 客户密码
     */
    private String custPassword;
    /**
     * 客户的注册邮箱
     */
    private String custEmail;
    /**
     * 注册时间
     */
    @TableField(fill = FieldFill.INSERT)
    private Date createTime;
    /**
     * 是否删除（1是不删除，-1是删除）
     */
    @TableField(fill = FieldFill.INSERT)
    @TableLogic
    private Integer isDel;

    @TableField(exist=false)
    private String formPwd1;
    
    @TableField(exist=false)
    private String formPwd2;
    
    @TableField(exist=false)
    private String formCode;
    
    
    public String getFormPwd1() {
		return formPwd1;
	}

	public void setFormPwd1(String formPwd1) {
		this.formPwd1 = formPwd1;
	}

	public String getFormPwd2() {
		return formPwd2;
	}

	public void setFormPwd2(String formPwd2) {
		this.formPwd2 = formPwd2;
	}

	public String getFormCode() {
		return formCode;
	}

	public void setFormCode(String formCode) {
		this.formCode = formCode;
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

    public String getCustPassword() {
        return custPassword;
    }

    public void setCustPassword(String custPassword) {
        this.custPassword = custPassword;
    }

    public String getCustEmail() {
        return custEmail;
    }

    public void setCustEmail(String custEmail) {
        this.custEmail = custEmail;
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
        return this.custId;
    }

	@Override
	public String toString() {
		return "Cust [custId=" + custId + ", custName=" + custName + ", custPassword=" + custPassword + ", custEmail="
				+ custEmail + ", createTime=" + createTime + ", isDel=" + isDel + ", formPwd1=" + formPwd1
				+ ", formPwd2=" + formPwd2 + ", formCode=" + formCode + "]";
	}

    
}
