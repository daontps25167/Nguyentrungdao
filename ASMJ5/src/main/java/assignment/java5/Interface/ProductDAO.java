package assignment.java5.Interface;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import assignment.java5.entity.Report;
import assignment.java5.entity.product;




public interface ProductDAO extends JpaRepository<product,Integer> {
     
	 @Query("SELECT o FROM product o WHERE o.Loai =?1")
     Page<product> findByLoaiNam(boolean loai,Pageable pageable);
     @Query("SELECT o FROM product o WHERE o.Loai =?1")
     Page<product> findByLoaiNu(boolean loai,Pageable pageable);
     @Query("SELECT o FROM product o WHERE o.thuonghieu.id =?1 ")
     Page<product> findByThuongHieu(String th,Pageable pageable);

     @Query("SELECT new Report(o.thuonghieu.name, sum(o.gia), count(o)) "
    		 + " FROM product o "
    		 + " GROUP BY o.thuonghieu.name"
    		 + " ORDER BY sum(o.gia) DESC")
    		 List<Report> getInventoryByCategory();
}
