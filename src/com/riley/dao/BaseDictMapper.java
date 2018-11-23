package com.riley.dao;

import java.util.List;

import com.riley.entity.BaseDict;

public interface BaseDictMapper {
	
	//客户来源
	public List<BaseDict> findBaseDictTypeByTypeCode(String typecode);
	
    int deleteByPrimaryKey(String dictId);

    int insert(BaseDict record);

    int insertSelective(BaseDict record);

    BaseDict selectByPrimaryKey(String dictId);

    int updateByPrimaryKeySelective(BaseDict record);

    int updateByPrimaryKey(BaseDict record);
}