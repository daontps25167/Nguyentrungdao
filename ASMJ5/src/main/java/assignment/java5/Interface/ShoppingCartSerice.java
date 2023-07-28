package assignment.java5.Interface;

import java.util.Collection;

import assignment.java5.entity.gioHang;

public interface ShoppingCartSerice {
    gioHang add(Integer item,gioHang cart,String user);
    void remove(Integer id);
    gioHang update(Integer id,int sl,double thanhTien);
    
    
}
