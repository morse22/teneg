package kr.co.teneg.refund;

import java.util.List;

public interface RefundDAO {
	public void insert(RefundVO vo);
	public List<RefundVO> plist();
	public RefundVO selectByNo(int requestNo);
	public void refundOK(int requestNo);
	public void doRR(RefundVO vo);
}
