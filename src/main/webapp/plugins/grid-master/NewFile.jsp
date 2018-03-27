<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<!--jQuery dependencies-->
<link rel="stylesheet"
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/themes/base/jquery-ui.css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/jquery-ui.min.js"></script>
<!--PQ Grid files-->
<link rel="stylesheet" href="pqgrid.min.css" />
<script src="pqgrid.min.js"></script>
<!--PQ Grid Office theme-->
<link rel="stylesheet" href="themes/office/pqgrid.css" />

<script>
 
    	$(function () {        
        var colM = [
                    { title: "Order ID", width: 100, dataIndx: "APPLY_ID" },
                    { title: "Customer Name", width: 130, dataIndx: "CustomerName" },
                    { title: "Product Name", width: 190, dataIndx: "ProductName" },
                    { title: "Unit Price", width: 100, dataIndx: "UnitPrice", align: "right" },
                    { title: "Quantity", width: 100, dataIndx: "Quantity", align: "right" },
        		  
        		];
                var dataModel = {
                    location: "remote",
                    dataType: "JSON",
                    method: "GET",
                    url: "/CCYYAMS/apply/showApplylistPage",
                    //url: "/pro/invoice.php",//for PHP
                    getData: function (dataJSON) {
                        var data = dataJSON.data;
                        return { curPage: dataJSON.curPage, totalRecords: dataJSON.totalRecords, data: data };
                    }
                };

                var grid1 = $("div#grid_paging").pqGrid({
                   
                    url:"/CCYYAMS/apply/showApplylistPage",
                    colModel: colM,
                    freezeCols: 2,
                    pageModel: { type: "remote", rPP: 20, strRpp: "{0}" },
                    sortable: false,
                    selectionModel: { swipe: false },
                    wrap: false, hwrap: false,
                    virtualX:true, virtualY:true,
                    numberCell: { resizable: true, width: 30, title: "#" },
                    title: "Shipping Orders",
                    resizable: true
                });
            });




        
</script>
</head>
<body>
	<div id="grid_array" style="margin: 100px;"></div>
	 <div id="grid_paging" style="margin:5px auto;"></div>
</body>

</html>
