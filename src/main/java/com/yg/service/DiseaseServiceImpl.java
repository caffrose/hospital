package com.yg.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yg.dao.DiseaseDao;
import com.yg.vo.DescriptionVo;
import com.yg.vo.DiseaseVo;

@Service
public class DiseaseServiceImpl implements DiseaseService {
	@Autowired
	DiseaseDao dao;
	
	@Override
	public List<DescriptionVo> partList() {
		return dao.partList();
	}

	@Override
	public List<DiseaseVo> selectPart(String part) {
		return dao.selectpart(part);
	}

	@Override
	public List<DescriptionVo> showsymptom(String part) {
		return dao.showsymptom(part);
	}

	@Override
	public DescriptionVo showDescription(String symptom, String part) {
		return dao.showDescription(symptom, part);
	}

}
