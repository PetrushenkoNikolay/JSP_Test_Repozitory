import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DB_Manager {
	void doInsert () {
		try (Connection con = DriverManager.getConnection("");
			 PreparedStatement stm = con.prepareStatement("");) {
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
