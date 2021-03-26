package kr.swcore.sderp.cont.dao;

import java.util.List;

import kr.swcore.sderp.cont.dto.ContDTO;
import kr.swcore.sderp.sopp.dto.SoppDTO;

public interface ContDAO {

	List<ContDTO> listCont();	
	List<ContDTO> listCont(SoppDTO soppDto);
	ContDTO detailCont(int contNo);
	int updateCont(ContDTO dto);
	int deleteCont(int contNo);
	int insertCont(ContDTO dto);

}
