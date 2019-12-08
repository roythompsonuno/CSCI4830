package Manager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.jsp.JspWriter;

import Database.*;

public class User {

	private int userID, roleID, groupID;
	private String password, fName, lName, phone, email, rName, gName;
	
	public boolean CheckLogin(String userID, String pass)
	{
		Connection connect = null;
		PreparedStatement prepStatement = null;
		boolean found = false;
		
		try
		{
			DatabaseConnection.getDBConnection();
			connect = DatabaseConnection.connection;
			
			String selectSQL = "SELECT * FROM User Where User.User_ID LIKE ?";
			prepStatement = connect.prepareStatement(selectSQL);
			prepStatement.setString(1, userID);
			ResultSet results = prepStatement.executeQuery();
			if(results.next())
			{
				if(results.getString("Password").equals(pass))
				{
					found = true;
				}
			}
			
			if(found)
			{
				getProfileData(userID);
			}
			
			results.close();
	        prepStatement.close();
	        connect.close();
		}
		catch (SQLException se) 
		{
			se.printStackTrace();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		} 
		finally 
		{
			try 
			{
				if (prepStatement != null)
					prepStatement.close();
			} 
			catch (SQLException se2) {}
			
			try 
			{
				if (connect != null)
					connect.close();
			} 
			catch (SQLException se) 
			{
				se.printStackTrace();
			}
		}
		
		return found;
	}
	
	public void getProfileData(String id)
	{
		Connection connect = null;
		PreparedStatement prepStatement = null;
		
		try
		{
			DatabaseConnection.getDBConnection();
			connect = DatabaseConnection.connection;
			
			String selectSQL = "SELECT a.User_ID, a.Password, a.First_Name, a.Last_Name, a.Phone_Number, " +
								"a.Email_Address, a.Role_ID, b.Role_Name, b.Group_ID, c.Group_Name " +
								"FROM User a INNER JOIN Role b ON a.Role_ID = b.Role_ID " +
								"INNER JOIN User_Group c ON b.Group_ID = c.Group_ID " +
								"WHERE a.User_ID LIKE ?";
			prepStatement = connect.prepareStatement(selectSQL);
			prepStatement.setString(1, id);
			ResultSet results = prepStatement.executeQuery();
			if(results.next())
			{
				this.setUserID(results.getInt("User_ID"));
				this.setPassword(results.getString("Password"));
				this.setfName(results.getString("First_Name"));
				this.setlName(results.getString("Last_Name"));
				this.setPhone(results.getString("Phone_Number"));
				this.setEmail(results.getString("Email_Address"));
				this.setRoleID(results.getInt("Role_ID"));
				this.setrName(results.getString("Role_Name"));
				this.setGroupID(results.getInt("Group_ID"));
				this.setgName(results.getString("Group_Name"));
			}
			
			results.close();
	        prepStatement.close();
	        connect.close();
		}
		catch (SQLException se) 
		{
			se.printStackTrace();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		} 
		finally 
		{
			try 
			{
				if (prepStatement != null)
					prepStatement.close();
			} 
			catch (SQLException se2) {}
			
			try 
			{
				if (connect != null)
					connect.close();
			} 
			catch (SQLException se) 
			{
				se.printStackTrace();
			}
		}
	}
	
	public void updatePassword(String newPass)
	{
		Connection connect = null;
		PreparedStatement prepStatement = null;
		
		try
		{
			DatabaseConnection.getDBConnection();
			connect = DatabaseConnection.connection;
			
			String updateSQL = "UPDATE User SET Password = ? WHERE User_ID = ?";
			prepStatement = connect.prepareStatement(updateSQL);
			prepStatement.setString(1, newPass);
			prepStatement.setString(2, Integer.toString(this.userID));
			prepStatement.executeUpdate();
			
	        prepStatement.close();
	        connect.close();
		}
		catch (SQLException se) 
		{
			se.printStackTrace();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		} 
		finally 
		{
			try 
			{
				if (prepStatement != null)
					prepStatement.close();
			} 
			catch (SQLException se2) {}
			
			try 
			{
				if (connect != null)
					connect.close();
			} 
			catch (SQLException se) 
			{
				se.printStackTrace();
			}
		}
		this.password = newPass;
	}
	
	public void getMyTicket(JspWriter out, String id)
	{
		Connection connect = null;
		PreparedStatement prepStatement = null;
		
		
		try
		{
			DatabaseConnection.getDBConnection();
			connect = DatabaseConnection.connection;
			
			String selectSQL = "SELECT a.Ticket_Number, b.Impact_Name, a.Summary, c.Status_Name FROM Ticket a " +
							"INNER JOIN Impact b ON a.Impact_ID = b.Impact_ID " +
							"INNER JOIN Status c ON a.Status_ID = c.Status_ID " +
							"WHERE " + id + " LIKE ?;";
			prepStatement = connect.prepareStatement(selectSQL);
			prepStatement.setString(1, Integer.toString(this.userID));
			ResultSet results = prepStatement.executeQuery();
			
			while(results.next())
			{
				
				out.print("<tr><td class=\"data\">"+ results.getInt("Ticket_Number") +
						"</td><td class=\"data\">" + results.getString("Impact_Name") +
						"</td><td class=\"data\">" + results.getString("Summary") +
						"</td><td class=\"data\">" + results.getString("Status_Name") + "</td>");
				if(isSupport())
				{
					out.print("<td class=\"data\"><form action=\"EditTicketE.jsp\" method=\"post\">" +
							"<button name=\"edit\" type=\"submit\" value=\""+ results.getInt("Ticket_Number") +"\">Edit</button>" +
							"</form></td>");
				}
				
				out.print("</tr>");
			}
			
			results.close();
	        prepStatement.close();
	        connect.close();
		}
		catch (SQLException se) 
		{
			se.printStackTrace();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		} 
		finally 
		{
			try 
			{
				if (prepStatement != null)
					prepStatement.close();
			} 
			catch (SQLException se2) {}
			
			try 
			{
				if (connect != null)
					connect.close();
			} 
			catch (SQLException se) 
			{
				se.printStackTrace();
			}
		}
	}
	
	public void getNoTicket(JspWriter out, String id)
	{
		Connection connect = null;
		PreparedStatement prepStatement = null;
		
		
		try
		{
			DatabaseConnection.getDBConnection();
			connect = DatabaseConnection.connection;
			
			String selectSQL = "SELECT a.Ticket_Number, b.Impact_Name, a.Summary, c.Status_Name FROM Ticket a " +
							"INNER JOIN Impact b ON a.Impact_ID = b.Impact_ID " +
							"INNER JOIN Status c ON a.Status_ID = c.Status_ID " +
							"WHERE " + id + " IS NULL;";
			prepStatement = connect.prepareStatement(selectSQL);
			ResultSet results = prepStatement.executeQuery();
			
			while(results.next())
			{
				
				out.print("<tr><td class=\"data\">"+ results.getInt("Ticket_Number") +
						"</td><td class=\"data\">" + results.getString("Impact_Name") +
						"</td><td class=\"data\">" + results.getString("Summary") +
						"</td><td class=\"data\">" + results.getString("Status_Name") + "</td>");
				if(isSupport())
				{
					out.print("<td class=\"data\"><form action=\"EditTicketE.jsp\" method=\"post\">" +
							"<button name=\"edit\" type=\"submit\" value=\""+ results.getInt("Ticket_Number") +"\">Edit</button>" +
							"</form></td>");
				}
				
				out.print("</tr>");
			}
			
			results.close();
	        prepStatement.close();
	        connect.close();
		}
		catch (SQLException se) 
		{
			se.printStackTrace();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		} 
		finally 
		{
			try 
			{
				if (prepStatement != null)
					prepStatement.close();
			} 
			catch (SQLException se2) {}
			
			try 
			{
				if (connect != null)
					connect.close();
			} 
			catch (SQLException se) 
			{
				se.printStackTrace();
			}
		}
	}
	
	public boolean isAdmin()
	{
		if(this.groupID == 3)
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	
	public boolean isSupport()
	{
		if(this.groupID > 1)
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	
	public void getUserList(JspWriter out)
	{
		Connection connect = null;
		PreparedStatement prepStatement = null;
		
		try
		{
			DatabaseConnection.getDBConnection();
			connect = DatabaseConnection.connection;
			
			String selectSQL = "SELECT a.*, b.Role_Name, c.Group_Name FROM User a " +
							"INNER JOIN Role b ON a.Role_ID = b.Role_ID " +
							"INNER JOIN User_Group c ON b.Group_ID = c.Group_ID;";
			prepStatement = connect.prepareStatement(selectSQL);
			ResultSet results = prepStatement.executeQuery();
			
			while(results.next())
			{
				out.print("<tr><td class=\"data\">"+ results.getInt("User_ID") +
						"</td><td class=\"data\">" + results.getString("Last_Name") + ", " + results.getString("First_Name") +
						"</td><td class=\"data\">" + results.getString("Role_Name") +
						"</td><td class=\"data\"><form action=\"EditUserE.jsp\" method=\"post\">" +
							"<button name=\"edituser\" type=\"submit\" value=\""+ results.getInt("User_ID") +"\">Edit</button>" +
							"</form></td></tr>");
			}
			
			results.close();
	        prepStatement.close();
	        connect.close();
		}
		catch (SQLException se) 
		{
			se.printStackTrace();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		} 
		finally 
		{
			try 
			{
				if (prepStatement != null)
					prepStatement.close();
			} 
			catch (SQLException se2) {}
			
			try 
			{
				if (connect != null)
					connect.close();
			} 
			catch (SQLException se) 
			{
				se.printStackTrace();
			}
		}
	}
	
	public void getList(JspWriter out, String table, int selected)
	{
		Connection connect = null;
		PreparedStatement prepStatement = null;
		
		try
		{
			DatabaseConnection.getDBConnection();
			connect = DatabaseConnection.connection;
			
			String selectSQL = "Select * FROM " + table + " ;";
			prepStatement = connect.prepareStatement(selectSQL);
			ResultSet results = prepStatement.executeQuery();
			
			while(results.next())
			{
				out.print("<option ");
				if(selected == results.getInt(1))
				{
					out.print("selected ");
				}
				out.print("value=\"" + results.getInt(1) + "\">" + results.getString(2) + "</option>");
			}
			
			results.close();
	        prepStatement.close();
	        connect.close();
		}
		catch (SQLException se) 
		{
			se.printStackTrace();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		} 
		finally 
		{
			try 
			{
				if (prepStatement != null)
					prepStatement.close();
			} 
			catch (SQLException se2) {}
			
			try 
			{
				if (connect != null)
					connect.close();
			} 
			catch (SQLException se) 
			{
				se.printStackTrace();
			}
		}
	}
	
	public void updateUser(String col, String newValue)
	{
		Connection connect = null;
		PreparedStatement prepStatement = null;
		
		try
		{
			DatabaseConnection.getDBConnection();
			connect = DatabaseConnection.connection;
			
			String updateSQL = "UPDATE User SET "+ col +" = ? WHERE User_ID = ?";
			prepStatement = connect.prepareStatement(updateSQL);
			prepStatement.setString(1, newValue);
			prepStatement.setInt(2, this.userID);
			prepStatement.executeUpdate();
			
			System.out.println("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\n" + prepStatement + "\nXXXXXXXXXXXXXXXXXXXXXXXX");
			
	        prepStatement.close();
	        connect.close();
		}
		catch (SQLException se) 
		{
			se.printStackTrace();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		} 
		finally 
		{
			try 
			{
				if (prepStatement != null)
					prepStatement.close();
			} 
			catch (SQLException se2) {}
			
			try 
			{
				if (connect != null)
					connect.close();
			} 
			catch (SQLException se) 
			{
				se.printStackTrace();
			}
		}
	}
	
	public void addNewUser()
	{
		Connection connect = null;
		PreparedStatement prepStatement = null;
		
		try
		{
			DatabaseConnection.getDBConnection();
			connect = DatabaseConnection.connection;
			
			String insertSQL = "INSERT INTO User VALUES (DEFAULT, ?, ?, ?, ?, ?, ?);";
			prepStatement = connect.prepareStatement(insertSQL);
			prepStatement.setString(1, this.password);
			prepStatement.setString(2, this.fName);
			prepStatement.setString(3, this.lName);
			prepStatement.setString(4, this.email);
			prepStatement.setString(5, this.phone);
			prepStatement.setInt(6, this.roleID);
			
			prepStatement.executeUpdate();
			
	        prepStatement.close();
	        connect.close();
		}
		catch (SQLException se) 
		{
			se.printStackTrace();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		} 
		finally 
		{
			try 
			{
				if (prepStatement != null)
					prepStatement.close();
			} 
			catch (SQLException se2) {}
			
			try 
			{
				if (connect != null)
					connect.close();
			} 
			catch (SQLException se) 
			{
				se.printStackTrace();
			}
		}
	}
	
	public void removeUser()
	{
		Connection connect = null;
		PreparedStatement prepStatement = null;
		
		try
		{
			DatabaseConnection.getDBConnection();
			connect = DatabaseConnection.connection;
			
			String insertSQL = "DELETE FROM User WHERE User_ID = ?;";
			prepStatement = connect.prepareStatement(insertSQL);
			prepStatement.setInt(1, this.userID);
			
			prepStatement.executeUpdate();
			
	        prepStatement.close();
	        connect.close();
		}
		catch (SQLException se) 
		{
			se.printStackTrace();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		} 
		finally 
		{
			try 
			{
				if (prepStatement != null)
					prepStatement.close();
			} 
			catch (SQLException se2) {}
			
			try 
			{
				if (connect != null)
					connect.close();
			} 
			catch (SQLException se) 
			{
				se.printStackTrace();
			}
		}
	}
	
	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	
	public String getfName() {
		return fName;
	}

	
	public void setfName(String fName) {
		this.fName = fName;
	}

	public String getlName() {
		return lName;
	}

	public void setlName(String lName) {
		this.lName = lName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getRoleID() {
		return roleID;
	}

	public void setRoleID(int roleID) {
		this.roleID = roleID;
	}

	public String getrName() {
		return rName;
	}

	public void setrName(String rName) {
		this.rName = rName;
	}

	public int getGroupID() {
		return groupID;
	}

	public void setGroupID(int groupID) {
		this.groupID = groupID;
	}

	public String getgName() {
		return gName;
	}

	public void setgName(String gName) {
		this.gName = gName;
	}
	
}
