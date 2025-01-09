<%-- 
    Document   : home.jsp
    Created on : 15 mars 2023, 00:46:08
    Author     : rango
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
    String mainPath = "http://localhost:8080/Boul"; // Peut changer en fonctiion du nom de projet
    String getPath = (String) request.getParameter("page");
    if(getPath == null) getPath = "produit/insertionProduit";
    String theFile = getPath + ".jsp";
%>

<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">  
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link href="<%= mainPath %>/assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%= mainPath %>/assets/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Template Stylesheet -->
    <link href="<%= mainPath %>/assets/css/style.css" rel="stylesheet">
    <title> Home | Boulangerie </title>
</head>

<body>
    <!-- ============================================================== -->
    <!-- main wrapper -->
    <!-- ============================================================== -->
    <div class="container-xxl position-relative bg-white d-flex p-0">
        <!-- ============================================================== -->
        <!-- Header -->
        <!-- ============================================================== -->     
        <%@ include file = "header.jsp" %>
        <!-- ============================================================== -->
        <!-- End header -->
        <!-- ============================================================== -->     
        <%--<%@ include file = "%{getPath}.jsp" %>--%>
        <jsp:include page="<%= theFile %>"/>
        
        <!-- ============================================================== -->
        <!-- footer -->
        <!-- ============================================================== -->          
        
        <!-- ============================================================== -->
        <!-- end footer -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- end wrapper  -->
        <%@ include file = "footer.jsp" %>
        <!-- ============================================================== -->
    </div>
    
    <!-- ============================================================== -->
    <!-- end main wrapper  -->
    <!-- ============================================================== -->
    <!-- Optional JavaScript -->
    <!-- jquery 3.3.1 -->
    <!-- Template Javascript -->
    <script src="<%= mainPath %>/assets/js/jquery/jquery-3.3.1.min.js"></script>
    <script src="<%= mainPath %>/assets/js/bootstrap.bundle.min.js"></script>
    <script src="<%= mainPath %>/assets/js/main.js"></script>
    <script src="<%= mainPath %>/assets/myjs/mystyle.js"></script>
</body>
 
</html>