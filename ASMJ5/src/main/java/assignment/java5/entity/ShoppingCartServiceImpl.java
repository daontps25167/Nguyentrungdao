package assignment.java5.entity;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import assignment.java5.Interface.AccountDAO;
import assignment.java5.Interface.GioHangDAO;
import assignment.java5.Interface.ShoppingCartSerice;

@Service
@SessionScope
public class ShoppingCartServiceImpl implements ShoppingCartSerice {
	@Autowired
    GioHangDAO gioHangDAO;
	@Autowired
	AccountDAO userdao;
    @Override
    public gioHang add(Integer id,gioHang cart,String user) {
    	
    	gioHang	 carts = gioHangDAO.findByMaSP(id,user);
//		Account acc = userdao.getById(user);
    	
    	if(carts ==null) {
    		gioHangDAO.save(cart);
    	}else {
    		carts.setSl(carts.getSl()+1);
    		System.out.println(carts.getSl());
    		gioHangDAO.save(carts);
    	}
    	return cart;
    }
    @Override
    public void remove(Integer id) {
    	gioHangDAO.deleteById(id);
    	System.out.println("Đã xóa");
    }
    @Override
    public gioHang update(Integer id,int sl,double thanhTien) {
    	gioHang cart = gioHangDAO.getById(id);
    	cart.setSl(sl);
    	cart.setThanhtien(thanhTien);
    	gioHangDAO.save(cart);
    	System.out.println("da update thành: "+cart.getSl());
    	return cart;
    }
}
