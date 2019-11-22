package com.hp.code.beans;

import com.baomidou.mybatisplus.enums.FieldFill;
import com.baomidou.mybatisplus.enums.IdType;
import java.util.Date;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
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
@TableName("tb_regiter_code")
public class RegiterCode extends Model<RegiterCode> {

    private static final long serialVersionUID = 1L;

    /**
     * 邮箱激活码id
     */
    @TableId(value = "email_code_id", type = IdType.AUTO)
    private Integer emailCodeId;
    /**
     * 客户邮箱
     */
    private String regiterEmail;
    /**
     * 激活码
     */
    private String code;
    /**
     * 获取时间
     */
    @TableField(fill = FieldFill.INSERT)
    private Date createTime;


    public Integer getEmailCodeId() {
        return emailCodeId;
    }

    public void setEmailCodeId(Integer emailCodeId) {
        this.emailCodeId = emailCodeId;
    }

    public String getRegiterEmail() {
        return regiterEmail;
    }

    public void setRegiterEmail(String regiterEmail) {
        this.regiterEmail = regiterEmail;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Override
    protected Serializable pkVal() {
        return this.emailCodeId;
    }

    @Override
    public String toString() {
        return "RegiterCode{" +
        ", emailCodeId=" + emailCodeId +
        ", regiterEmail=" + regiterEmail +
        ", code=" + code +
        ", createTime=" + createTime +
        "}";
    }
}
