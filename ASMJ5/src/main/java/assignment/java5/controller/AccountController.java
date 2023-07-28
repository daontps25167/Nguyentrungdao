package assignment.java5.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.persistence.EntityManager;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import assignment.java5.Interface.AccountDAO;
import assignment.java5.entity.Account;
import assignment.java5.service.SessionService;

@Controller
@Transactional
public class AccountController {
	@Autowired
	HttpServletRequest req;
	@Autowired
	HttpServletResponse resp;
	@Autowired
	AccountDAO dao;
	@Autowired
	SessionService session;
	static int randomInt;
	static int passmoi;

	@RequestMapping("/login")
	public String login(Model model) throws IOException {
		String usename = req.getParameter("UserName");
		String pass = req.getParameter("password");

		if (usename != null) {
			Account acc = dao.getById(usename);
			if (usename != null) {
				if (acc.getUsername().equals(usename) && acc.getPassword().equalsIgnoreCase(pass)) {
//	   	   		acc.getPassword().equalsIgnoreCase(pass)

					if (acc.getVaitro() == true && acc.getTrangthai()) {
//	   		   	        resp.sendRedirect(req.getContextPath()+"/admin/sanpham");
						resp.sendRedirect(req.getContextPath() + "/index");
						session.setAttribute("user", acc);

					} else if (acc.getVaitro() == false && acc.getTrangthai()) {
						resp.sendRedirect(req.getContextPath() + "/index");
						session.setAttribute("user", acc);
					} else if (acc.getTrangthai() == false) {
						model.addAttribute("dn", "Tài khoản của bạn đã bị ngừng hoạt động");
					}
				} else {
					model.addAttribute("dn", "Đăng nhập thất bại");

				}
			}

		}
		return "account/login";

	}

	@PostMapping("/DKsendOTP")
	public String otp(Model m, @ModelAttribute("account") Account account) {
		for (int i = 0; i < 1; i++) {
			double random = Math.random();
			random = random * 1000000;
			randomInt = (int) random;
		}
		Properties props = new Properties();
		props.setProperty("mail.smtp.auth", "true");
		props.setProperty("mail.smtp.starttls.enable", "true");
		props.setProperty("mail.smtp.host", "smtp.gmail.com");
		props.setProperty("mail.smtp.ssl.trust", "smtp.gmail.com");
		props.setProperty("mail.smtp.ssl.protocols", "TLSv1.2");
		props.setProperty("mail.smtp.port", "587");

		Session session = Session.getInstance(props, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {

				String username = "thanhtmps25076@fpt.edu.vn";
				String password = "nyleudrcwhphlvvy";
				return new PasswordAuthentication(username, password);
			}
		});

		MimeMessage mime = new MimeMessage(session);

		try {
			Multipart mailmultipart = new MimeMultipart();

			MimeBodyPart bodytext = new MimeBodyPart();

			bodytext.setText("Nhập mã " + randomInt + " để xác nhận đăng ký tài khoản", "utf-8");

			mailmultipart.addBodyPart(bodytext);

			mime.setFrom(new InternetAddress("thanhtmps25076@fpt.edu.vn"));
			mime.setRecipients(Message.RecipientType.TO, account.getEmail());
			mime.setSubject("Mã OTP", "utf-8");
			mime.setReplyTo(mime.getFrom());
			mime.setContent(mailmultipart);

			Transport.send(mime);
			m.addAttribute("otp", "Vui lòng kiểm Email!");

		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			m.addAttribute("otp", "Gửi Mã thất bại");

		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			m.addAttribute("otp", "Gửi Mã thất bại");

		}
		return "account/dk";
	}

	@PostMapping("/QuenMKsendOTP")
	public String Quenotp(Model m, @ModelAttribute("account") Account account,
			@RequestParam("UserName") String username, @RequestParam("email") String email) {
		m.addAttribute("username", username);
		m.addAttribute("email", email);
		for (int i = 0; i < 1; i++) {
			double random = Math.random();
			random = random * 1000000;
			randomInt = (int) random;
		}
		Properties props = new Properties();
		props.setProperty("mail.smtp.auth", "true");
		props.setProperty("mail.smtp.starttls.enable", "true");
		props.setProperty("mail.smtp.host", "smtp.gmail.com");
		props.setProperty("mail.smtp.ssl.trust", "smtp.gmail.com");
		props.setProperty("mail.smtp.ssl.protocols", "TLSv1.2");
		props.setProperty("mail.smtp.port", "587");

		Session session = Session.getInstance(props, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {

				String username = "thanhtmps25076@fpt.edu.vn";
				String password = "nyleudrcwhphlvvy";
				return new PasswordAuthentication(username, password);
			}
		});

		MimeMessage mime = new MimeMessage(session);

		try {
			Multipart mailmultipart = new MimeMultipart();

			MimeBodyPart bodytext = new MimeBodyPart();

			bodytext.setText("Nhập mã " + randomInt + " để xác nhận đăng ký tài khoản", "utf-8");

			mailmultipart.addBodyPart(bodytext);

			mime.setFrom(new InternetAddress("thanhtmps25076@fpt.edu.vn"));
			mime.setRecipients(Message.RecipientType.TO, account.getEmail());
			mime.setSubject("Mã OTP", "utf-8");
			mime.setReplyTo(mime.getFrom());
			mime.setContent(mailmultipart);

			Transport.send(mime);
			m.addAttribute("tbforgotPassword", "Vui lòng kiểm Email!");

		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			m.addAttribute("tbforgotPassword", "Gửi Mã thất bại");

		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			m.addAttribute("tbforgotPassword", "Gửi Mã thất bại");

		}
		return "account/quenmk";
	}

	@GetMapping("/registration")
	public String getRegistration(Model model) {
		Account account = new Account();

		model.addAttribute("account", account);
		return "account/dk";
	}

	@PostMapping("/registration")
	public String postRegistration(Model model, @Valid @ModelAttribute("account") Account account, BindingResult rs) {
		int check = 0;

		if (rs.hasErrors()) {

			model.addAttribute("dk", "Đăng ký thất bại");
		} else {
			String pass = req.getParameter("password2");
			String maXN = req.getParameter("maXN");
			model.addAttribute("passNL", pass);

			List<Account> list = dao.findAll();
			for (Account a : list) {
				if (a.getUsername().equals(account.getUsername())) {
					check = 1;
					System.out.println("name:" + check);
				}
				if (a.getEmail().equals(account.getEmail())) {
					check = 2;
					System.out.println("email:" + check);
				}
				if (a.getSdt().equals(account.getSdt())) {
					check = 3;

				}
			}
			if (check == 0) {

				if (pass.equalsIgnoreCase(account.getPassword())) {
					if (randomInt == Integer.parseInt(maXN)) {
						account.setVaitro(false);
//	        					mahoa testMaHoa = new mahoa();
//	        					String testMaHoaVaoCSDL= testMaHoa.passwordEncoder().encode(pass);
						account.setPassword(pass);
						account.setTrangthai(true);
						dao.save(account);
						model.addAttribute("dk", "Đăng ký thành công");
					} else {
						model.addAttribute("maXN", "Mã xác nhận không đúng");
					}
				} else {
					model.addAttribute("loiPass", "Password không khớp");
				}
			} else if (check == 1) {
				model.addAttribute("user", "Tài khoản đã tồn tại");
			} else if (check == 2) {
				model.addAttribute("email", "Email đã tồn tại");
			} else if (check == 3) {
				model.addAttribute("sdt", "Số điện thoại đã tồn tại");
			}
		}
		return "account/dk";
	}

	@GetMapping("/forgotPassword")
	public String GetforgotPassword() {

		return "account/quenmk";
	}

	@PostMapping("/forgotPassword")
	public String PostforgotPassword(Model m, @RequestParam("UserName") String username,
			@RequestParam("email") String email, @RequestParam("ma") Integer maXN) {
		m.addAttribute("username", username);
		m.addAttribute("email", email);
		if (username.equals("")) {
			m.addAttribute("tbforgotPassword", "Chưa nhập UserName");
		} else if (email.equals("")) {
			m.addAttribute("tbforgotPassword", "Chưa nhập Email");
		} else {
			Account acc = dao.getById(username);
			if (acc.getUsername().equalsIgnoreCase(username + "") && acc.getEmail().equalsIgnoreCase(email)) {
				if (maXN == randomInt) {
					for (int i = 0; i < 1; i++) {
						double random = Math.random();
						random = random * 1000000;
						passmoi = (int) random;
						Properties props = new Properties();
						props.setProperty("mail.smtp.auth", "true");
						props.setProperty("mail.smtp.starttls.enable", "true");
						props.setProperty("mail.smtp.host", "smtp.gmail.com");
						props.setProperty("mail.smtp.ssl.trust", "smtp.gmail.com");
						props.setProperty("mail.smtp.ssl.protocols", "TLSv1.2");
						props.setProperty("mail.smtp.port", "587");
						Session session = Session.getInstance(props, new Authenticator() {
							protected PasswordAuthentication getPasswordAuthentication() {

								String username = "thanhtmps25076@fpt.edu.vn";
								String password = "nyleudrcwhphlvvy";
								return new PasswordAuthentication(username, password);
							}
						});
						MimeMessage mime = new MimeMessage(session);

						try {
							Multipart mailmultipart = new MimeMultipart();

							MimeBodyPart bodytext = new MimeBodyPart();

							bodytext.setText("Mật khẩu mặc định của bạn là : " + passmoi, "utf-8");
							// cập nhật vào csdl pass mặc định

							acc.setPassword(passmoi + "");
							dao.save(acc);
							mailmultipart.addBodyPart(bodytext);
							mime.setFrom(new InternetAddress("thanhtmps25076@fpt.edu.vn"));
							mime.setRecipients(Message.RecipientType.TO, email);
							mime.setSubject("ForgetPasswod", "utf-8");
							mime.setReplyTo(mime.getFrom());
							mime.setContent(mailmultipart);

							Transport.send(mime);
							m.addAttribute("tbforgotPassword", "Vui lòng kiểm Email để lấy password mặc định!");

						} catch (AddressException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
							m.addAttribute("tbforgotPassword", "Lấy mật khẩu thất bại");
						} catch (MessagingException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
							m.addAttribute("tbforgotPassword", "Lấy mật khẩu thất bại");
						}
					}
				} else {
					m.addAttribute("tbforgotPassword", "Mã xác minh không đúng");
				}

			} else {

				m.addAttribute("tbforgotPassword", "Usename hoặc email chưa đúng");
			}
		}

		return "account/quenmk";
	}

	@GetMapping("/changePassword")
	public String changePassword(Model m) {
		Account user = session.getAttribute("user");
		m.addAttribute("username", user.getUsername());
		return "account/doimk";
	}

	@PostMapping("/changePassword")
	public String changePassword(Model m, @RequestParam("passwordCu") String passCu,
			@RequestParam("passwordMoi") String passMoi, @RequestParam("passwordXN") String XNPass) {
		Account user = session.getAttribute("user");
		m.addAttribute("username", user.getUsername());
		if (!passCu.equalsIgnoreCase(user.getPassword())) {
			m.addAttribute("doiPass", "Password cũ không đúng");
		} else if (!passMoi.equalsIgnoreCase(XNPass)) {
			m.addAttribute("doiPass", "Xác nhận Password không đúng");
		} else {
			Account acc = dao.getById(user.getUsername());
			acc.setPassword(passMoi);
			dao.save(acc);
			m.addAttribute("doiPass", "Bạn đã đổi Password thành công");
			m.addAttribute("passCu", passCu);
			m.addAttribute("passMoi", passMoi);
			m.addAttribute("passXN", XNPass);
		}
		return "account/doimk";
	}

	@GetMapping("/update")
	public String update(Model m) {
		Account user = session.getAttribute("user");
		m.addAttribute("User", user);
		return "account/capnhatTK";
	}

	@PostMapping("/update")
	public String update(Model m, @RequestParam("password") String password, @RequestParam("email") String email,
			@RequestParam("fullname") String fullname, @RequestParam("sdt") String sdt,
			@RequestParam("diachi") String diachi) {
		Account user = session.getAttribute("user");
		m.addAttribute("User", user);
		Account acc = dao.getById(user.getUsername());
		acc.setPassword(password);
		acc.setFullname(fullname);
		acc.setDiachi(diachi);
		acc.setEmail(email);
		acc.setSdt(sdt);
		dao.save(acc);
//		 m.addAttribute("pass",password);
//		 m.addAttribute("fullname",fullname);
//		 m.addAttribute("diachi",diachi);
//		 m.addAttribute("email",email);
//		 m.addAttribute("sdt",sdt);
		m.addAttribute("capNhat", "Đã cập nhật thông tin");
		return "account/capnhatTK";
	}
}
