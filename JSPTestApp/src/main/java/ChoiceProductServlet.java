

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.Product;

/**
 * Servlet implementation class ChoiceProductServlet
 */
public class ChoiceProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChoiceProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Product> list = new ArrayList<Product>();
		
		//get requried params for query from request
		String prodName = request.getParameter("name");
		String prodBrand = request.getParameter("brand");
		String prodColor = request.getParameter("color");
		double minPrice = Double.parseDouble(request.getParameter("minPrice"));
		double maxPrice = Double.parseDouble(request.getParameter("maxPrice"));
		
		//create DB_mAnager object and get from it list of product objects
		try {
			DB_Manager manager = new DB_Manager();
			list = manager.getProducts(prodName, prodBrand, prodColor, minPrice, maxPrice);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(list.size());
		request.getSession().setAttribute("productList", list);
		response.getWriter().println("http://localhost:8080/JSPTestApp/showProductsPage.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
