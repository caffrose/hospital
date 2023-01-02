package com.yg.dao;

import java.util.List;

import com.yg.vo.DescriptionVo;
import com.yg.vo.DiseaseVo;

public interface DiseaseDao {
	public List<DescriptionVo> partList();
	public List<DescriptionVo> showsymptom(String part);
	public List<DiseaseVo> selectpart(String part);
	public DescriptionVo showDescription(String symptom, String part);
}
