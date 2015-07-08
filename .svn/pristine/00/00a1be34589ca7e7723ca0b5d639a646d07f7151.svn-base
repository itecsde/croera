$(document).ready(function() 
{
	person_form_init();
});

function person_form_init()
{
	//check_edition_mode(".person_container");
	confirmation_needed = true;
	$(".person_name textarea").autosize();
	$(".person_description textarea").autosize();
	
	if ($("#is_edition").attr("data-value")=="true"){
		init_sliders();
	}
		
	var latitude= $("#person_latitude").val();
	var longitude= $("#person_longitude").val();
   	initialize_map(latitude, longitude); 

	//$( ".slider" ).slider( "option", "value",  );
}

function init_sliders(){
	$( ".slider" ).slider({
		range: "max",
		min: 1,
		max: 10,
		value: 0,
		slide: function( event, ui ) {
			$(this).closest(".slider_with_input" ).find(".level").val( ui.value );
		}
	});
	
	arr=$(".slider_with_input");
	jQuery.each(arr,function (){
		$(this).find(".slider").slider("option","value",$(this).find(".level").val());
	});
	if ($("#edition_mode").val()== "off"){
		$(".slider").slider("option", "disabled", true);
	}
}



function add_selector_with_slider(add_button){
	selector_with_slide =$('<div class="selector_with_slider">').append($("#snippets_library .selector_with_slider").clone()).html();
	$(".person_expertises .field_body").append(selector_with_slide);
	init_sliders();
}

function delete_selector_with_slider(element){
	$(element).closest(".selector_with_slider").remove();
}


function add_language (add_button){
	language =$('<div class="language_item">').append($("#snippets_library .language_item").clone()).html();
	$(".person_languages .field_body").append(language);
}

function delete_language(element){
	$(element).closest(".language_item").remove();
}


function save_person_form()
{
	$(".person_expertises .field_body .selector_with_slider").each(function(index, element){
		$(element).find(".subject").attr('name','person[person_subject_annotations_attributes]['+index+'][subject_id]');
		$(element).find(".level").attr('name','person[person_subject_annotations_attributes]['+index+'][level]');
	});
	
	$(".person_languages .field_body .language_item").each(function(index, element){
		$(element).find("#language").attr('name','person[person_language_annotations_attributes]['+index+'][contextual_language_id]');		
	});
	
	confirmation_needed = false;
	$(".person_form").submit();
}
