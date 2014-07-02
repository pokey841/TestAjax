<!DOCTYPE html>
<html lang="en">
    <head>
        <title>SO question 4112686</title>
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script>
        $(document).ready(function() {                       
            function updateDate() {         
               $.get('someservlet', function(responseText) { 
                   $('#somediv').text(responseText);         
               });
            }
       });

            setInterval(updateDate, 10000);
        </script>
    </head>
    <body>
        <div id="somediv"></div>
    </body>
</html>

