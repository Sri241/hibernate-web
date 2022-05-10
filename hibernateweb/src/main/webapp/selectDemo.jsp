<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="org.hibernate.*,
                    org.hibernate.cfg.Configuration,
                    com.wipro.velocity.User,
                    java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HQL - Hibernate Query Language</title>
</head>
<body>

<h1>HQL Select Query</h1>
<%
	Configuration cfg = new Configuration();
	cfg.configure("hibernate.cfg.xml");
	SessionFactory factory = cfg.buildSessionFactory();
	Session sess= factory.openSession();
	sess.beginTransaction();
	
	
	
	Query qry=sess.createQuery("from User");
	
	List<User> lst	=(List<User>)qry.list();
	
	out.println("<h3>List of Employees:</h3>"+"<br>");
	for(User st:lst)
	{
		out.println(st.getId()+" "+st.getName()+" "+st.getEmail()+"<br>");
	}
	
	out.println("<br/>");

	 String hql= "select U.name from User U";
	 qry=sess.createQuery(hql);
	 List<String> list1 = qry.getResultList();
	 out.println("List of Names::"+"<br>");
	 for (String st : list1) {
	     out.println(st +"<br>");
	 }
	 out.println("<br/>");
	  
	 qry=sess.createQuery("select count(*) from User");
	 List<Integer> list2 = qry.list();
	 out.println("Total Names::"+"<br>");
	      out.println(list2.get(0) +"<br>");
	  out.println("<br/>");
	  
	 qry=sess.createQuery("from User U where U.id=:id");
	 qry.setInteger("id", 1);
	 List<User> list3 = (List<User>) qry.list();
	 out.println("List of Employees with Criteria::"+"<br>");
	 for (User st : list3) {
	     out.println(st.getId() + ","+ st.getName() + "," + st.getEmail()+"<br>");
	 }
	 sess.getTransaction().commit();
	 sess.close();
	 factory.close();

%>
</body>
</html>