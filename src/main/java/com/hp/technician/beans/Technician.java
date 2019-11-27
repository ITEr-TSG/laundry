package com.hp.technician.beans;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableLogic;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.FieldFill;
import com.baomidou.mybatisplus.enums.IdType;

/**
 * <p>
 * 
 * </p>
 *
 * @author ITEr
 * @since 2019-11-24
 */
@TableName("tb_technician")
public class Technician extends Model<Technician> {

    private static final long serialVersionUID = 1L;

    /**
     * 技师id
     */
    @TableId(value = "technician_id", type = IdType.AUTO)
    private Integer technicianId;
    /**
     * 技师昵称
     */
    private String technNick;
    /**
     * 技师真实姓名
     */
    private String technRealName;
    /**
     * 技师电话
     */
    private String technPhone;
    /**
     * 密码
     */
    private String technPassword;
    /**
     * 邮箱
     */
    private String technEmail;
    /**
     * 照片路径
     */
    private String technPhoto;
    /**
     * 备注
     */
    private String technRemarks;
    /**
     * 技师积分
     * */
    private Integer technIntegral;
    /**
     * 状态（100审核通过，200未审核，300驳回）
     */
    @TableField(fill = FieldFill.INSERT)
    private String technState;
    /**
     * 创建时间
     */
    
    @TableField(fill = FieldFill.INSERT)
    private Date createTime;
    /**
     * 修改时间
     */
    @TableField(fill = FieldFill.UPDATE)
    private String changeTime;
    /**
     * 是否删除（-1删除，1未删除）
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

    public Integer getTechnicianId() {
        return technicianId;
    }

    public void setTechnicianId(Integer technicianId) {
        this.technicianId = technicianId;
    }

    public String getTechnNick() {
        return technNick;
    }

    public void setTechnNick(String technNick) {
        this.technNick = technNick;
    }

    public String getTechnRealName() {
        return technRealName;
    }

    public void setTechnRealName(String technRealName) {
        this.technRealName = technRealName;
    }

    public String getTechnPhone() {
        return technPhone;
    }

    public void setTechnPhone(String technPhone) {
        this.technPhone = technPhone;
    }

    public String getTechnPassword() {
        return technPassword;
    }

    public void setTechnPassword(String technPassword) {
        this.technPassword = technPassword;
    }

    public String getTechnEmail() {
        return technEmail;
    }

    public void setTechnEmail(String technEmail) {
        this.technEmail = technEmail;
    }

    public String getTechnPhoto() {
        return technPhoto;
    }

    public void setTechnPhoto(String technPhoto) {
        this.technPhoto = technPhoto;
    }

    public String getTechnRemarks() {
        return technRemarks;
    }

    public void setTechnRemarks(String technRemarks) {
        this.technRemarks = technRemarks;
    }

    public String getTechnState() {
        return technState;
    }

    public void setTechnState(String technState) {
        this.technState = technState;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getChangeTime() {
        return changeTime;
    }

    public void setChangeTime(String changeTime) {
        this.changeTime = changeTime;
    }

    public Integer getIsDel() {
        return isDel;
    }

    public void setIsDel(Integer isDel) {
        this.isDel = isDel;
    }

    @Override
    protected Serializable pkVal() {
        return this.technicianId;
    }

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

	public Integer getTechnIntegral() {
		return technIntegral;
	}

	public void setTechnIntegral(Integer technIntegral) {
		this.technIntegral = technIntegral;
	}

	@Override
	public String toString() {
		return "Technician [technicianId=" + technicianId + ", technNick=" + technNick + ", technRealName="
				+ technRealName + ", technPhone=" + technPhone + ", technPassword=" + technPassword + ", technEmail="
				+ technEmail + ", technPhoto=" + technPhoto + ", technRemarks=" + technRemarks + ", technIntegral="
				+ technIntegral + ", technState=" + technState + ", createTime=" + createTime + ", changeTime="
				+ changeTime + ", isDel=" + isDel + ", formPwd1=" + formPwd1 + ", formPwd2=" + formPwd2 + ", formCode="
				+ formCode + "]";
	}
}
