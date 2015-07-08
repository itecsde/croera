$(document).ready(function() {
	scenario_index_init();
});

function scenario_index_init(){
	infinite_scroll_init('#content_index','.extract_box', 'page', 'window');
	
	
	
}

function submit_advanced_search(event){
	$("#advanced_search").val(1);
	event.preventDefault(); 
	$("#advanced_search_form").submit();
}

