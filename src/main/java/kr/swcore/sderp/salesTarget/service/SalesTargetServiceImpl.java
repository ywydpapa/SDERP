package kr.swcore.sderp.salesTarget.service;

import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import kr.swcore.sderp.organiz.Service.OrganizService;
import kr.swcore.sderp.organiz.dto.OrganizDTO;
import kr.swcore.sderp.salesTarget.dao.SalesTargetDAO;
import kr.swcore.sderp.salesTarget.dto.SalesTargetDTO;
import kr.swcore.sderp.user.dto.UserDTO;
import kr.swcore.sderp.user.service.UserService;

@Service
public class SalesTargetServiceImpl implements SalesTargetService {
	
	@Inject
	SalesTargetDAO salesTargetDAO;
	
	@Inject
	OrganizService organizService;
	
	@Inject
	UserService userService;

	@Override
	public List<SalesTargetDTO> listSalesTarget() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<SalesTargetDTO> listSales(HttpSession session, SalesTargetDTO salesTargetDTO) {
		if(salesTargetDTO == null) salesTargetDTO = new SalesTargetDTO();
		
		Integer compNo = Integer.valueOf((String) session.getAttribute("compNo"));
		String targetYear = salesTargetDTO.getTragetYear();
		String targetType = salesTargetDTO.getTargetType();
		
		if(targetYear == null || targetYear.equals("")) {
			Calendar cal = Calendar.getInstance();
			int year = cal.get(Calendar.YEAR);
			targetYear = String.valueOf(year);
		}
		
		if(targetType == null || targetType.equals("")) {
			targetType = "PROFIT";
		} else {
			targetType = targetType.toUpperCase();
		}
		
		// ������ ���� �μ� ����Ʈ �˻�
		List<OrganizDTO> deptList = organizService.listDeptChainExtend(session); // select org_title 1���� �ڿ����� ���α�
		List<UserDTO> userList = null;
		List<SalesTargetDTO> SalesTargetList = null;
		
		for(OrganizDTO organizDTO : deptList) {		
			UserDTO userDTO = new UserDTO();
			int orgId = organizDTO.getOrg_id();
			userDTO.setOrgId(orgId);
			// �μ� �ڵ忡 �´� swc_user ���̺��� �����Ͽ� ��������Ʈ�� ��ȯ�Ѵ�.
			userList = userService.userListWithOrgId(userDTO);
			if (userList.size() > 0) {
				// ���� ����Ʈ �������� salesTarget ���̺��� �����մϴ�.
				List<SalesTargetDTO> temp = salesTargetDAO.listSalesTarget(compNo, targetYear, targetType, userList);
				if (temp.size() > 0 && temp != null) {
					SalesTargetList.addAll(temp);
				}
			}
		}
		
		return SalesTargetList;
	}

	@Override
	public SalesTargetDTO detailSalesTarget(SalesTargetDTO salesTargetDTO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateSalesTarget(HttpSession session, SalesTargetDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteSalesTarget(HttpSession session, SalesTargetDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSalesTarget(HttpSession session, SalesTargetDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}
}
