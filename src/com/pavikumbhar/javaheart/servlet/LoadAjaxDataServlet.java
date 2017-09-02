package com.pavikumbhar.javaheart.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

/**
 * Servlet implementation class LoadAjaxDataServlet
 */
@WebServlet("/loadAjaxDataServlet")
public class LoadAjaxDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public LoadAjaxDataServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//doProcess(request, response);
		List<Person> personList=new ArrayList<Person>();
		personList.add(new Person("Pavi Kumbhar", "pavikumbhar@mail.com"));
		personList.add(new Person("Kritika", "kritika@mail.com"));
		personList.add(new Person("Mangesh", "mangesh@mail.com"));
		personList.add(new Person("Aditi", "aditi@mail.com"));
		    String json = new Gson().toJson(personList);

		    response.setContentType("application/json");
		    response.setCharacterEncoding("UTF-8");
		    response.getWriter().write(json);
	}
	

	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws IOException {
		StringBuilder result = new StringBuilder();
	
		List<Person> personList=new ArrayList<Person>();
		personList.add(new Person("Pavi Kumbhar", "pavikumbhar@mail.com"));
		personList.add(new Person("Kritika", "kritika@mail.com"));
		personList.add(new Person("Mangesh", "mangesh@mail.com"));
		personList.add(new Person("Aditi", "aditi@mail.com"));
		
  result.append("<div class=\"table-responsive\">")
		.append("<table  class=\"table table-bordered\">")
		.append("<thead>")
		.append("<tr>")
		.append("<th>").append("No").append("</th>")
		.append("<th>").append("Name").append("</th>")
		.append("<th>").append("Email").append("</th>")
		.append("</tr>")
		.append("</thead>")
		.append("<tbody>");
	
     int i=0;
		for (Person person : personList) {
			String cssClass=(i % 2== 0) ? "success": "warning";
			result.append("<tr class=").append(cssClass).append(">")
					.append("<td>").append(++i).append("</td>")
					.append("<td>").append(person.getName()).append("</td>")
					.append("<td>").append(person.getEmail()).append("</td>")
					.append("</tr>");
					
		}
			result.append("</tbody>")
				.append("</table>")
				.append("</div>");
		response.getWriter().write(result.toString());
	//response.getWriter().append("Served at: ").append(request.getContextPath());
		
	}
	

}

class Person{
	
	String name;
	String email;
	public Person(){}
	public Person(String name, String email) {
		super();
		this.name = name;
		this.email = email;
	}
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
}
