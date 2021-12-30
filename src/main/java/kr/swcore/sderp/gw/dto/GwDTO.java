package kr.swcore.sderp.gw.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.math.BigDecimal;

@Getter
@Setter
@ToString
public class GwDTO {
	private Integer estNo;
	private String estId;
	private Integer estVer;
	private String estType;
	private String estTitle;
	private String estDesc;
	private Integer custNo;
    private String custName;
	private Integer soppNo;
	private Integer compNo;
    private Integer userNo;
    private BigDecimal estAmt;
    private BigDecimal estAmount;
    private BigDecimal estVat;
    private float estDiscount;
    private BigDecimal estTotal;
    private String estDate;
    private Integer estItemNo;
    private Integer productNo;
    private String productName;
    private String productSpec;
    private Integer productQty;
    private Integer productNetprice;
    private Integer productVat;
    private Integer productAmount;
    private float productDis;
    private Integer productTotal;
    private String productRemark;
    private String regDate;
    private String modDate;
    private String attrib;

    public GwDTO() {
        super();
    }
}