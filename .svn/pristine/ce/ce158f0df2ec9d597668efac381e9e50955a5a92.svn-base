$(document).ready(function() {
	artworks_index_init();
});

function artworks_index_init(){
	
}


function toogle_enriched_advanced_search (event){
	event.preventDefault(); 
	$("#enriched_button").toggleClass('active');
	if (!$("#enriched_button").hasClass('active')){
		$("#enriched_button").text('Enriched Off');
		$("input[name='enriched']").val(0);
	}
	else {
		$("#enriched_button").text('Enriched On');
		$("input[name='enriched']").val(1);
	}
}

function submit_advanced_search(event){
	$("#advanced_search").val(1);
	event.preventDefault(); 
	$("#advanced_search_form").submit();
}
