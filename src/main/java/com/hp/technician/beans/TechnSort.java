package com.hp.technician.beans;

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
 * @since 2019-11-24
 */
@TableName("tb_techn_sort")
public class TechnSort extends Model<TechnSort> {

    private static final long serialVersionUID = 1L;

    /**
     * 技师分类表id
     */
    @TableId(value = "techn_sort_id", type = IdType.AUTO)
    private Integer technSortId;
    /**
     * 分类名称
     */
    private String sortName;
    /**
     * 分类的权重
     */
    private Integer sortWeight;


    public Integer getTechnSortId() {
        return technSortId;
    }

    public void setTechnSortId(Integer technSortId) {
        this.technSortId = technSortId;
    }

    public String getSortName() {
        return sortName;
    }

    public void setSortName(String sortName) {
        this.sortName = sortName;
    }

    public Integer getSortWeight() {
        return sortWeight;
    }

    public void setSortWeight(Integer sortWeight) {
        this.sortWeight = sortWeight;
    }

    @Override
    protected Serializable pkVal() {
        return this.technSortId;
    }

    @Override
    public String toString() {
        return "TechnSort{" +
        ", technSortId=" + technSortId +
        ", sortName=" + sortName +
        ", sortWeight=" + sortWeight +
        "}";
    }
}
