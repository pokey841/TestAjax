package com.alchbg;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controlj.green.addonsupport.access.ActionExecutionException;
import com.controlj.green.addonsupport.access.DirectAccess;
import com.controlj.green.addonsupport.access.FieldAccessFactory;
import com.controlj.green.addonsupport.access.Location;
import com.controlj.green.addonsupport.access.ReadAction;
import com.controlj.green.addonsupport.access.SystemAccess;
import com.controlj.green.addonsupport.access.SystemConnection;
import com.controlj.green.addonsupport.access.SystemException;
import com.controlj.green.addonsupport.access.SystemTree;
import com.controlj.green.addonsupport.access.aspect.PresentValue;
import com.controlj.green.addonsupport.access.value.FloatValue;

/**
 * Servlet implementation class TestServlet
 */
//@WebServlet("/TestServlet")
public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestServlet() {
        super();
       
    }
    final SystemConnection connection = DirectAccess.getDirectAccess().getRootSystemConnection();
	
	// hard-coded GQL path to the point we want to read
	//final String gqlPath = "#iai_electric_meter/inst_demand";
	final String gqlPath ="#oat_1/enthalpy";
	
	// declare float value to hold the point value from WebCTRL
	float wcValue;
    // TODO Auto-generated constructor stub

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String serverDate = new java.util.Date().toLocaleString();
		

	    
	    
try {
    		
			connection.runReadAction( FieldAccessFactory.newFieldAccess(), new ReadAction()
			{
			   public void execute(SystemAccess access) throws Exception
			   {
			       // tell WebCTRL where to look for this point
				   Location loc = access.getTree(SystemTree.Geographic).getRoot().getDescendant(gqlPath);
				   
				   // get the present value & cast it as a float
				   PresentValue pv = (PresentValue)loc.getAspect(PresentValue.class);
				   FloatValue valueObj = (FloatValue) pv.getValue();
				   wcValue = (float) valueObj.getValue();
				   
			   }
			} );
			
		} catch (ActionExecutionException e) {
			//System.out.println("Action Execution Exception caught while trying to read from WC.");
			e.printStackTrace();
			
		} catch (SystemException e) {
			//System.out.println("System Exception caught while trying to read from WC.");
			e.printStackTrace();
			
		}
		
		// write the value of the WebCTRL point to the browser response
		//pw.println(wcValue);
				
		// close the printwriter
		//pw.close();
	    
		response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
	    response.setCharacterEncoding("UTF-8"); // You want world domination, huh?
	    response.getWriter().print(wcValue);       // Write response body.
	    
	    
	    
	    
	    
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
