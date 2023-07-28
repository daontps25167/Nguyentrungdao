package assignment.java5.Interface;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import assignment.java5.entity.ctdonhang;
import assignment.java5.entity.gioHang;

public interface CTDonHangDAO extends JpaRepository<ctdonhang, Integer> {
   @Query("SELECT o FROM ctdonhang o WHERE o.donhang.Iddonhang=?1")
   List<ctdonhang> ct(int id);
   @Query("SELECT sum(o.thanhtien) FROM ctdonhang o WHERE o.donhang.Iddonhang=?1")
   Double SUMThanhTien(int id);
   @Query("SELECT o FROM ctdonhang o WHERE o.donhang.Iddonhang=?1")
   List<ctdonhang> findByIdDonHang(int id);
   
}
