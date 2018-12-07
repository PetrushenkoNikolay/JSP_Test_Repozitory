

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.omg.CosNaming.NamingContextExtPackage.AddressHelper;

/**
 * Servlet implementation class UploadServlet
 */
@MultipartConfig
public class UploadServlet extends HttpServlet {
	private final String SAVE_DIR = "uploadFiles";
	private int ind;//variable, that means last inserted ID in DB, used in saving image name
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
    public UploadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//fetch product properties from request
		String descr = request.getParameter("description");
		String col = request.getParameter("color");
		String name = request.getParameter("name");
		String brand = request.getParameter("brand");
		System.out.println(request.getParameter("price"));
		double price = Double.parseDouble(request.getParameter("price"));
		
		//create product object for dispatching in DBManager
		Product product = new Product(descr, col, brand, name, price);
		
		//create dbmanager and forward product object in for insertion in DB
		try {
			DB_Manager manager = new DB_Manager();
			ind = manager.insertProduct(product);//insert prod and get last index of entry
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//retriev image from request and save it
		String appPath = request.getServletContext().getRealPath("");
		String savePath = appPath+File.separator+SAVE_DIR;
		File saveDir = new File(savePath);
		if (!saveDir.exists()) {
			saveDir.mkdirs();
		}
		for (Part part : request.getParts()) {
			String fileName = extractFileName(part);
			//fileName = new File(fileName).getName();
			if(fileName!=null&&!fileName.equals(""))
			part.write(savePath+File.separator+ind+fileName.substring(fileName.indexOf(".")));
		}
	}
	
	//getting file name method
	private String extractFileName (Part part) {
		String contentDisp = part.getHeader("content-disposition");
		//System.out.println(contentDisp);
		String[] items = contentDisp.split(";");
		for (String s : items) {
			//System.out.println(s);
			if (s.trim().startsWith("filename")) {
				return s.substring(s.indexOf("=")+2, s.length()-1);
			}
		}
		return "";
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
