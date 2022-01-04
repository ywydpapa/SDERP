package kr.swcore.sderp.cont.dao;

import java.util.List;


import kr.swcore.sderp.cont.dto.ContDTO;
import kr.swcore.sderp.cont.dto.ContFileDataDTO;
import kr.swcore.sderp.sopp.dto.SoppDTO;

public interface ContDAO {

	List<ContDTO> listCont();
	List<ContDTO> listContbycust(int custNo);
	List<ContDTO> listCont(SoppDTO soppDto);
	List<ContDTO> listconCont(ContDTO contDto);
	ContDTO detailCont(int contNo);
	int updateCont(ContDTO dto);
	int deleteCont(int contNo);
	int insertCont(ContDTO dto);

	ContDTO listSalesTargetMonthIndividual(ContDTO contDTO);
	
	List<ContDTO> listFile(int contNo);
	int uploadFile(ContFileDataDTO dto);
	Integer deleteFile(ContFileDataDTO dto);
	ContFileDataDTO downloadFile(ContFileDataDTO dto);
}
