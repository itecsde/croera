$(document).ready(function() {
	experience_index_init();
});

function experience_index_init(){
	init_masonry('#content_index');
	infinite_scroll_init('#content_index','.extract_box', 'page', 'window');
}

function select_guide(){
	var guide_selected = $("#guides .selected_elements .selection_info").find(".element_id").val();
	var locale= $("#locale").val();
	window.location.href = "/" + locale + "/experiences/new/from_guide/" + guide_selected;
}

function submit_advanced_search(event){
	$("#advanced_search").val(1);
	event.preventDefault(); 
	$("#advanced_search_form").submit();
}
