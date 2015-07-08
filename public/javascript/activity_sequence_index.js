$(document).ready(function() {
	activity_sequence_index_init();
});

function activity_sequence_index_init(){
	infinite_scroll_init('#content_index','.extract_box', 'activity_sequences_page', 'window');
}

function my_activity_sequences(){
	jQuery.ajax({
    	url: "activity_sequences/my_activity_sequences",
		type: "GET"
  	});
}

function pick_it(button){
	activity_sequence_id= $(button).attr('name');
	$(button).css('display','none');
	jQuery.ajax({
    	url: "activity_sequences/pick_it",
		type: "GET",
		data: {"activity_sequence_id" : activity_sequence_id}
  	})
}