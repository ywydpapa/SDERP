package kr.swcore.sderp.techd.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.swcore.sderp.sopp.dto.SoppDTO;
import kr.swcore.sderp.techd.dto.TechdDTO;

@Repository
public class TechdDAOImpl implements TechdDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<TechdDTO> listTechd() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("techd.listTechd");
	}
	
	@Override
	public List<TechdDTO> listTechd(SoppDTO soppDTO) {
		return sqlSession.selectList("techd.listTechd", soppDTO);
	}

	@Override
	public TechdDTO detailTechd(int techdNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("techd.detailTechd", techdNo);
	}

	@Override
	public int updateTechd(TechdDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("techd.updsteTechd",dto);
	}

	@Override
	public int deleteTechd(int techdNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("techd.deleteTechd", techdNo);
	}

	@Override
	public int insertTechd(TechdDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("techd.insertTechd", dto);
	}

	

}
