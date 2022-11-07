package my.com;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/* [1] HttpServlet 을 상속받아 구현 : http프로토콜에 특화된 서블릿
 * [2] doGet() 또는 doPost() 메서드를 오버라이드 한다. Exception도 throws해준다.
 * [3] 2번에서 오버라이드 재정의한 메서드 안에서 코드 구현. (여기선 doGet)
 * 
 * 서블릿은 구현하고 나면 "서블릿을 web.xml에 등록"하던지, 아니면 "어노테이션(@WebServlet)을 기술"해야 한다.
 * [중복설정하면안된다. 둘중하나만]
 * (1) web.xml 등록 방법(WEB-INF/web.xml 열어본다.) 
 * 
 * (2) @WebServlet 어노테이션 등록하는 방식<<<<<<<이 예제는 어노테이션으로 등록방법을 사용했습니다.
 */

//어노테이션으로 servlet-mapping url-pattern을 등록한다. 이때 @WebServlet("/GetTest")안의 << url pattern은 unique해야 한다.
@WebServlet("/GetTest")
public class GetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out=res.getWriter();
		out.println("<h1>GetServlet</h1>");
		out.println("<h2>GET방식의 요청을 처리할 때는 doGet()메서드를 오버라이드 합니다.</h2>");
		out.println("<h2>이건 @WebServlet 어노테이션 등록하는 방식에서 doGet()오버라이드해 구현했습니다.~</h2>");

		//html의 form태그를 통해 전송된 파라미터 값(name이다 id가 아니다.)은 req를 이용해서 받는다.	
		String name=req.getParameter("name");
		String userid=req.getParameter("userid");
		out.println("<h3>이름: "+name+"</h3>");
		out.println("<h3>아이디: "+userid+"</h3>");
		
		
		out.close();
	}

}
