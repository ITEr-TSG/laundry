package com.hp.blogs.beans;

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
@TableName("tb_blogs")
public class Blogs extends Model<Blogs> {

    private static final long serialVersionUID = 1L;

    /**
     * 博客的id
     */
    @TableId(value = "blog_id", type = IdType.AUTO)
    private Integer blogId;
    /**
     * 所属的技师
     */
    private Integer technId;
    /**
     * 博客的内容
     */
    private String blogText;
    /**
     * 点赞量
     */
    private Integer praiseInt;
    /**
     * 写作的时间
     */
    @TableField(fill = FieldFill.INSERT)
    private Date createTime;
    /**
     * 是否展示（技师控制）
     */
    private String isShow;
    /**
     * 是否删除
     */
    @TableField(fill = FieldFill.INSERT)
    @TableLogic
    private Integer isDel;


    public Integer getBlogId() {
        return blogId;
    }

    public void setBlogId(Integer blogId) {
        this.blogId = blogId;
    }

    public Integer getTechnId() {
        return technId;
    }

    public void setTechnId(Integer technId) {
        this.technId = technId;
    }

    public String getBlogText() {
        return blogText;
    }

    public void setBlogText(String blogText) {
        this.blogText = blogText;
    }

    public Integer getPraiseInt() {
        return praiseInt;
    }

    public void setPraiseInt(Integer praiseInt) {
        this.praiseInt = praiseInt;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getIsShow() {
        return isShow;
    }

    public void setIsShow(String isShow) {
        this.isShow = isShow;
    }

    public Integer getIsDel() {
        return isDel;
    }

    public void setIsDel(Integer isDel) {
        this.isDel = isDel;
    }

    @Override
    protected Serializable pkVal() {
        return this.blogId;
    }

	@Override
	public String toString() {
		return "Blogs [blogId=" + blogId + ", technId=" + technId + ", blogText=" + blogText + ", praiseInt="
				+ praiseInt + ", createTime=" + createTime + ", isShow=" + isShow + ", isDel=" + isDel + "]";
	}
    
}
