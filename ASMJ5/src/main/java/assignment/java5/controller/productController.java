package assignment.java5.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import assignment.java5.Interface.GioHangDAO;
import assignment.java5.Interface.ProductDAO;
import assignment.java5.Interface.ShoppingCartSerice;
import assignment.java5.Interface.thuongHieuDAO;
import assignment.java5.entity.Account;
import assignment.java5.entity.gioHang;
import assignment.java5.entity.product;
import assignment.java5.entity.thuonghieu;
import assignment.java5.service.SessionService;


@Controller
public class productController {
    @Autowired
    ProductDAO ProductDAO;
    @Autowired
    thuongHieuDAO thuonghieuDAO;
    @Autowired
    GioHangDAO gioHangDAO;
    @Autowired
    SessionService session;
    @Autowired
    ShoppingCartSerice carts;
    @Autowired
    HttpServletRequest req;
    @Autowired
    HttpServletResponse resp;
    @GetMapping("/index")
    public String index(Model m) {
		//SP noi bac
    	
				Pageable pageableNB = PageRequest.of(0, 8);
				Page<product> spNB = ProductDAO.findAll(pageableNB);
				m.addAttribute("spNoiBac",spNB);
				for(product a:spNB) {
			   		 m.addAttribute("giaNB",(int)a.getGia());
			   		 
			   	 }
				//SP Nam
				Pageable pageableNam = PageRequest.of(0, 8);
			   	 Page<product> spNam = ProductDAO.findByLoaiNam(true,pageableNam);
			   	 for(product a:spNam) {
			   		 m.addAttribute("giaNam",(int)a.getGia());
			   		 
			   	 }
			   	 m.addAttribute("spNam",spNam);
				//sp Nu
			   	Pageable pageableNu = PageRequest.of(0, 8);
			   	 Page<product> spNu = ProductDAO.findByLoaiNu(false,pageableNu);
			   	 for(product a:spNu) {
			   		 m.addAttribute("giaNu",(int)a.getGia());
			   		 
			   	 }
			   
			   
			   	 m.addAttribute("spNu",spNu);
		   Account acc = session.getAttribute("user");
		   if(acc != null) {
			   int countSLTrongGio = gioHangDAO.countGioHang(acc.getUsername());
			   m.addAttribute("countGio",countSLTrongGio);
		   }
		  List<thuonghieu> th = thuonghieuDAO.findAll();
		  m.addAttribute("th",th);
		return "ngdung/layoutNgdung/index";
    }
	
	@PostMapping("/index")
    public String index(Model m,@RequestParam("id") int id) {
		//SP noi bac
		
		Pageable pageableNB = PageRequest.of(0, 8);
				Page<product> spNB = ProductDAO.findAll(pageableNB);
				m.addAttribute("spNoiBac",spNB);
				for(product a:spNB) {
			   		 m.addAttribute("giaNB",(int)a.getGia());
			   		 
			   	 }
				//SP Nam
				Pageable pageableNam = PageRequest.of(0, 8);
			   	 Page<product> spNam = ProductDAO.findByLoaiNam(true,pageableNam);
			   	 for(product a:spNam) {
			   		 m.addAttribute("giaNam",(int)a.getGia());
			   		 
			   	 }
			   	 m.addAttribute("spNam",spNam);
				//sp Nu
			   	Pageable pageableNu = PageRequest.of(0, 8);
			   	 Page<product> spNu = ProductDAO.findByLoaiNu(false,pageableNu);
			   	 for(product a:spNu) {
			   		 m.addAttribute("giaNu",(int)a.getGia());
			   		 
			   	 }
			   	this.sp1(m, id);
			   	 Account acc = session.getAttribute("user");
				   if(acc != null) {
					   int countSLTrongGio = gioHangDAO.countGioHang(acc.getUsername());
					   m.addAttribute("countGio",countSLTrongGio);
				   }
				   List<thuonghieu> th = thuonghieuDAO.findAll();
					  m.addAttribute("th",th);
			   	 m.addAttribute("spNu",spNu);
		   
		return "ngdung/layoutNgdung/index";
    }
	@RequestMapping("/ThemVaoGioindex")
    public String indexgio(Model m,@RequestParam("id") int id) {
		this.index(m, id);
		 Account acc = session.getAttribute("user");
		   if(acc != null) {
			   int countSLTrongGio = gioHangDAO.countGioHang(acc.getUsername());
			   m.addAttribute("countGio",countSLTrongGio);
		   }
		   List<thuonghieu> th = thuonghieuDAO.findAll();
			  m.addAttribute("th",th);
		return "ngdung/layoutNgdung/index";
    }
	@GetMapping("/Nam")
	public String Nam(Model m,@RequestParam("p") Optional<Integer> p,
			@RequestParam("loai") Boolean loai) {
		int paging = p.orElse(0);
		if(paging < 0)
			paging = 0;
		else if(paging >7)
			paging = 7;
		Pageable pageable = PageRequest.of(paging, 8);
	   	 Page<product> sp = ProductDAO.findByLoaiNam(loai,pageable);
	   	 for(product a:sp) {
	   		 m.addAttribute("gia",(int)a.getGia());
	   		 
	   	 }
	   
	   	Account acc = session.getAttribute("user");
		   if(acc != null) {
			   int countSLTrongGio = gioHangDAO.countGioHang(acc.getUsername());
			   m.addAttribute("countGio",countSLTrongGio);
		   }
		   List<thuonghieu> th = thuonghieuDAO.findAll();
			  m.addAttribute("th",th);
	   	 m.addAttribute("sp",sp);
		return "ngdung/layoutNgdung/Nam";
	    }
	
	@PostMapping("/Nam")
	public String Nam(Model m,@RequestParam("id") int id,@RequestParam("p") Optional<Integer> p,
			@RequestParam("loai")Boolean loai) {
		
		
		Pageable pageable = PageRequest.of(0, 8);
	   	 Page<product> sp = ProductDAO.findByLoaiNam(loai,pageable);
	   	 for(product a:sp) {
	   		 m.addAttribute("gia",(int)a.getGia());
	   		 
	   	 }
	   	this.sp1(m, id);
	   	 m.addAttribute("sp",sp);
	   	 Account acc = session.getAttribute("user");
		   if(acc != null) {
			   int countSLTrongGio = gioHangDAO.countGioHang(acc.getUsername());
			   m.addAttribute("countGio",countSLTrongGio);
		   }
		   List<thuonghieu> th = thuonghieuDAO.findAll();
			  m.addAttribute("th",th);
		return "ngdung/layoutNgdung/Nam";
	    }
	@RequestMapping("/themVaoGioNam")
	public String gioNam(Model m,@RequestParam("id") int id,@RequestParam("p") Optional<Integer> p) throws IOException {
		this.Nam(m, id,p,true);
		 Account acc = session.getAttribute("user");
		   if(acc != null) {
			   int countSLTrongGio = gioHangDAO.countGioHang(acc.getUsername());
			   m.addAttribute("countGio",countSLTrongGio);
		   }
		   List<thuonghieu> th = thuonghieuDAO.findAll();
			  m.addAttribute("th",th);
		 return "ngdung/layoutNgdung/Nam";
	}
	
	@GetMapping("/Nu")
	public String Nu(Model m,@RequestParam("p") Optional<Integer> p,
			@RequestParam("loai")Boolean loai) {
		int paging = p.orElse(0);
		if(paging < 0)
			paging = 0;
		else if(paging >7)
			paging = 7;
		Pageable pageable = PageRequest.of(paging, 8);
		 Page<product> sp = ProductDAO.findByLoaiNu(loai,pageable);
	   	 for(product a:sp) {
	   		 m.addAttribute("gia",(int)a.getGia());
	   		 
	   	 }
	   
	   
	   	 m.addAttribute("sp",sp);
	   	Account acc = session.getAttribute("user");
		   if(acc != null) {
			   int countSLTrongGio = gioHangDAO.countGioHang(acc.getUsername());
			   m.addAttribute("countGio",countSLTrongGio);
		   }
		   List<thuonghieu> th = thuonghieuDAO.findAll();
			  m.addAttribute("th",th);
		return "ngdung/layoutNgdung/Nu";
	    }
	@PostMapping("/Nu")
	public String Nu(Model m,@RequestParam("id") int id,
			@RequestParam("loai")Boolean loai) {
		 Pageable pageable = PageRequest.of(0, 8);
		 Page<product> sp = ProductDAO.findByLoaiNu(loai,pageable);
	   	 for(product a:sp) {
	   		 m.addAttribute("gia",(int)a.getGia());
	   		 
	   	 }
	   	 this.sp1(m,id);
	   	 Account acc = session.getAttribute("user");
		   if(acc != null) {
			   int countSLTrongGio = gioHangDAO.countGioHang(acc.getUsername());
			   m.addAttribute("countGio",countSLTrongGio);
		   }
		   List<thuonghieu> th = thuonghieuDAO.findAll();
			  m.addAttribute("th",th);
	   	 m.addAttribute("sp",sp);
	   	 
		return "ngdung/layoutNgdung/Nu";
	    }
	@RequestMapping("/themVaoGioNu")
	public String gioNu(Model m,@RequestParam("id") int id) throws IOException {
		this.Nu(m, id,false);
		 Account acc = session.getAttribute("user");
		   if(acc != null) {
			   int countSLTrongGio = gioHangDAO.countGioHang(acc.getUsername());
			   m.addAttribute("countGio",countSLTrongGio);
		   }
		   List<thuonghieu> th = thuonghieuDAO.findAll();
			  m.addAttribute("th",th);
		 return "ngdung/layoutNgdung/Nu";
	}
	@GetMapping("/thuonghieu")
	public String casio(Model m,@RequestParam("p") Optional<Integer> p,@RequestParam("ThuongHieu") String thuonghieu) {
		int paging = p.orElse(0);
		if(paging < 0)
			paging = 0;
		else if(paging >7)
			paging = 7;
		Pageable pageable = PageRequest.of(paging, 8);
		Page<product> list = ProductDAO.findByThuongHieu(thuonghieu,pageable);
		for(product a:list) {
	   		 m.addAttribute("gia",(int)a.getGia());
	   		 m.addAttribute("idThuongHieu", a.getThuonghieu().getId());
	   	 }
		m.addAttribute("thuonghieu", list);
		Account acc = session.getAttribute("user");
		   if(acc != null) {
			   int countSLTrongGio = gioHangDAO.countGioHang(acc.getUsername());
			   m.addAttribute("countGio",countSLTrongGio);
		   }
		   List<thuonghieu> th = thuonghieuDAO.findAll();
			  m.addAttribute("th",th);
		return "ngdung/layoutNgdung/thuonghieu";
	    }
	@PostMapping("/thuonghieu")
	public String casio(Model m,@RequestParam("id") int id,@RequestParam("ThuongHieu") String thuonghieu) {
		Pageable pageable = PageRequest.of(0, 8);
		Page<product> list = ProductDAO.findByThuongHieu(thuonghieu,pageable);
		
		for(product a:list) {
	   		 m.addAttribute("gia",(int)a.getGia());
	   		 
	   		 m.addAttribute("idThuongHieu", a.getThuonghieu());
	   	 }
		this.sp1(m, id);
		m.addAttribute("thuonghieu", list);
		 Account acc = session.getAttribute("user");
		   if(acc != null) {
			   int countSLTrongGio = gioHangDAO.countGioHang(acc.getUsername());
			   m.addAttribute("countGio",countSLTrongGio);
		   }
		   List<thuonghieu> th = thuonghieuDAO.findAll();
			  m.addAttribute("th",th);
		return "ngdung/layoutNgdung/thuonghieu";
	    }
	@RequestMapping("/ThemthuonghieuVaoGio")
	public String casioGio(Model m,@RequestParam("id") int id,@RequestParam("ThuongHieu") String thuonghieu) {
//		this.casio(m, id,thuonghieu);
		this.sp1(m, id);
		System.out.println(thuonghieu);
		 Account acc = session.getAttribute("user");
		   if(acc != null) {
			   int countSLTrongGio = gioHangDAO.countGioHang(acc.getUsername());
			   m.addAttribute("countGio",countSLTrongGio);
		   }
		   List<thuonghieu> th = thuonghieuDAO.findAll();
		     
			  m.addAttribute("th",th);
			 
				Pageable pageable = PageRequest.of(0, 8);
				Page<product> list = ProductDAO.findByThuongHieu(thuonghieu,pageable);
				for(product a:list) {
			   		 m.addAttribute("gia",(int)a.getGia());
			   		 m.addAttribute("idThuongHieu", a.getThuonghieu().getId());
			   	 }
				m.addAttribute("thuonghieu", list);	  
		return "ngdung/layoutNgdung/thuonghieu";
	    }

	@RequestMapping("/sp")
	public String sp(Model m,@RequestParam("id") int id) {
	   	 product sp = ProductDAO.getById(id);
	   	 m.addAttribute("ctsp", sp);
	   	List<thuonghieu> th = thuonghieuDAO.findAll();
		  m.addAttribute("th",th);
	   	 m.addAttribute("gia",(int)sp.getGia());
//	   	 this.sp1(m, id);
		return "ngdung/layoutNgdung/CTSP";
		
	    }
	@GetMapping("/gioHang")
	public String sp1(Model m) {
	   
	   Account acc=session.getAttribute("user");
	   	
		List<gioHang> a = gioHangDAO.findByUser(acc.getUsername());
		   for(gioHang c:a) {
			   System.out.println(c.getSl());
			   c.setThanhtien(c.getSl()* c.getProduct().getGia());
			   
			   
		   }
		   Double TongTien = gioHangDAO.SUMThanhTien(acc.getUsername());
		   m.addAttribute("tongtien",TongTien);
		   m.addAttribute("gio",a);
		   List<thuonghieu> th = thuonghieuDAO.findAll();
			  m.addAttribute("th",th);
		   if(acc != null) {
			   int countSLTrongGio = gioHangDAO.countGioHang(acc.getUsername());
			   m.addAttribute("countGio",countSLTrongGio);
		   }
	   	return "ngdung/layoutNgdung/giohang";
	    }
	
	@PostMapping("/gioHang")
	public String sp1(Model m,@RequestParam("id") int id) {
	   	 product sp = ProductDAO.getById(id);
//	   	 m.addAttribute("ctsp", sp);
//	   	 
//	   	 m.addAttribute("gia",(int)sp.getGia());
	   Account acc=session.getAttribute("user");
	   	
	   	gioHang cart = new gioHang();
	   	
	   cart.setUser(acc);
	   cart.setProduct(sp);
	   cart.setSl(1);
	   cart.setThanhtien(sp.getGia()*cart.getSl());
	   cart.setNgayadd(new Date());
	   carts.add(id, cart,acc.getUsername());
	   
	   List<gioHang> a = gioHangDAO.findByUser(acc.getUsername());
	   for(gioHang c:a) {
//		   System.out.println(c.getSl());
		   c.setThanhtien(c.getSl()*c.getProduct().getGia());
  
	   }
//	   Double TongTien = gioHangDAO.SUMThanhTien(acc.getUsername());
//	   m.addAttribute("tongtien",TongTien);
	   m.addAttribute("gio",a);
		   if(acc != null) {
			   int countSLTrongGio = gioHangDAO.countGioHang(acc.getUsername());
			   m.addAttribute("countGio",countSLTrongGio);
		   }
		   List<thuonghieu> th = thuonghieuDAO.findAll();
			  m.addAttribute("th",th);
	   	return "ngdung/layoutNgdung/giohang";
	    }
	
	@RequestMapping("/xoagioHang")
	public String xoagio(Model m,@RequestParam("id") int id) {
//	   	 gioHang cart = gioHangDAO.getById(id);
	   	 gioHangDAO.deleteById(id);
	   	Account acc=session.getAttribute("user");
	   	List<gioHang> a = gioHangDAO.findByUser(acc.getUsername());
		   
		   List<thuonghieu> th = thuonghieuDAO.findAll();
			  m.addAttribute("th",th);
		   Double TongTien = gioHangDAO.SUMThanhTien(acc.getUsername());
		   m.addAttribute("tongtien",TongTien);
		   m.addAttribute("gio",a);
	   	return "redirect:/gioHang";
	}
	@RequestMapping("/capnhatgioHang")
	public String capnhatgio(Model m,@RequestParam("id") int id,@RequestParam("sl") int sl) {
        
		Account acc=session.getAttribute("user");
	   	List<gioHang> a = gioHangDAO.findByUser(acc.getUsername());
		   gioHang gio = gioHangDAO.getById(id);
		   if(gio!= null) {
			   gio.setThanhtien(sl * gio.getProduct().getGia());
				  
			   carts.update(id,sl,gio.getThanhtien());
		   }
		   
			   
		   
		   Double TongTien = gioHangDAO.SUMThanhTien(acc.getUsername());
		   m.addAttribute("tongtien",TongTien);
		   m.addAttribute("gio",a);
		   List<thuonghieu> th = thuonghieuDAO.findAll();
			  m.addAttribute("th",th);
		   if(acc != null) {
			   int countSLTrongGio = gioHangDAO.countGioHang(acc.getUsername());
			   m.addAttribute("countGio",countSLTrongGio);
		   }
		   
		return "ngdung/layoutNgdung/giohang";
	}
}
