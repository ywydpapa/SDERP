package kr.swcore.sderp.account.dao;

import kr.swcore.sderp.account.dto.AccountDTO;

import java.util.List;

public interface AccountDAO {
    List<AccountDTO> listvat(int compNo);
    List<AccountDTO> listvatitem(int vatId);
    List<AccountDTO> modalVatB(int compNo);
    List<AccountDTO> modalVatS(int compNo);
    AccountDTO checkVat(AccountDTO dto);
    AccountDTO detailvat(int vatId);
    int insertVat(AccountDTO dto);
    int insertVatitem(AccountDTO dto);
}
