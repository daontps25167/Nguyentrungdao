package assignment.java5.Interface;

import java.util.List;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import assignment.java5.entity.gioHang;


public interface GioHangDAO  extends JpaRepository<gioHang,Integer> {

	@Query("SELECT o FROM gioHang o WHERE o.product.idSP=?1 AND o.user.Username=?2")
    gioHang  findByMaSP(int id,String user);
	
	@Query("SELECT o FROM gioHang o WHERE o.user.Username =?1")
   List<gioHang> findByUser(String user);
   @Query("SELECT sum(o.thanhtien) FROM gioHang o WHERE o.user.Username =?1")
   Double SUMThanhTien(String user);
   @Query("SELECT count(o.idgiohang) FROM gioHang o WHERE o.user.Username =?1")
   int countGioHang(String user);
}
