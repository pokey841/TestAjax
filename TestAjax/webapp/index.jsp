<html>
<head>
<style type="text/css">
        body     { background-color:black; color:#A8A8A8; font-family:verdana, sans-serif; }
      
</style>

<script src="js/jquery-1.11.1.min.js"></script>

<script type="text/javascript">
//code.jquery.com/jquery-1.11.0.min.js"
//http://jquery-howto.blogspot.com/2009/04/ajax-update-content-every-x-seconds.html?m=1
//http://jquery-howto.blogspot.com/2013/02/referenceerror-jquery-is-not-defined.html
//  <div id="score" style="font-family: verdana; font-size: 20px;"></div>
	 var numReturned;
	 var selBarGraph;
     var auto = setInterval(    function ()
     {   	 
    	 //$.get('servlet/someservlet', function(responseText) {$('#score').text(responseText);});
         
         //alert(numReturned);
         //http://www.w3schools.com/Jquery/ajax_get.asp
         //
         // $.get('servlet/someservlet', function(data)
         // 	  {alert("Data: " + data);});
         
          $.get('servlet/someservlet', function(data)
        		  {
        	  			numReturned = data;
        	  			if (numReturned < 20) {
        	  				selBarGraph = "bar10_yellow.png";
        	  			} else if (numReturned < 21) {
        	  				selBarGraph = "bar20_yellow.png";
        	  			} else if (numReturned < 22) {
        	  				selBarGraph = "bar30_yellow.png";
        	  			} else if (numReturned < 23) {
        	  				selBarGraph = "bar40_yellow.png";
        	  			} else if (numReturned <24)  {
        	  				selBarGraph = "bar40_yellow.png";
        	  			} else if (numReturned <24)  {
        	  				selBarGraph = "bar40_yellow.png";
        	  			} else if (numReturned <25)  {
        	  				selBarGraph = "bar50_yellow.png";
        	  			} else if (numReturned <26)  {
        	  				selBarGraph = "bar60_yellow.png";
        	  			} else if (numReturned <27)  {
        	  				selBarGraph = "bar70_yellow.png";
        	  			} else if (numReturned <28)  {
        	  				selBarGraph = "bar80_yellow.png";
        	  			} else if (numReturned <29)  {
        	  				selBarGraph = "bar90_yellow.png";
        	  			} else {
        	  				selBarGraph = "bar100_yellow.png";
        	  			}
        	  			
        	  			$('#score').text(numReturned + " BTU/lb");
        	  			//http://stackoverflow.com/questions/554273/changing-the-image-source-using-jquery
        	  			$("#IMG").attr("src","images/" + selBarGraph);
        	  			
        	  			//alert(numReturned + " " + selBarGraph);
        	  			//$('#graph').Image("images/bar20_yellow.png");
        		   }
          
               );
    	     
     }, 10000); // refresh every 5000 milliseconds
</script>
</head>
 
<body>
<center>
<br><br>
Current Outdoor Air Enthalpy
<br>
<div id="graph"></div>
<img src="images/bar0.png" id="IMG">
<br>
 <div id="score"></div>

 

</center>
</body>
</html>