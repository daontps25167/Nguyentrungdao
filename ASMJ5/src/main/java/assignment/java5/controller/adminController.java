package assignment.java5.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.servlet.ServletContext;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import assignment.java5.Interface.AccountDAO;
import assignment.java5.Interface.ProductDAO;
import assignment.java5.Interface.thuongHieuDAO;
import assignment.java5.entity.Account;
import assignment.java5.entity.product;
import assignment.java5.entity.thuonghieu;

@Controller
public class adminController {
     @Autowired
     AccountDAO accountDao;
     @Autowired
     ProductDAO productDAO;
     @Autowired
     thuongHieuDAO thuonghieuDAO;
     @Autowired
 	ServletContext context;
	@RequestMapping("/admin/user")
	public String adminUser(Model m) {
		Account account = new Account();
		
		 m.addAttribute("account", account);
		
		 List<Account> listUser = accountDao.findAll();
		 m.addAttribute("users", listUser);
		 return "admin/layoutAdmin/user";
	    }
	@RequestMapping("/admin/user/add")
	public String adminUser(Model m,@Valid
			@ModelAttribute("account") Account account, 
			BindingResult rs) {
	int check =0;
		
		if(rs.hasErrors()) {
			
    		m.addAttribute("dk","Đăng ký thất bại");
    	}else {
    			List<Account> list = accountDao.findAll();
    			  for(Account a:list) {
    				  if(a.getUsername().equals(account.getUsername())) {
    					  check = 1;
    					  System.out.println("name:"+check);
    				  }
    				  if(a.getEmail().equals(account.getEmail())) {
    					  check =2;
    					  System.out.println("email:"+check);
    				  }
    				  if(a.getSdt().equals(account.getSdt())) {
    					  check =3;
    					 
    				  }
    			  }
			         if(check ==0) {			
		                		accountDao.save(account);
		                		m.addAttribute("dk","Đăng ký thành công");
	        				
	        	 
			 }else if(check ==1) {
				 m.addAttribute("user","Tài khoản đã tồn tại");
			 }else if(check ==2) {
				 m.addAttribute("email","Email đã tồn tại");
			 }else if(check ==3) {
				 m.addAttribute("sdt","Số điện thoại đã tồn tại");
			 }
    	}
		 List<Account> listUser = accountDao.findAll();
		 m.addAttribute("users", listUser);
		 return "admin/layoutAdmin/user";
	    }
	@RequestMapping("/admin/user/edit")
	public String edit(Model m,@RequestParam("id") String id,@Valid
			@ModelAttribute("account") Account account, 
			BindingResult rs) {
		Account acc = accountDao.getById(id);
		account = new Account();
		account.setUsername(id);
		account.setPassword(acc.getPassword());
		account.setFullname(acc.getFullname());
		account.setEmail(acc.getEmail());
		account.setDiachi(acc.getDiachi());
		account.setSdt(acc.getSdt());
		account.setVaitro(acc.getVaitro());
		account.setTrangthai(acc.getTrangthai());
		m.addAttribute("account",account);
		m.addAttribute("name",id);
		List<Account> listUser = accountDao.findAll();
		
		 m.addAttribute("user", listUser);
		 return "admin/layoutAdmin/user";
	}
	@RequestMapping("/admin/user/update")
	public String update(Model m,@RequestParam("id") String id,@Valid
			@ModelAttribute("account") Account account, 
			BindingResult rs) {
              int check =0;
		
		if(rs.hasErrors()) {
			
    		m.addAttribute("dk","Cập nhật thất bại");
    	}else {
    			
		                		accountDao.save(account);
		                		m.addAttribute("dk","Cập nhật thành công"); 
    	}
		
		List<Account> listUser = accountDao.findAll();
		
		 m.addAttribute("user", listUser);

		 return "admin/layoutAdmin/user";
	}

	@RequestMapping("/admin/user/clear")
	public String clear(Model m,@Valid
			@ModelAttribute("account") Account account,
			BindingResult rs) {
		
		this.adminUser(m);
		
		return "admin/layoutAdmin/user";
	}
	@RequestMapping("/admin/sanpham")
	public String adminSP(Model m,@RequestParam("p") Optional<Integer> p) {
		int paging = p.orElse(0);
		if(paging < 0)
			paging = 0;
		else if(paging >7)
			paging = 7;
		Pageable pageable = PageRequest.of(paging,8);
		Page<product> sp = productDAO.findAll(pageable);
		
	   	 List<thuonghieu> thuonghieu = thuonghieuDAO.findAll();
	   	 for(product a:sp) {
//	   		 a.getIdSP()
	   	 }
	   	 m.addAttribute("th", thuonghieu);
	   	 m.addAttribute("sp", sp);
	   	m.addAttribute("product", new product());
		return "admin/layoutAdmin/sanPham";
	    }
	@RequestMapping("/admin/sanpham/add")
	public String AddSP(Model m,@Valid
			@ModelAttribute("product") product product, 
			BindingResult rs,@RequestParam("file") MultipartFile[] file,@RequestParam("thuonghieu") String th,
			@RequestParam("loai") Boolean loai,@RequestParam("p") Optional<Integer> p) {
//		product = new product();
if(rs.hasErrors()) {
			
    		m.addAttribute("dk","thêm sản phẩm thất bại");
    	}else {
    		
    	
	   	 
	   	List<File> fileAttach = new ArrayList<>();
		String pathUpload = context.getRealPath("/images");
		File dirs = new File(pathUpload);
		if (!dirs.exists())
			dirs.mkdirs();
		for (MultipartFile at : file) {
			String namefileOrgin = at.getOriginalFilename();
		    
		 product.setHinhSP(namefileOrgin);
		 if(th!= null) {
			 
			 product.setThuonghieu(product.getThuonghieu());
		 }
		 if(loai!= null) {
			 product.setLoai(loai);
			 System.out.println(loai);
		 }
		 if(!th.equals("") &&!loai.equals("") &&!product.getTenSP().equals("")) {
			 productDAO.save(product);
			 m.addAttribute("tbSP","Thêm sản phẩm thành công");
			 System.out.println("th"+th);
			 System.out.println("Loai"+loai);
		 }else {
			 m.addAttribute("tbSP","Thêm thất bại");
			 System.out.println("Name:"+product.getTenSP());
		 }
		 int paging = p.orElse(0);
			if(paging < 0)
				paging = 0;
			else if(paging >7)
				paging = 7;
			Pageable pageable = PageRequest.of(paging,8);
			Page<product> sp = productDAO.findAll(pageable);
	   	 List<thuonghieu> thuonghieu = thuonghieuDAO.findAll();
	   	 for(product a:sp) {
//	   		 a.getIdSP()
	   	 }
	   	 m.addAttribute("th", thuonghieu);
	   	 m.addAttribute("sp", sp);
//	   	m.addAttribute("product", new product());
		
	    }
    	}
		return "admin/layoutAdmin/sanPham";
	}
	
	@RequestMapping("/admin/sanpham/edit")
	public String editsp(Model m,@RequestParam("id") int id,@Valid
			@ModelAttribute("product") product product, 
			BindingResult rs,@RequestParam("p") Optional<Integer> p
			) {
		product sp = productDAO.getById(id);
		product = new product();
		product.setIdSP(id);
	    product.setTenSP(sp.getTenSP());
	    product.setHinhSP(sp.getHinhSP());
	    product.setLoai(sp.isLoai());
	    product.setThuonghieu(sp.getThuonghieu());
	    product.setGia(sp.getGia());
	    product.setSl(sp.getSl());
	    
		m.addAttribute("product",product);
		m.addAttribute("name",id);
		int paging = p.orElse(0);
		if(paging < 0)
			paging = 0;
		else if(paging >7)
			paging = 7;
		Pageable pageable = PageRequest.of(paging,8);
		Page<product> sp1 = productDAO.findAll(pageable);
		
	   	 List<thuonghieu> thuonghieu = thuonghieuDAO.findAll();
	   	 for(product a:sp1) {
//	   		 a.getIdSP()
	   	 }
	   	 m.addAttribute("th", thuonghieu);
	   	 m.addAttribute("sp", sp1);
//	   	m.addAttribute("product", new product());
	   	m.addAttribute("name",id);
		return "admin/layoutAdmin/sanPham";
	}
	
	@RequestMapping("/admin/sanpham/update")
	public String updatesp(Model m,@RequestParam("id") int id,@Valid
			@ModelAttribute("product") product product, 
			BindingResult rs,@RequestParam("file")  MultipartFile[] file,@RequestParam("thuonghieu") thuonghieu th,
			@RequestParam("loai") String loai,@RequestParam("p") Optional<Integer> p) {
if(rs.hasErrors()) {
			
    		m.addAttribute("dk","cập nhật sản phẩm thất bại");
    	}else {
    		
    	}
         System.out.println("id"+id);
//	   	 product = productDAO.getById(id);
         product.setIdSP(id);
	   	List<File> fileAttach = new ArrayList<>();
		String pathUpload = context.getRealPath("/images");
		File dirs = new File(pathUpload);
		if (!dirs.exists())
			dirs.mkdirs();
		for (MultipartFile at : file) {
			String namefileOrgin = at.getOriginalFilename();
		    
		 product.setHinhSP(namefileOrgin);
		 if(th!= null) {
			 product.setThuonghieu(th);
		 }
		 if(loai!= null) {
			 product.setLoai(Boolean.parseBoolean(loai));
			 System.out.println(loai);
		 }
		 if(!th.equals("") &&!loai.equals("") &&!product.getTenSP().equals("")) {
			 productDAO.save(product);
			 m.addAttribute("tbSP","Cập nhật sản phẩm thành công");
			 System.out.println("th"+th);
			 System.out.println("Loai"+loai);
			 System.out.println("Name:"+product.getIdSP());
		 }else {
			 m.addAttribute("tbSP","Cập nhật thất bại");
			 System.out.println("Name:"+product.getTenSP());
		 }
		 int paging = p.orElse(0);
			if(paging < 0)
				paging = 0;
			else if(paging >7)
				paging = 7;
			Pageable pageable = PageRequest.of(paging,8);
			Page<product> sp = productDAO.findAll(pageable);
	   	 List<thuonghieu> thuonghieu = thuonghieuDAO.findAll();
	   	 for(product a:sp) {
//	   		 a.getIdSP()
	   	 }
	   	 m.addAttribute("th", thuonghieu);
	   	 m.addAttribute("sp", sp);
	   	 
//	   	m.addAttribute("product", new product());
		
	    }
		return "admin/layoutAdmin/sanPham";
	}
	@RequestMapping("/admin/sanpham/delete")
	public String delete(Model m,@RequestParam("id") int id,@Valid
			@ModelAttribute("product") product product, 
			BindingResult rs,@RequestParam("p") Optional<Integer> p) {
          product.setIdSP(id);
		
    			
		                		productDAO.delete(product);
		                		m.addAttribute("tbSP","Xóa  thành công"); 
    	
		
		 int paging = p.orElse(0);
			if(paging < 0)
				paging = 0;
			else if(paging >7)
				paging = 7;
			Pageable pageable = PageRequest.of(paging,8);
			Page<product> sp = productDAO.findAll(pageable);
	   	 List<thuonghieu> thuonghieu = thuonghieuDAO.findAll();
	   	 for(product a:sp) {
//	   		 a.getIdSP()
	   	 }
	   	 m.addAttribute("th", thuonghieu);
	   	 m.addAttribute("sp", sp);
	   	 
//	   	m.addAttribute("product", new product());
		
	    
		return "admin/layoutAdmin/sanPham";
	}
	@RequestMapping("/admin/thuonghieu")
	public String adminthuonghieu(Model m,@RequestParam("p") Optional<Integer> p) {
		int paging = p.orElse(0);
		if(paging < 0)
			paging = 0;
		else if(paging >7)
			paging = 7;
		Pageable pageable = PageRequest.of(paging,8);
		Page<thuonghieu> sp = thuonghieuDAO.findAll(pageable);
		
	   	
	   	
	   
	   	 m.addAttribute("sp", sp);
	   	m.addAttribute("thuonghieu", new thuonghieu());
		return "admin/layoutAdmin/thuonghieu";
	    }
	@RequestMapping("/admin/thuonghieu/add")
	public String Addthuonghieu(Model m,@Valid
			@ModelAttribute("thuonghieu") thuonghieu thuonghieu, 
			BindingResult rs,@RequestParam("p") Optional<Integer> p) {

if(rs.hasErrors()) {
			
    		m.addAttribute("tbth","thêm  thất bại");
    	}else {
    		if(!thuonghieu.getId().equals("")&& !thuonghieu.getName().equals("")) {
	        	thuonghieuDAO.save(thuonghieu);
	        	m.addAttribute("tbth","thêm  thành công");
    		}else {
    			m.addAttribute("tbth","thêm  thất bại");
    		}
    	}		
    		int paging = p.orElse(0);
    		if(paging < 0)
    			paging = 0;
    		else if(paging >7)
    			paging = 7;
    		Pageable pageable = PageRequest.of(paging,8);
    		Page<thuonghieu> sp = thuonghieuDAO.findAll(pageable);
    		
    	   	
    	   	
    	   
    	   	 m.addAttribute("sp", sp);
    		return "admin/layoutAdmin/thuonghieu";
	}
	
	
	@RequestMapping("/admin/thuonghieu/edit")
	public String editsp(Model m,@Valid
			@ModelAttribute("thuonghieu") thuonghieu thuonghieu, 
			BindingResult rs,@RequestParam("p") Optional<Integer> p,@RequestParam("id") String id
			) {
		thuonghieu tim = thuonghieuDAO.getById(id);
		thuonghieu = new thuonghieu();
		thuonghieu.setId(tim.getId());
	     thuonghieu.setName(tim.getName());
	    
		m.addAttribute("thuonghieu",thuonghieu);
		m.addAttribute("name",id);
		int paging = p.orElse(0);
		if(paging < 0)
			paging = 0;
		else if(paging >7)
			paging = 7;
		Pageable pageable = PageRequest.of(paging,8);
		Page<thuonghieu> sp = thuonghieuDAO.findAll(pageable);
		
	   	 m.addAttribute("sp", sp);
		return "admin/layoutAdmin/thuonghieu";
	}
	
	@RequestMapping("/admin/thuonghieu/update")
	public String updatesp(Model m,@Valid
			@ModelAttribute("thuonghieu") thuonghieu thuonghieu, 
			BindingResult rs,@RequestParam("p") Optional<Integer> p,@RequestParam("idTh") String id) {
if(rs.hasErrors()) {
			
    		m.addAttribute("tbth","sửa  thất bại");
    	}else {
    		if(!thuonghieu.getId().equals("")&& !thuonghieu.getName().equals("")) {
	        	thuonghieu.setId(id);
	        	System.out.println("id:"+id);
    			thuonghieuDAO.save(thuonghieu);
	        	m.addAttribute("tbth","sửa  thành công");
    		}else {
    			m.addAttribute("tbth","sửa  thất bại");
    		}
    	}		
    		int paging = p.orElse(0);
    		if(paging < 0)
    			paging = 0;
    		else if(paging >7)
    			paging = 7;
    		Pageable pageable = PageRequest.of(paging,8);
    		Page<thuonghieu> sp = thuonghieuDAO.findAll(pageable);
    		
    	   	
    	   	
    	   
    	   	 m.addAttribute("sp", sp);
    		return "admin/layoutAdmin/thuonghieu";
	}
	@RequestMapping("/admin/thuonghieu/delete")
	public String deletethuonghieu(Model m,@Valid
			@ModelAttribute("thuonghieu") thuonghieu thuonghieu, 
			BindingResult rs,@RequestParam("p") Optional<Integer> p,@RequestParam("idTh") String id) {
		 System.out.println("id"+id);
		thuonghieu.setId(id);
          if(rs.hasErrors()) {
  			
      		m.addAttribute("tbth","xóa  thất bại");
      	}else {
    			
		                		thuonghieuDAO.delete(thuonghieu);
		                		m.addAttribute("tbth","Xóa  thành công"); 
    	                       
		
		                		int paging = p.orElse(0);
		                		if(paging < 0)
		                			paging = 0;
		                		else if(paging >7)
		                			paging = 7;
		                		Pageable pageable = PageRequest.of(paging,8);
		                		Page<thuonghieu> sp = thuonghieuDAO.findAll(pageable);
		                		
		                	   	
		                	   	
		                	   
		                	   	 m.addAttribute("sp", sp);
		                		
	}
          return "admin/layoutAdmin/thuonghieu";
	}
	@RequestMapping("/admin/thongke")
	public String adminthongke(Model model) {
	   	 return "admin/layoutAdmin/thongKe";
	    }
}

