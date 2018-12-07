import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import product.Product;

public class DB_Manager {
	private final String user = "root";
	private final String password = "root";
	private final String driver = "com.mysql.jdbc.Driver";
	private final String url = "jdbc:mysql://localhost:3306/";
	private final String dbName = "my_db";
	ArrayList<Product> list;
	
	public DB_Manager() throws Exception {
		super();
		Class.forName(driver);
	}

	//Method for upload product data in DB
	public int insertProduct (Product prod) throws Exception {
		int id = 0;//id of last entry
		//get values of fields from Product object
		String prodName = prod.getName();
		String prodBrand = prod.getBrand();
		String prodColor = prod.getColor();
		String prodDecription = prod.getDescription();
		Double prodPrice = prod.getPrice();
		
		//get connection with DB, insert the data
		try (Connection con =  DriverManager.getConnection(url+dbName+"?useSSL=false", user, password);
			 PreparedStatement pstm = con.prepareStatement("INSERT INTO products (name, brand, color, description, price) VALUES (?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
			 Statement stm = con.createStatement();) {
	         pstm.setString(1, prodName);
			 pstm.setString(2, prodBrand);
			 pstm.setString(3, prodColor);
			 pstm.setString(4, prodDecription);
			 pstm.setDouble(5, prodPrice);
			 pstm.executeUpdate();
			 ResultSet rs = pstm.getGeneratedKeys();
			 while (rs.next()) {
				 id = rs.getInt(1);
			 }
			 System.out.println("Insert is executed, last index is "+id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return id;
	}
	
	public ArrayList<Product> getProducts (String prodName, String prodBrand, String prodColor, double minPrice, double maxPrice) throws Exception {
		list = new ArrayList<Product>();
		try (Connection con = DriverManager.getConnection(url+dbName+"?useSSL=false", user, password);
			 PreparedStatement pstm = con.prepareStatement("SELECT*FROM products WHERE name=?")) {
			pstm.setString(1, prodName);
			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				Product prod = new Product();
				prod.setId(rs.getInt(1));
				prod.setName(rs.getString(2));
				prod.setBrand(rs.getString(3));
				prod.setColor(rs.getString(4));
				prod.setDescription(rs.getString(5));
				prod.setPrice(rs.getDouble(6));
				list.add(prod);
			}
		}
		return list;
	}
}
