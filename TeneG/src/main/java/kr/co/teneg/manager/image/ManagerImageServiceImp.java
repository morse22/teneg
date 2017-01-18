package kr.co.teneg.manager.image;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ManagerImageServiceImp implements ManagerImageService{
	@Autowired
	private ManagerImageDAO dao;

	@Override
	public void update(ManagerImageVO managerImageVO) {
		dao.update(managerImageVO);
	}
}
