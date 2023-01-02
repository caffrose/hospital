package com.yg.service;

import java.util.List;

import com.yg.vo.DescriptionVo;
import com.yg.vo.DiseaseVo;

public interface DiseaseService {
	public List<DescriptionVo> partList();
	public List<DiseaseVo> selectPart(String part);
	public List<DescriptionVo> showsymptom(String part);
	public DescriptionVo showDescription(String symptom, String part); 
}
