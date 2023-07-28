package assignment.java5.controller;

import java.util.Date;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.query.criteria.internal.expression.function.AggregationFunction.SUM;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import assignment.java5.Interface.AccountDAO;
import assignment.java5.Interface.CTDonHangDAO;
import assignment.java5.Interface.DonHangDAO;
import assignment.java5.Interface.GioHangDAO;
import assignment.java5.Interface.ProductDAO;
import assignment.java5.Interface.ShoppingCartSerice;
import assignment.java5.Interface.thuongHieuDAO;
import assignment.java5.entity.Account;
import assignment.java5.entity.ctdonhang;
import assignment.java5.entity.donhang;
import assignment.java5.entity.gioHang;
import assignment.java5.entity.product;
import assignment.java5.entity.thuonghieu;
import assignment.java5.service.SessionService;

@Controller
public class donHangController {
	@Autowired
	    ProductDAO ProductDAO;
	    @Autowired
	    GioHangDAO gioHangDAO;
	    @Autowired
	    CTDonHangDAO CTDonHangDAO;
	    @Autowired
	    AccountDAO tkDAO;
	    @Autowired
	    DonHangDAO donhangDAO;
	    @Autowired
	    SessionService session;
	    @Autowired
	    ShoppingCartSerice carts;
	    @Autowired
	    HttpServletRequest req;
	    @Autowired
	    thuongHieuDAO thuonghieuDAO;
	    @Autowired
	    HttpServletResponse resp;
	    
	    @GetMapping("/datHang")
		public String datHang(Model m) {
	    	 Account acc=session.getAttribute("user");
	    	 m.addAttribute("fullname",acc.getFullname());
	    	 m.addAttribute("sdt",acc.getSdt());
	    	 m.addAttribute("diachi",acc.getDiachi());
	    	 List<gioHang> a = gioHangDAO.findByUser(acc.getUsername());
//			   for(gioHang c:a) {
//				   
//				   c.setThanhtien(c.getSl()* c.getProduct().getGia());
//				  
//				   
//			   }
			   
			   Double TongTien = gioHangDAO.SUMThanhTien(acc.getUsername());
			  
			   
			   if(acc != null) {
				   int countSLTrongGio = gioHangDAO.countGioHang(acc.getUsername());
				   m.addAttribute("countGio",countSLTrongGio);
			   }
			   m.addAttribute("user",acc);
			   m.addAttribute("tongtien",TongTien);
			   m.addAttribute("datHang",a);
			   List<thuonghieu> th = thuonghieuDAO.findAll();
			     
				  m.addAttribute("th",th);
	    	return "ngdung/layoutNgdung/datHang";
		    }  
	    @PostMapping("/datHang")
		public String datHang2(Model m) {
	    	String fullname = req.getParameter("FullName");
	    	String sdt = req.getParameter("sdt");
	    	String diachi = req.getParameter("diachi");
	    	 Account acc=session.getAttribute("user");	
	    	
	    	 if(fullname != null && diachi != null && sdt != null) {
	    		 List<gioHang> a = gioHangDAO.findByUser(acc.getUsername());
		    	 donhang donhang = new donhang();
				   donhang.setNgaymua(new Date());
				   donhang.setTrangthai("Chưa đặt");
				   donhang.setUser(acc);
				   donhang.setTongtien(0);
				   donhang.setFullname(fullname);
				   donhang.setSdt(sdt);
				   donhang.setDiachi(diachi);
				   donhangDAO.save(donhang);
				   int idDonHang = donhang.getIddonhang();
		    	 for(gioHang c:a) {
					   
//					   c.setThanhtien(c.getSl()* c.getProduct().getGia());
//					   System.out.println(c.getProduct().getIdSP());
					   ctdonhang ct = new ctdonhang();
					  
					   donhang d = donhangDAO.getById(idDonHang);
					   ct.setIdsp(c.getProduct());
					   ct.setDonhang(d);
					   ct.setGia(c.getProduct().getGia());
					   ct.setSl(c.getSl());
					   ct.setThanhtien(c.getSl()*c.getProduct().getGia());
					   product p = ProductDAO.getById(c.getProduct().getIdSP());
					   if(c.getSl()> p.getSl() ) {
						   System.out.println("Kho ĐÃ hết hàng");
					   }else {
						   CTDonHangDAO.save(ct);
						   p.setSl(p.getSl()-c.getSl());
						   ProductDAO.save(p);
						   donhang dh = donhangDAO.getById(idDonHang);
						   dh.setTrangthai("Đã đặt");
						  
						  
						   Double sum = CTDonHangDAO.SUMThanhTien(idDonHang);
						   
						   dh.setTongtien(sum);
						   donhangDAO.save(dh);

					   }
						  List<gioHang> g = gioHangDAO.findByUser(acc.getUsername());
						  gioHangDAO.deleteAll(g);
						   
					   }
					  
					   
				   
				   
				   Double TongTien = gioHangDAO.SUMThanhTien(acc.getUsername());
				  
				   
				   if(acc != null) {
					   int countSLTrongGio = gioHangDAO.countGioHang(acc.getUsername());
					   m.addAttribute("countGio",countSLTrongGio);
				   }
				   
				   
				   m.addAttribute("user",acc);
				   m.addAttribute("tongtien",TongTien);
				   m.addAttribute("datHang",a);
				   List<thuonghieu> th = thuonghieuDAO.findAll();
				     
					  m.addAttribute("th",th);
	    	 }
	    	  
	    	return "ngdung/layoutNgdung/tbDatHang";
	    	 
	    	 }  
	    
	    @GetMapping("/QLdonHang")
		public String QLdonHang(Model m) {
	    	boolean checkTrangThai =true;
	    	Account acc=session.getAttribute("user");
		   	List<donhang> all = donhangDAO.findDonAll(acc.getUsername());
		   	for(donhang a:all) {
		   		System.out.println("dh:"+a.getUser().getFullname());
		   	}
		   	List<donhang> daNhan = donhangDAO.findTrangThai("Đã giao",acc.getUsername());
		   	List<donhang> dangGiao = donhangDAO.findTrangThai("Đang giao",acc.getUsername());
		   	List<donhang> daHuy = donhangDAO.findTrangThai("Đã hủy",acc.getUsername());
		   	for(donhang dh:daNhan) {
		   		System.out.println(dh.getTongtien());
		   		if(dh.getTrangthai().equalsIgnoreCase("Đã hủy")) {
		   			checkTrangThai = false;
		   		}else {
		   			checkTrangThai =true;
		   		}
		   	}
		   	m.addAttribute("checkTrangThai",checkTrangThai);
		   	m.addAttribute("donhangALL", all);
		   	m.addAttribute("donhangDaNhan", daNhan);
		   	m.addAttribute("donhangDangGiao", dangGiao);
		   	m.addAttribute("donhangDaHuy", daHuy);
		   	List<thuonghieu> th = thuonghieuDAO.findAll();
		     
			  m.addAttribute("th",th);
		   	return "ngdung/layoutNgdung/QLdonHang";
	    }
	    
	    @PostMapping("/QLdonHang")
		public String QLdonHang(Model m,@RequestParam("active") int active,@RequestParam("id") int id) {
	    	Account acc=session.getAttribute("user");
	    	boolean checkTrangThai =true;
		   	List<donhang> all = donhangDAO.findDonAll(acc.getUsername());
		   	List<donhang> daNhan = donhangDAO.findTrangThai("Đã giao",acc.getUsername());
		   	List<donhang> dangGiao = donhangDAO.findTrangThai("Đang giao",acc.getUsername());
		   	List<donhang> daHuy = donhangDAO.findTrangThai("Đã hủy",acc.getUsername());
		   	for(donhang dh:daNhan) {
		   		System.out.println(dh.getTongtien());
		   		if(dh.getTrangthai().equalsIgnoreCase("Đã hủy")) {
		   			checkTrangThai = false;
		   		}else {
		   			checkTrangThai =true;
		   		}
		   	}
		   		donhang dh = donhangDAO.getById(id);
		   		if(active ==1) {
		   			dh.setTrangthai("Đã hủy");
		   			donhangDAO.save(dh);
		   		}
		   	m.addAttribute("checkTrangThai",checkTrangThai);
		   	m.addAttribute("donhangALL", all);
		   	m.addAttribute("donhangDaNhan", daNhan);
		   	m.addAttribute("donhangDangGiao", dangGiao);
		   	m.addAttribute("donhangDaHuy", daHuy);
		   	List<thuonghieu> th = thuonghieuDAO.findAll();
		     
			  m.addAttribute("th",th);
		   	return "redirect:/QLdonHang";
		    }
	    @RequestMapping("/CTdonHang")
		public String CTdonHang(Model m,@RequestParam("id") int id) {
	    	Account acc=session.getAttribute("user");
	    	donhang dh = donhangDAO.getById(id);
	    	 List<ctdonhang> ctdonhang = CTDonHangDAO.findByIdDonHang(id);
			  
			   m.addAttribute("ctDonhang",ctdonhang);
			   List<thuonghieu> th = thuonghieuDAO.findAll();
			     
				  m.addAttribute("th",th);
				  m.addAttribute("tongtien",dh.getTongtien());
				  m.addAttribute("user",acc);
	    	return "ngdung/layoutNgdung/CTdonHang";
		    } 
}