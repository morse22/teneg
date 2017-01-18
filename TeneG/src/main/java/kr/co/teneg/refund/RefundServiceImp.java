package kr.co.teneg.refund;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.teneg.request.RequestDAO;

@Service
public class RefundServiceImp implements RefundService{

	@Autowired
	private RefundDAO dao;
	
	@Autowired
	private RequestDAO requestDao;
	
	@Override
	public void insert(RefundVO vo) {
		dao.insert(vo);
		requestDao.doRP(vo.getRequestNo());
	}

	@Override
	public List<RefundVO> plist() {
		return dao.plist();
	}

	@Override
	public RefundVO selectByNo(int requestNo) {
		return dao.selectByNo(requestNo);
	}

	@Override
	public void refundOK(int requestNo) {
		dao.refundOK(requestNo);
	}

	@Override
	public void doRR(RefundVO vo) {
		dao.doRR(vo);
		requestDao.doRR(vo.getRequestNo());
	}
}
