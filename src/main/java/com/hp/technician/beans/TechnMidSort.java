package com.hp.technician.beans;

import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;
import java.util.List;

/**
 * <p>
 * 
 * </p>
 *
 * @author ITEr
 * @since 2019-11-24
 */
@TableName("tb_techn_mid_sort")
public class TechnMidSort extends Model<TechnMidSort> {

    private static final long serialVersionUID = 1L;

    /**
     * 技师分类和技师中间表id
     */
    @TableId(value = "mid_id", type = IdType.AUTO)
    private Integer midId;
    /**
     * 技师表id
     */
    private Integer technId;
    /**
     * 分类表id
     */
    private Integer sortId;

    @TableField(exist=false)
    private List<Integer> sortIds;

    
    public List<Integer> getSortIds() {
		return sortIds;
	}

	public void setSortIds(List<Integer> sortIds) {
		this.sortIds = sortIds;
	}

	public Integer getMidId() {
        return midId;
    }

    public void setMidId(Integer midId) {
        this.midId = midId;
    }

    public Integer getTechnId() {
        return technId;
    }

    public void setTechnId(Integer technId) {
        this.technId = technId;
    }

    public Integer getSortId() {
        return sortId;
    }

    public void setSortId(Integer sortId) {
        this.sortId = sortId;
    }

    @Override
    protected Serializable pkVal() {
        return this.midId;
    }

	@Override
	public String toString() {
		return "TechnMidSort [midId=" + midId + ", technId=" + technId + ", sortId=" + sortId + ", sortIds=" + sortIds
				+ "]";
	}

  
}
