$(document).ready(function() {
	activity_index_init();
});

function activity_index_init(){
	$(".new_activity_box").colorbox({inline:true, width:"70%", height: "90%"});
	
	$("#tag_filter").change(function(){
		if($("#tag_filter").val() != "no"){
			window.open('/<%=I18n.locale%>/activities/filter/'+$("#tag_filter").val(),'_self');
		}
	});
	
	$("#interaction_filter").change(function(){
		if($("#interaction_filter").val() != "no"){
			window.open('/<%=I18n.locale%>/activities/interaction_filter/'+$("#interaction_filter").val(),'_self');
		}
	});
	
	$(".select_template").on('click', function(){select_template($(this).attr('name'));});
	
	$("textarea").autosize();
	
	infinite_scroll_init('#content_index','.extract_box', 'activities_page', 'window');
	
	$('#search').bind('ajax:success', function(){
  		//alert("Success!");
  		$('#content_index').html(my_activity_list);
  		content_width= $("#content_index").width();
		extrac_box_width= content_width * 0.308;
		$("#content_index .extract_box").css('width',extrac_box_width);
  		$('#content_index').masonry('reload');
  		$(".new_activity_box").colorbox({inline:true, width:"70%", height: "90%"});
	});
	
	
}

function my_activities(){
	jQuery.ajax({
    	url: "activities/my_activities",
		type: "GET"
  	});
}


function pick_it(button){
	activity_id= $(button).attr('name');
	$(button).css('display','none');
	jQuery.ajax({
    	url: "activities/pick_it",
		type: "GET",
		data: {"activity_id" : activity_id}
  	}).done(function(result){
  		
  	});
}


function submit_advanced_search(event){
	$("#advanced_search").val(1);
	event.preventDefault(); 
	$("#advanced_search_form").submit();
}
