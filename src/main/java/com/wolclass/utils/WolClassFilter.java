package com.wolclass.utils;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

@WebFilter(urlPatterns = "/*")
public class WolClassFilter implements Filter {

	/**
	 * doFilter 메소드에서 본인이 필요한 동작 (모든 요청에 응답해야하는 경우) 구현하면 됩니다.
	 * 단, 공용 파일이므로 작업 필요 시 사전에 알리기 바랍니다.
	 * @author bcdc124
	 */
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// 한글처리
		request.setCharacterEncoding("UTF-8");
		// 한글처리

		chain.doFilter(request, response);
	}
	
	// 사용하는 부분 아님
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {}
	@Override
	public void destroy() {}
	// 사용하는 부분 아님
}
