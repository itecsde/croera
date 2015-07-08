$(document).ready(function() 
{
	application_form_init();
});

function application_form_init()
{
	confirmation_needed = true;
	//check_edition_mode(".application_container");
	$(".application_name textarea").autosize();
	$(".application_description textarea").autosize();
	
	$(".application_form").submit(function(){
		confirmation_needed = false;
		check_application_url();
	});
	if ($("#is_edition").attr("data-value")=="true"){
		init_sliders();
	}
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
function save_application_form()
{
	$(".application_functionalities .field_body .selector_with_slider").each(function(index, element){
		$(element).find(".functionality").attr('name','application[application_functionality_annotations_attributes]['+index+'][functionality_id]');
		$(element).find(".level").attr('name','application[application_functionality_annotations_attributes]['+index+'][level]');
	});
	
	$(".application_operating_systems .operating_system_item").each(function(index, element){
		$(element).find(".operating_system").attr('name','application[application_operating_system_annotations_attributes]['+index+'][operating_system_id]');		
	});

	$(".application_form").submit();
}

function check_application_url(){
	if($("#application_url").val() != ""){
		var url_string = $("#application_url").val();
		var final_url = check_url(url_string);
		$("#application_url").val(final_url);
	}
	return false;
}


function add_selector_with_slider(add_button){
	//selector_with_slide = $("#snippets_library .selector_with_slider").html();
	selector_with_slide =$('<div class="selector_with_slider">').append($("#snippets_library .selector_with_slider").clone()).html();
	$(".application_functionalities .field_body").append(selector_with_slide);
	
	init_sliders();
	//$( ".level" ).val( $( ".slider" ).slider( "value" ) );
}

function add_operating_system(add_button){	
	language =$('<div class="operating_system_item">').append($("#snippets_library .operating_system_item").clone()).html();
	$(".application_operating_systems .field_body").append(language);
}

function delete_operating_system(element){
	$(element).closest(".operating_system_item").remove();
}



function delete_selector_with_slider(element){
	$(element).closest(".selector_with_slider").remove();
}



