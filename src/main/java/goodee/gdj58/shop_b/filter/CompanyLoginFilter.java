package goodee.gdj58.shop_b.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import goodee.gdj58.shop_b.util.TeamColor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@WebFilter("/company/*")
public class CompanyLoginFilter extends HttpFilter implements Filter {
       
    @Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

    	log.debug(TeamColor.CYAN + "CompanyFilter 실행");
    	
    	if(request instanceof HttpServletRequest) {
    		// ServletRequest request 가 HttpServletRequest로 형변환이 가능할때
    		// 웹 브라우저에서 요청이 들어올 때로 해석
    		
    		HttpServletRequest req = (HttpServletRequest) request;
    		
    		HttpSession session =  req.getSession();
    		if(session.getAttribute("loginCompany") == null) {
    			// 이미 상위 if에서 웹 요청 검사 했기에 여기선 안해도 됨.
    			
    			// 통합로그인으로 redirect
    			((HttpServletResponse) response).sendRedirect(req.getContextPath() + "/login");
    			
    			return;
    			
    		}
    		
    		
    		
    	} else {
    		
    		log.debug("웹브라우저 요청만 허용합니다.");
    		
    	}
    	
		// controller 전
		// emp session 검사
		chain.doFilter(request, response);	// 이 코드가 실행되어야 우리가 개발한 코드가 실행됨.
		// controller 후
		// emp session null 이면 redirect 후 return
	}

    
	
}
