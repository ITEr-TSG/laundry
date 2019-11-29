package com.hp.blogs.beans;

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
 * @since 2019-11-29
 */
@TableName("tb_blogs_collect")
public class BlogsCollect extends Model<BlogsCollect> {

    private static final long serialVersionUID = 1L;

    /**
     * 收藏id
     */
    @TableId(value = "collect__id", type = IdType.AUTO)
    private Integer collectId;
    /**
     * 文章id
     */
    private Integer blogId;
    /**
     * 文章所属人名字
     */
    private String technName;
    /**
     * 收藏者的id
     */
    private Integer custId;
    /**
     * 收藏人名字
     */
    private String custName;
    /**
     * 收藏时间
     */
    @TableField(fill = FieldFill.INSERT)
    private Date createTime;
    /**
     * 收藏or取消收藏
     */
    private String collectState;


    public Integer getCollectId() {
        return collectId;
    }

    public void setCollectId(Integer collectId) {
        this.collectId = collectId;
    }

    public Integer getBlogId() {
        return blogId;
    }

    public void setBlogId(Integer blogId) {
        this.blogId = blogId;
    }

    public String getTechnName() {
        return technName;
    }

    public void setTechnName(String technName) {
        this.technName = technName;
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

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getCollectState() {
        return collectState;
    }

    public void setCollectState(String collectState) {
        this.collectState = collectState;
    }

    @Override
    protected Serializable pkVal() {
        return this.collectId;
    }

    @Override
    public String toString() {
        return "BlogsCollect{" +
        ", collectId=" + collectId +
        ", blogId=" + blogId +
        ", technName=" + technName +
        ", custId=" + custId +
        ", custName=" + custName +
        ", createTime=" + createTime +
        ", collectState=" + collectState +
        "}";
    }
}
