<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Employee Details</title>
    <style>
#customers {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #04AA6D;
  color: white;
}
</style>
</head>
</head>
<body>
<center>
    <h1>EMPLOYEE DETAILS DELETED</h1>
    <%
        String empID = request.getParameter("empID");
        String empName = request.getParameter("empName");
        
        Connection con = null;
        PreparedStatement ps = null;
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/car", "root", "12345");
            String sql = "delete from car1 where ID=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, empID);
           
            int rowsInserted = ps.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
            out.println("<p>Error deleting employee details: " + e.getMessage() + "</p>");
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                out.println("<p>Error closing database resources: " + e.getMessage() + "</p>");
            }
        }
        
    %>
    <table border="1" id="customers">
        <tr>
            <th>Employee ID</th>
            <th>Employee Name</th>
            <th>Age</th>
            <th>Gender</th>
            <th>Job Role</th>
            <th>Salary</th>
        </tr>
        <%
            Connection con1 = null;
            Statement stmt = null;
            ResultSet rs = null;
            
            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/car", "root", "12345");
                stmt = con.createStatement();
                String sql = "SELECT * FROM car1";
                rs = stmt.executeQuery(sql);
                
                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td>" + rs.getString("ID") + "</td>");
                    out.println("<td>" + rs.getString("Name") + "</td>");
                    out.println("<td>" + rs.getInt("Age") + "</td>");
                    out.println("<td>" + rs.getString("Gender") + "</td>");
                    out.println("<td>" + rs.getString("Department") + "</td>");
                    out.println("<td>" + rs.getDouble("Salary") + "</td>");
                    out.println("</tr>");
                }
            } catch (ClassNotFoundException | SQLException e) {
                out.println("<p>Error retrieving employee details: " + e.getMessage() + "</p>");
            } finally {
                try {
                    if (rs != null) {
                        rs.close();
                    }
                    if (stmt != null) {
                        stmt.close();
                    }
                    if (con != null) {
                        con.close();
                    }
                } catch (SQLException e) {
                    out.println("<p>Error closing database resources: " + e.getMessage() + "</p>");
                }
            }
        %>
    </table>
    </center>
</body>
</body>
</html>



