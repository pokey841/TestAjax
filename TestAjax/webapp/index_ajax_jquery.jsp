<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ajax Example</title>
</head>
<body>
<script type="text/javascript">
function drawDataTable(){
 $.ajax({
      url : "someservlet",
      dataType : 'json',
      error : function(){
      alert("Error Occured");
      },
      success : function(data) {
      //here you will get your data from servlet
      //set data to your table  
      }     
    });
}

setInterval(drawDataTable, 10000);

<script>
</body>
</html>



