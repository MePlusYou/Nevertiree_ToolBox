import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class QueryUserServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String keyword = request.getParameter("keyword");
		String sPage = request.getParameter("page");
		int page = 1;
		try {
			page =Integer.parseInt(sPage);
		}catch(Exception ex) {}

		UserDAO dao = new UserDAO();
		int totalCount = dao.totalCount(keyword);
		int totalPage = (totalCount%10 > 0)?((totalCount/10)+1):(totalCount/10);

		if(page < 1) page = 1;
		if(page > totalPage) page = totalPage;

		List<UserVO> arr = dao.queryByPage(keyword, page);

		request.setAttribute("ROWS", arr);
		request.getRequestDispatcher("users.jsp")
			.forward(request, response);
	}

}