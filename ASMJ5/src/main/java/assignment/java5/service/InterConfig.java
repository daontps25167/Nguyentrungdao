package assignment.java5.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class InterConfig implements WebMvcConfigurer {
  @Autowired
  GlobalInterceptor global;
  
  @Autowired
  AuthInterceptor auth;
  
  @Override
  public void addInterceptors(InterceptorRegistry registry) {
	  registry.addInterceptor(global)
	  .addPathPatterns("/**")
	  .excludePathPatterns("/assets/**");
//	  
	  registry.addInterceptor(auth)
	  .addPathPatterns("/QLdonHang","/gioHang","/ThemVaoGioindex","/themVaoGioNam","/themVaoGioNu","/ThemthuonghieuVaoGio","/CTdonHang",
			  "/ThemCitiZenVaoGio","/datHang","/admin/**","/report/**");
//	  .excludePathPatterns("/index","/assets/**", "/admin/home/index");

  }
}
