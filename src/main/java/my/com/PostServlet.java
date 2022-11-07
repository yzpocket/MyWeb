package my.com;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//post방식은 요청 entity body에 데이터를 포함 시켜 전송한다. 따라서 url부분에 데이터 노출이 없다.
@WebServlet("/PostTest")
public class PostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//사용자가 입력한 값 받아서 브라우저에 출력.
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out=res.getWriter();
		//이미지나 동영상파일
		//ServletOutputStream sos=res.getOutputStream();
		out.println("<h1>POST 방식 TEST</h1>");
		out.println("<h2>POST방식 요청을 처리할 때는  -doPost() 메서드를 오버라이드 해야 한다. </h2>");
		out.println("<h2>이건 @WebServlet 어노테이션 등록하는 방식으로 doPost()를 오버라이드해 구현했습니다.~</h2>");

		//Post 방식일때 한글 처리가 필요하다.
		req.setCharacterEncoding("UTF-8");
		//html의 form태그를 통해 전송된 파라미터 값(name이다 id가 아니다.)은 req를 이용해서 받는다.	
		String name=req.getParameter("name");
		String userid=req.getParameter("userid");
		out.println("<h3>이름: "+name+"</h3>");
		out.println("<h3>아이디: "+userid+"</h3>");
		
		out.close();
	}

}
