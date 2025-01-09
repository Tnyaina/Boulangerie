<%-- 
    Document   : tableau
    Created on : 26 déc. 2024, 19:28:16
    Author     : aram
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="col-lg-12 col-sm-12 col-md-12 col-xl-12 mt-5 mx-auto ml-auto">
    <div class="h-100 bg-light rounded p-4">
        <div class="d-flex flex-row justify-content-between mb-4">    
            <h6 class="mb-0"> Liste Employe </h6>
        </div>
       
        <div style="width: 100%">
            <table border="1" class="table table-lg table-bordered">
                <thead>
                    <tr>
                        <th> Nom </th>
                        <th>  </th>
                        <th> Client </th>
                        <th> Montant </th>
                        <th> Status </th>
                        <th>  </th>
                    </tr>
                </thead>
                <tbody>
                    
                    <tr>
                        <th> 10-10-10 </th>
                        <th> Facture 1 </th>
                        <th> Client 1 </th>
                        <th> Ar 10 000 </th>
                        <th>Non paye </th>
                        <td class="text-center">
                            <a href="home.jsp?page=detail_employe&&id=data">
                                <i class="fa fa-eye me-2"> </i>
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <th> 10-10-10 </th>
                        <th> Facture 1 </th>
                        <th> Client 1 </th>
                        <th> Ar 10 000 </th>
                        <th>Non paye </th>
                        <td class="text-center">
                            <a href="home.jsp?page=detail_employe&&id=data">
                                <i class="fa fa-eye me-2"> </i>
                            </a>
                        </td>
                    </tr>
                  
                </tbody>
            </table>
        </div>
    </div>
</div>