package memo.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import memo.model.MemoDAO;
import memo.model.MemoVO;

//MemoEditFormServlet작성
//URL 매핑 => MemoEditForm
@WebServlet("/MemoEditForm")
public class MemoEditFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out=res.getWriter();
		
		//[1] 사용자가 입력한 값 받아오기. //수정과 연결된 값= ?idx=41 req통해서 받아와야함.
		String idxStr=req.getParameter("idx");
		
		//[2]유효성 체크->Redirect MemoList로 이동
		if(idxStr==null||idxStr.trim().isEmpty()) {
			res.sendRedirect("MemoList");
			return;
		}
		int idx=Integer.parseInt(idxStr.trim()); //idxStr을 idx인덱스로 보내줘야함.
		//[3] 1번에서 받은 값을 MemoVO객체 생성하고 담아주기(import memo.model.MemoVO해야함.)
		MemoDAO dao=new MemoDAO();
		

		
		//[4]MemoDAO의 selectMemo(idx)호출 ==>MemoVO받아서 req에 저장, 키값 "memo"(import memo.model.MemoDAO해야함. SQLException 잡아줘야함.)

		try {
			MemoVO memo=dao.selectMemo(idx); //idx로 선택된 메모를.
			req.setAttribute("memo", memo); //name"memo"키값, memo밸류값
			//[4]foward로 edit.jsp로 이동 시킨다.
			String viewPage="memo/edit.jsp";
			//forward이동해보자. //import javax.servlet.RequestDispatcher 임포트해야함.
			RequestDispatcher disp=req.getRequestDispatcher(viewPage); //위 링크로 이동할 준비.
			disp.forward(req, res);//forward이동(내부적) 할 때 req,res를 가지고 간다.
		} catch (SQLException e) {
			e.printStackTrace();
			out.println("error: "+e.getMessage()+"<br>");
		}
		out.close();
		



//[5]edit.jsp에서는 req에서 저장된 "memo"를 꺼내서 형변환 한다. out.println(memo)
	}

}
