package assignment.java5.Interface;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import assignment.java5.entity.donhang;

public interface DonHangDAO extends JpaRepository<donhang,Integer> {
	@Query("SELECT  o FROM donhang o WHERE o.Trangthai=?1 AND o.user.Username=?2")
	   List<donhang> findTrangThai(String tragthai,String username);
	   
	   @Query("SELECT  o FROM donhang o WHERE o.user.Username=?1")
	   List<donhang> findDonAll(String username);
	   
	   @Query("SELECT DISTINCT YEAR(o.ngaymua) FROM donhang o")
	   List<String> findNam();
	   @Query("SELECT o FROM donhang o WHERE YEAR(o.ngaymua) =?1")
	   List<donhang> findDate(int year);
}
