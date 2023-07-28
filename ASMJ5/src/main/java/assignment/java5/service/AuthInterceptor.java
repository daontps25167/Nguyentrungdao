package assignment.java5.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;

import assignment.java5.entity.Account;



@Service
public class AuthInterceptor implements HandlerInterceptor {
   @Autowired
   SessionService session;
   
   @Override
   public boolean preHandle(HttpServletRequest request,
		   HttpServletResponse response, Object handler) throws Exception {
	   request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
	   String uri = request.getRequestURI();
			   Account user = session.getAttribute("user");
			   String error ="";
			   if(user == null) {
				   error ="Moi dang nhap";
			   }else if(!user.getVaitro() && uri.startsWith("/admin/")) {
				   error ="khong phai admin";
			   }
			   if(error.length()>0) {
				   session.setAttribute("security-uri", uri);
				   response.sendRedirect("/login?error="+error);
				   return false;
			   }
			   
			   
			   return true;
		   }
}
