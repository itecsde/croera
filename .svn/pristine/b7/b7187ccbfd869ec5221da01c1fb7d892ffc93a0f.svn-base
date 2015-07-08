$(document).ready(function(){
	if($(".contextual_setting_container").index() != -1 && $(".guide_container").index() == -1){
		contextual_setting_form_init();
	}	
});

function contextual_setting_form_init()
{	
	var latitude= $("#contextual_setting_latitude").val();
	var longitude= $("#contextual_setting_longitude").val();
   	initialize_map(latitude, longitude); 
	var placeholder= $("#select_placeholder").val();
	var text_nothing_found= $("#select_no_found_text").val();
	$("#contextual_setting_contextual_setting_subject_annotation_attributes_subject_id").attr('data-placeholder', placeholder);
	$("#contextual_setting_education_level_ids_").attr('data-placeholder', placeholder);
	$("#contextual_setting_contextual_language_ids_").attr('data-placeholder', placeholder);
	$("#contextual_setting_contextual_setting_subject_annotation_attributes_subject_id").chosen({allow_single_deselect:true, no_results_text: text_nothing_found});
	$("#contextual_setting_education_level_ids_").chosen({no_results_text: text_nothing_found});	
	$("#contextual_setting_contextual_language_ids_").chosen({no_results_text: text_nothing_found});
	$( "#contextual_setting_start_date" ).datepicker({
		dateFormat: "yy-mm-dd",
		showAnim: "slide"
	});
	$( "#contextual_setting_end_date" ).datepicker({
		dateFormat: "yy-mm-dd",
		showAnim: "slide"
	});
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
			$( "#contextual_setting_age_range" ).val( ui.values[ 0 ] + " - " + ui.values[ 1 ] );
			
		}
	});
	check_edition_mode(".contextual_setting_container");
	$("#contextual_setting_description").autosize();
}

function save_contextual_setting_form(){
	if($("#contextual_setting_education_level_ids_ option:selected").length == 0){
		$(".contextual_setting_form").append("<input type= 'hidden' name= 'contextual_setting[education_level_ids][]' value=''/>")
	};
	if($("#contextual_setting_contextual_language_ids_ option:selected").length == 0){
		$(".contextual_setting_form").append("<input type= 'hidden' name= 'contextual_setting[contextual_language_ids][]' value=''/>")
	};
	confirmation_needed = false;
	$(".contextual_setting_form").submit();
}

function split( val ) {
	return val.split( /,\s*/ );
}
function extractLast( term ) {
	return split( term ).pop();
}
