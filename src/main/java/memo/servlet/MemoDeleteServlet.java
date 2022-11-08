package memo.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import memo.model.MemoDAO;

@WebServlet("/MemoDelete")
public class MemoDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out=res.getWriter();
		
		//[1] 사용자가 입력한 값 받아오기. req통해서 받아와야함.
		String idxStr=req.getParameter("idx");
		//[2]유효성체크
		if(idxStr==null||idxStr.trim().equals("")) {
			res.sendRedirect("MemoList");
			return;
		}
		int idx=Integer.parseInt(idxStr.trim());
		//[3] 1번에서 받은 값을 MemoVO객체 생성하고 담아주기(import memo.model.MemoVO해야함.)
		MemoDAO dao=new MemoDAO();
		
		//[4] MemoDAO객체 생성해서 deleteMemo() 호출하기.(import memo.model.MemoDAO해야함. SQLException 잡아줘야함.)

		try {
			int n=dao.deleteMemo(idx);
			System.out.println("n: "+n);
			String str=(n>0)?"글 삭제 성공":"글 삭제 실패";
			String loc="MemoList";
			out.println("<script>");
			out.println("alert('"+str+"')");
			out.println("location.href='"+loc+"'");
			out.println("</script>");
		} catch (SQLException e) {
			e.printStackTrace();
			out.println("error: "+e.getMessage()+"<br>");
		}
		out.close();
	}

}
