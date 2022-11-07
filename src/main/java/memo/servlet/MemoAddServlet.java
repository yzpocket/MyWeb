package memo.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import memo.model.*;


@WebServlet("/MemoAdd")
public class MemoAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out=res.getWriter();
		
		//[1] 사용자가 입력한 값 받아오기. req통해서 받아와야함.
		String name=req.getParameter("name");
		String msg=req.getParameter("msg");
		out.println(name+"/"+msg);
		
		
		//[2] 유효성 체크 (백엔드쪽에서도 한번더 체크)
		//자바스크립트에서 빈문자열 체크, 비정상경로로 직접 url로 들어오는 경우도 있어서 null값 발생등 문제가 생김. 이런것들을 차단.
		if(name==null||msg==null||name.trim().isEmpty()||msg.trim().isEmpty()) {
			res.sendRedirect("memo/input.html");
			//sendRedirect(): redirect 방식으로 페이지를 이동시켜버린다.
			//					=> browser의 url을 지정 페이지로 변경한 뒤 서버에 새로운 요청을 발생 시켜 이동한다.
			return;
		}
		
		//[3] 1번에서 받은 값을 MemoVO객체 생성하고 담아주기(import memo.model.MemoVO해야함.)
		MemoVO vo=new MemoVO(0, name, msg, null);
		
		//[4] MemoDAO객체 생성해서 insertMemo() 호출하기.(import memo.model.MemoDAO해야함. SQLException 잡아줘야함.)
		MemoDAO dao=new MemoDAO();
		try {
		int n=dao.insertMemo(vo);
			String str=(n>0)?"글등록 성공":"글 등록 실패";
			String loc=(n>0)?"MemoList":"memo/input.html";
			out.println(str);
			out.println("<script>");
			out.println("alert('"+str+"')");
			out.println("location.href='"+loc+"'");
			out.println("</script>");
		}catch(Exception e) {
			e.printStackTrace();
			out.println("error: "+e.getMessage()+"<br>");
		}
		//[5] 그 실행 결과 메시지 처리
//		out.println("MemoAddServlet");
		out.close();
	}

}
