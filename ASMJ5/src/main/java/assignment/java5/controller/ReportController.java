package assignment.java5.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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

import assignment.java5.Interface.DonHangDAO;
import assignment.java5.Interface.GioHangDAO;
import assignment.java5.Interface.ProductDAO;
import assignment.java5.entity.Account;
import assignment.java5.entity.Report;
import assignment.java5.entity.donhang;
import assignment.java5.entity.gioHang;
import assignment.java5.entity.product;
import assignment.java5.service.SessionService;
@Controller
public class ReportController {
	@Autowired
	GioHangDAO gioHangDAO;
	@Autowired
	SessionService session;
	 @Autowired
	ProductDAO ProductDAO;
	@Autowired
	DonHangDAO DonhangDAO;
	@Autowired
	HttpServletRequest req;
	 @RequestMapping("/report")
	public String report(Model m) {
		
		 List<Report> report = ProductDAO.getInventoryByCategory();
		  
		 List<String> nam = DonhangDAO.findNam();
		 
		 List<donhang> donhang = DonhangDAO.findAll();
		 m.addAttribute("nam",nam);
		 m.addAttribute("report",report);
		 m.addAttribute("donhang",donhang);
		 return "admin/layoutAdmin/thongKe";
	}
	
	 @RequestMapping("/report/year")
		public String reportYear(Model m) {
		String date =req.getParameter("date");
		int dateInt = Integer.parseInt(date); 
			 List<Report> report = ProductDAO.getInventoryByCategory();
			 
			 List<String> nam = DonhangDAO.findNam();
			 
			 List<donhang> donhang = DonhangDAO.findDate(dateInt);
			 m.addAttribute("donhang",donhang);
			 m.addAttribute("nam",nam);
			 m.addAttribute("report",report);
			 return "admin/layoutAdmin/thongKe";
		}
}
