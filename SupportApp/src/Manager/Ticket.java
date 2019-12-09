package Manager;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.jsp.JspWriter;

import Database.DatabaseConnection;

public class Ticket 
{
	private int ticketID, userID, assignee, impactID, catID, statID;
	private Date submitDate;
	private String solution, description, impact, category, status;
	
	
	public void getTicket(String id)
	{
		Connection connect = null;
		PreparedStatement prepStatement = null;
		
		try
		{
			DatabaseConnection.getDBConnection();
			connect = DatabaseConnection.connection;
			
			String selectSQL = "SELECT a.*, b.Impact_Name, c.Category_Name, d.Status_Name FROM Ticket a " +
							"INNER JOIN Impact b ON a.Impact_ID = b.Impact_ID " +
							"INNER JOIN Category c ON a.Category_ID = c.Category_ID " +
							"INNER JOIN Status d ON a.Status_ID = d.Status_ID " +
							"Where Ticket_Number LIKE ?";
			prepStatement = connect.prepareStatement(selectSQL);
			prepStatement.setString(1, id);
			ResultSet results = prepStatement.executeQuery();
			results.next();
			
			this.ticketID = results.getInt("Ticket_Number");
			this.userID = results.getInt("User_ID");
			this.assignee = results.getInt("Assignee");
			this.impactID = results.getInt("Impact_ID");
			this.catID = results.getInt("Category_ID");
			this.statID = results.getInt("Status_ID");
			this.submitDate = results.getDate("Submit_Date");
			this.solution = results.getString("Solution");
			this.description = results.getString("Description");
			this.impact = results.getString("Impact_Name");
			this.category = results.getString("Category_Name");
			this.status = results.getString("Status_Name");
			
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

	public void getList(JspWriter out, String table, String selected)
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
				if(selected.equals(results.getString(2)))
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
	
	public void getListUser(JspWriter out, String table, int selected)
	{
		Connection connect = null;
		PreparedStatement prepStatement = null;
		
		try
		{
			DatabaseConnection.getDBConnection();
			connect = DatabaseConnection.connection;
			int role = 0;
			int user = 0;
			
			String selectSQL = "Select * FROM User;";
			prepStatement = connect.prepareStatement(selectSQL);
			ResultSet results = prepStatement.executeQuery();
			
			while(results.next())
			{
				user = results.getInt("User_ID");
				role = results.getInt("Role_ID");
				
				if(role > 1)
				{
					out.print("<option ");
					if(selected == user)
					{
						out.print("selected ");
					}
					out.print("value=\"" + results.getInt("User_ID") + "\">" + results.getString("Last_Name") + ", " + results.getString("First_Name") + "</option>");
				}
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
	
	public String getUserName(int choice)
	{
		Connection connect = null;
		PreparedStatement prepStatement = null;
		String name = null;
		
		try
		{
			DatabaseConnection.getDBConnection();
			connect = DatabaseConnection.connection;
			
			String selectSQL = "Select First_Name, Last_Name FROM User WHERE User_ID LIKE " + this.userID;
			prepStatement = connect.prepareStatement(selectSQL);
			ResultSet results = prepStatement.executeQuery();
			
			results.next();		
			if( choice == 1)
				name = results.getString(1);
			else
				name = results.getString(2);
			
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
		
		return name;
	}
	
	public void getMyLog(JspWriter out)
	{
		Connection connect = null;
		PreparedStatement prepStatement = null;
		
		try
		{
			DatabaseConnection.getDBConnection();
			connect = DatabaseConnection.connection;
			
			String selectSQL = "SELECT a.*, b.Action_Name FROM Log a " +
							"INNER JOIN Action b ON a.Action_ID = b.Action_ID " +
							"WHERE Ticket_Number LIKE "+ this.ticketID +";";
			prepStatement = connect.prepareStatement(selectSQL);
			ResultSet results = prepStatement.executeQuery();
			
			while(results.next())
			{
				
				out.print("<tr><td class=\"data\">"+ results.getDate("Log_Date") +
						"</td><td class=\"data\">" + results.getString("Action_Name") + "</td></tr>");
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
	
	public void updateTicket(String col, String newValue)
	{
		Connection connect = null;
		PreparedStatement prepStatement = null;
		
		try
		{
			DatabaseConnection.getDBConnection();
			connect = DatabaseConnection.connection;
			
			String updateSQL = "UPDATE Ticket SET "+ col +" = ? WHERE Ticket_Number = ?";
			prepStatement = connect.prepareStatement(updateSQL);
			prepStatement.setString(1, newValue);
			prepStatement.setInt(2, this.ticketID);
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
	
	public void addLog(int actID)
	{
		Connection connect = null;
		PreparedStatement prepStatement = null;
		
		try
		{
			DatabaseConnection.getDBConnection();
			connect = DatabaseConnection.connection;
			
			String updateSQL = "INSERT INTO Log VALUES (DEFAULT, NOW(), ?, ?);";
			prepStatement = connect.prepareStatement(updateSQL);
			prepStatement.setInt(1, actID);
			prepStatement.setInt(2, this.ticketID);
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
	
	public int getLastTicketNumber()
	{
		Connection connect = null;
		PreparedStatement prepStatement = null;
		int nextNum = 0;
		try
		{
			DatabaseConnection.getDBConnection();
			connect = DatabaseConnection.connection;
			
			String selectSQL = "Select * FROM Ticket;";
			prepStatement = connect.prepareStatement(selectSQL);
			ResultSet results = prepStatement.executeQuery();
			
			results.last();
			nextNum = results.getInt(1) + 1;
			
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
		
		return nextNum;
	}
	
	public void addNewTicket()
	{
		Connection connect = null;
		PreparedStatement prepStatement = null;
		
		try
		{
			DatabaseConnection.getDBConnection();
			connect = DatabaseConnection.connection;
			
			String insertSQL = "INSERT INTO Ticket VALUES (DEFAULT, NOW(), ?, ?, ?, ?, 1, ?, NULL);";
			prepStatement = connect.prepareStatement(insertSQL);
			prepStatement.setString(1, this.solution);
			prepStatement.setString(2, this.description);
			prepStatement.setInt(3, this.impactID);
			prepStatement.setInt(4, this.catID);
			prepStatement.setInt(5, this.userID);
			
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
	
	public int getTicketID() {
		return ticketID;
	}

	public void setTicketID(int ticketID) {
		this.ticketID = ticketID;
	}


	public int getUserID() {
		return userID;
	}


	public void setUserID(int userID) {
		this.userID = userID;
	}


	public int getAssignee() {
		return assignee;
	}


	public void setAssignee(int assignee) {
		this.assignee = assignee;
	}


	public Date getSubmitDate() {
		return submitDate;
	}


	public void setSubmitDate(Date submitDate) {
		this.submitDate = submitDate;
	}

	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}

	public String getSolution() {
		return solution;
	}


	public void setSolution(String solution) {
		this.solution = solution;
	}

	public String getImpact() {
		return impact;
	}


	public void setImpact(String impact) {
		this.impact = impact;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}

	public int getImpactID() {
		return impactID;
	}

	public void setImpactID(int impactID) {
		this.impactID = impactID;
	}

	public int getCatID() {
		return catID;
	}

	public void setCatID(int catID) {
		this.catID = catID;
	}

	public int getStatID() {
		return statID;
	}

	public void setStatID(int statID) {
		this.statID = statID;
	}
}
