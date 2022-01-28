package kr.swcore.sderp.sopp.dao;

import java.util.List;

import kr.swcore.sderp.sopp.dto.SoppdataDTO;

public interface SoppdataDAO {

	List<SoppdataDTO> listSoppdata01(int soppNo);
	List<SoppdataDTO> listSoppdata02(int soppNo);
	List<SoppdataDTO> listIOsum(SoppdataDTO dto);
	List<SoppdataDTO> listSearchIO(SoppdataDTO dto);
	List<SoppdataDTO> listIO(SoppdataDTO dto);
	int deleteSoppdata01(int soppdataNo);
	int insertSoppdata01(SoppdataDTO dto);
	
	List<SoppdataDTO> listSoppdata011(int soppNo);
	List<SoppdataDTO> listSoppdata011_1(int soppNo);
	List<SoppdataDTO> listSoppdata011_2(int soppNo);

}
