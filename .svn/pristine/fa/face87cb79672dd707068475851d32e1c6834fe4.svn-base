$(document).ready(function() 
{
	event_form_init();
});

function event_form_init()
{
	/*check_edition_mode(".event_container");*/	
	confirmation_needed = true;		
	var latitude= $("#event_latitude").val();
	var longitude= $("#event_longitude").val();
   	initialize_map(latitude, longitude);
   	
   	if ($("#is_edition").attr("data-value")=="true"){
   		$(".event_description textarea").autosize();
		$(".event_name textarea").autosize();
   		init_sliders_range();
	   	$( "#event_start_date" ).datepicker({
			dateFormat: "yy-mm-dd",
			showAnim: "slide"
		});
		$( "#event_end_date" ).datepicker({
			dateFormat: "yy-mm-dd",
			showAnim: "slide"
		});
	}
}

function save_event_form()
{
	$(".event_subjects .subject_item").each(function(index, element){
		$(element).find(".subject").attr('name','event[event_subject_annotations_attributes]['+index+'][subject_id]');		
	});
	
	
	confirmation_needed = false;
	$(".event_form").submit();
}

function add_subject(element)
{
	subject =$('<div class="subject_item">').append($("#snippets_library .subject_item").clone()).html();
	$(".event_subjects .field_body").append(subject);
}

function delete_subject (element){
	$(element).closest(".subject_item").remove();
}


function init_sliders_range(){
	var age_range= $("#age_range").val();
	if (age_range != ""){
		var dash_index = age_range.indexOf("-");
		var age_range_first = parseInt(age_range.substring(0,dash_index-1).trim());
		var age_range_last = parseInt(age_range.substring(dash_index+1, age_range.length).trim());
	}else{
		age_range_first = 0;
		age_range_last = 100;
	}
	$( "#slider-range" ).slider({
		range: true,
		min: 0,
		max: 100,
		values: [ age_range_first, age_range_last ],
		slide: function( event, ui ) {
			$( "#event_age_range" ).val( ui.values[ 0 ] + " - " + ui.values[ 1 ] );
			
		}
	});
}
