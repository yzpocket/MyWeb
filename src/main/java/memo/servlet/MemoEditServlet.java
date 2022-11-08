package memo.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import memo.model.MemoDAO;
import memo.model.MemoVO;


//[0] MemoEditServlet 생성하고 매핑은
//=> url mapping : MemoEdit
@WebServlet("/MemoEdit")
public class MemoEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//기본설정
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out=res.getWriter();
		//이미지나 동영상파일은 아래 사용.
		//ServletOutputStream sos=res.getOutputStream();
		//Post 방식일때 한글 처리가 필요하다.
		req.setCharacterEncoding("UTF-8");
		
		//[1] 사용자가 입력한 값 받아오기(idx, name,msg)
		//html의 form태그를 통해 전송된 파라미터 값(name이다 id가 아니다.)은 req를 이용해서 받는다.	
		String idxStr=req.getParameter("idx");
		String name=req.getParameter("name");
		String msg=req.getParameter("msg");

		//[2] idx, name 의 유효성 체크 => MemoList로 redirect이동
		if(idxStr==null||name==null||idxStr.trim().isEmpty()||name.trim().isEmpty()) {
			res.sendRedirect("MemoList");
			return;
		}
		int idx=Integer.parseInt(idxStr.trim()); //idxStr을 idx인덱스로 보내줘야함.
		//[3] 1번에서 받은 값을 MemoVO객체 생성하고 담아주기(import memo.model.MemoVO해야함.)
		MemoVO vo=new MemoVO(idx, name, msg, null); //idx는 그대로가야되기때문에 인서트할때 0으로nextval 받던거랑 다르다.
		
		//[4] MemoDAO 의 updateMemo(vo)
		MemoDAO dao=new MemoDAO();
		try {
		int n=dao.updateMemo(vo);
		//[5] 그 결과 메시지,
		// 이동경로로 이동 성공=> MemoList로 이동
		//			   실패 => MemoEditForm?idx=글번호
			String str=(n>0)?"글수정 성공":"글 수정 실패";
			String loc=(n>0)?"MemoList":"MemoEditForm?idx="+idx;
			out.println(str);
			//자바스크립트로 경고처리, 이동 
			out.println("<script>");
			out.println("alert('"+str+"')");
			out.println("location.href='"+loc+"'");
			out.println("</script>");	
		}catch(Exception e) {
			e.printStackTrace();
			out.println("error: "+e.getMessage()+"<br>");
		}
		out.close();
	}

}
