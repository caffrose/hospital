package com.yg.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yg.vo.DescriptionVo;
import com.yg.vo.DiseaseVo;

@Repository
public class DiseaseDaoImpl implements DiseaseDao {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<DescriptionVo> partList() {
		return sqlSession.selectList("com.yg.mapper.Mapper.partlist");
	}

	@Override
	public List<DescriptionVo> showsymptom(String part) {
		return sqlSession.selectList("com.yg.mapper.Mapper.selectDetail", part);
	}

	@Override
	public List<DiseaseVo> selectpart(String part) {
		return sqlSession.selectList("com.yg.mapper.Mapper.select", part);
	}

	@Override
	public DescriptionVo showDescription(String sygptom, String part) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("sygptom", sygptom);
		map.put("part", part);
		return sqlSession.selectOne("com.yg.mapper.Mapper.showdescription", map);
	}


}
