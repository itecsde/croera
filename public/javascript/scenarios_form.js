$(document).ready(function() {
	if($(".scenario_container").index() != -1 && $(".guide_container").index() == -1){
		scenario_form_init();
	}
});

function scenario_form_init(){
	$('.help_tooltip').popover();
	confirmation_needed = true;
	check_edition_mode(".scenario_container");	
	$(".scenario_form textarea").autosize();
	
	$("#new_scenario").each(function(){
		delete_ids();
	});
	
	$(".scenario_form").submit(function(){
		confirmation_needed = false;
		build_attribute_strings();
	});
}


function save_scenario_form(){
	confirmation_needed = false;
	$(".scenario_form").submit();
}

function delete_ids(){
	$(".box_container").each(function(){
		$(this).find("#box_id").val("");
		$(".component_container").each(function(){
			$(this).find("#component_id").val("");
			$(this).find(".text_container").each(function(){
				$(this).find("#text_id").val("");
			});
		});
	});
}


function pick_it(button){
	scenario_id= $(button).attr('name');
	$(button).css('display','none');
	jQuery.ajax({
    	url: "pick_it",
		type: "GET",
		data: {"scenario_id" : scenario_id}
  	});
}




function build_attribute_strings(){
	$(".scenario_form .box_container").each(function(box_index, box_element){
 		var box_id = $(this).find("#box_id").attr('name','scenario[boxes_attributes]['+box_index+'][id]');
		var box_type = $(this).find("#box_type").attr('name','scenario[boxes_attributes]['+box_index+'][box_type]');
		
		$(this).find(".component_container").each(function(component_index, component_element){
	 		var component_id = $(this).find("#component_id").attr('name','scenario[boxes_attributes]['+box_index+'][components_attributes]['+component_index+'][id]');
			var component_type = $(this).find("#component_type").attr('name','scenario[boxes_attributes]['+box_index+'][components_attributes]['+component_index+'][component_type]');
			$(this).find(".text_container").each(function(text_index, text_container){
				var component_id = $(text_container).find(".text_id").attr('name','scenario[boxes_attributes]['+box_index+'][components_attributes]['+component_index+'][texts_attributes]['+text_index+'][id]');
				var component_text = $(text_container).find(".text_content").attr('name','scenario[boxes_attributes]['+box_index+'][components_attributes]['+component_index+'][texts_attributes]['+text_index+'][content]');
				if($(text_container).hasClass('deleted')){
					$(text_container).append("<input type=\"hidden\" value=\"1\" id=\"destroy\" name=\"scenario[boxes_attributes]["+box_index+"][components_attributes]["+component_index+"][texts_attributes]["+text_index+"][_destroy]\">");
				}	
			});
			
		});
		
	});
	return false;
}
