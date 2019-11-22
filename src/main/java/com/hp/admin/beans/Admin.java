package com.hp.admin.beans;

import com.baomidou.mybatisplus.enums.IdType;
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
@TableName("tb_admin")
public class Admin extends Model<Admin> {

    private static final long serialVersionUID = 1L;

    /**
     * 后台登录主键
     */
    @TableId(value = "admin_id", type = IdType.AUTO)
    private Integer adminId;
    /**
     * 管理员登录名
     */
    private String adminName;
    /**
     * 管理员密码
     */
    private String adminPassword;
    /**
     * 头像图片路径
     */
    private String adminHead;


    public Integer getAdminId() {
        return adminId;
    }

    public void setAdminId(Integer adminId) {
        this.adminId = adminId;
    }

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }

    public String getAdminPassword() {
        return adminPassword;
    }

    public void setAdminPassword(String adminPassword) {
        this.adminPassword = adminPassword;
    }

    public String getAdminHead() {
        return adminHead;
    }

    public void setAdminHead(String adminHead) {
        this.adminHead = adminHead;
    }

    @Override
    protected Serializable pkVal() {
        return this.adminId;
    }

    @Override
    public String toString() {
        return "Admin{" +
        ", adminId=" + adminId +
        ", adminName=" + adminName +
        ", adminPassword=" + adminPassword +
        ", adminHead=" + adminHead +
        "}";
    }
}
