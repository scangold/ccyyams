$(function () {
	 var bh = $(window).height();
	 $("#mapContainer").css({ height: bh+ "px"});
	    //伸缩框展示效果
	    $("#rc_hide").click(function () {
	    	hideTab();
	    })
	    $("#rc_show").click(function () {
	    	showTab();

	    })
})
$(window).resize(function () {
			var bh = $(window).height();
			 $("#mapContainer").css({ height: bh+ "px"});
		});

function reSize(bh){
	$("#mapContainer").css({ height: bh+ "px"});
}
//realTime或者history
function showTab(type){
	 $("#rc_show").css("display", "none");
     $("#rc_hide").css("display", "block");
     $("#div_rightshow").show(100);
     $("#rc_hide").css("left", "360px");
     $("#div_searchResult").css("right", "1px");
     if(type=="history"){
    	 $('#myTab a:last').tab('show');
     }
     else if(type=="realTime"){
    	 $('#myTab a:first').tab('show');
     }
}
function hideTab(){
	$("#rc_hide").css("display", "none");
    $("#rc_show").css("display", "block");
    $("#div_rightshow").hide(100);
    $("#div_searchResult").css("right", "20px");
}
