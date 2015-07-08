var requirement_row;

$(document).ready(function() {
	if($(".activity_container").index() != -1 && $(".guide_container").index() == -1){
		activity_form_init();
	}
});

function activity_form_init(){
	try {
		$('.help_tooltip').popover();
	}
	catch(err){	}
	confirmation_needed = true;
	check_edition_mode(".activity_container");	
	$(".activity_form textarea").autosize();
	$(".activity_container.new_activity").each(function(){
		delete_ids();
	});
	$(".popup_open_button").colorbox({inline:true, width:"70%", height: "90%"});
	$(".activity_form").submit(function(){
		confirmation_needed = false;
		build_attribute_strings();
	});
	
}

function pick_it(button){
	activity_id= $(button).attr('name');
	$(button).css('display','none');
	jQuery.ajax({
    	url: "pick_it",
		type: "GET",
		data: {"activity_id" : activity_id}
  	});
}

function close_requirement_extract(close_button){
	if($(close_button).closest(".requirement_row").find(".requirement_extract").css("visibility") == "visible"){
		$(close_button).closest(".requirement_row").find(".requirement_extract").css("visibility","hidden");			
	}else{
		$(".requirement_extract").css("visibility","hidden");
		$(close_button).closest(".requirement_row").find(".requirement_extract").css("visibility","visible");
	}
	update_displays();
}

function update_requirement_element_name(element){
	$(element).parent().find("."+element.id+"_name").html($("option:selected", element).text());	
}

function annotate_callback_location(location_button){
	requirement_row = location_button.closest(".requirement_row");
}



function select_tool_requirement(){
	var tool_id = $("#tool_requirement_selection .selected_elements .selection_info").find(".element_id").val();
	if(tool_id != undefined && tool_id != ""){	
		var tool_name = $("#tool_requirement_selection .selected_elements .selection_info").find(".element_name").val();
		var tool_type = $("#tool_requirement_selection .selected_elements .selection_info").find(".element_class").val();
		tool_type= tool_type.charAt(0).toUpperCase() + tool_type.slice(1);
		
		requirement_row.find(".resource_cell").removeClass("uncovered");
		requirement_row.find(".resource_cell").addClass("covered");
		if(tool_name==""){tool_name= "Resource (No name)"};
		requirement_row.find(".resource p").html(tool_name);
		requirement_row.find(".resource_type").val(tool_type);
		requirement_row.find(".resource_id").val(tool_id);
		
		requirement_row.find(".resource_name").html(tool_name);
		requirement_row.find(".tool_id").val(tool_id);
		requirement_row.find(".tool_type").val(tool_type);
						
	}
}


function select_person_requirement(){
	var person_id = $("#person_requirement_selection .selected_elements .selection_info").find(".element_id").val();
	if(person_id != undefined && person_id != ""){	
		var person_name = $("#person_requirement_selection .selected_elements .selection_info").find(".element_name").val();
		
		requirement_row.find(".resource_cell").removeClass("uncovered");
		requirement_row.find(".resource_cell").addClass("covered");
		requirement_row.find(".resource p").html(person_name);
		requirement_row.find(".resource_type").val("Person");
		requirement_row.find(".resource_id").val(person_id);
		
		requirement_row.find(".resource_name").html(person_name);
		requirement_row.find(".resource_id").val(person_id);
	}
}

function select_event_requirement(){
	var event_id = $("#event_requirement_selection .selected_elements .selection_info").find(".element_id").val();
	if(event_id != undefined && event_id != ""){	
		var event_name = $("#event_requirement_selection .selected_elements .selection_info").find(".element_name").val();
		
		requirement_row.find(".resource_cell").removeClass("uncovered");
		requirement_row.find(".resource_cell").addClass("covered");
		requirement_row.find(".resource p").html(event_name);
		requirement_row.find(".resource_type").val("Event");
		requirement_row.find(".resource_id").val(event_id);
		
		requirement_row.find(".resource_name").html(event_name);
		requirement_row.find(".resource_id").val(event_id);
	}
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

function save_activity_form(){
	confirmation_needed = false;
	$(".activity_form").submit();
}

function add_item_to_enumerate(add_button){
	item_li = $("#elements_library #item_to_itemize").html();
	$(add_button).closest(".component_container").find("ol").append(item_li);
	$(add_button).closest(".component_container").find("textarea").autosize();
}

function delete_requirement_row(delete_button){
	requirement_id= $(delete_button).closest(".requirement_row").find("#requirement_id").val();
	
	var step_body=$(delete_button).closest(".step_body");
	
	if ( requirement_id != ""){
		$(delete_button).closest(".requirement_row").css('display','none');
		$(delete_button).closest(".requirement_row").find(".requirement_extract").addClass('deleted');
	}else{
		$(delete_button).closest(".requirement_row").remove();
	}
	validate_resource_assignments(step_body);
}


function requirement_type_select(type_selected){
	requirement_row = $("#new_"+type_selected).html();
	
	$(".requirements_body").append(requirement_row);
	$(".requirement_description").autosize();
	$.colorbox.close();
	//$(".requirements_body .popup_open_button:last").colorbox({inline:true, width:"70%", height: "90%",onClosed: function(){close_selector_popup($(this).attr("href"))}});
	$(".requirements_body .requirement_row:last").find(".requirement_extract").css("visibility","visible");
}

function update_displays(){
	$(".requirements_body .requirement_row").each(function(){
		var requirement_optionality_value= $(this).find(".requirement_optionality").val();
		var requirement_optionality= $(this).find(".requirement_optionality option:selected").text();
		var requirement_specified_resource= $(this).find(".resource_name").html();
		var person_category_id= $(this).find("#person_category option:selected").val();
		var person_role_id= $(this).find("#person_role option:selected").val();
		var event_place_id= $(this).find("#event_place option:selected").val();
		var event_type_id= $(this).find("#event_type option:selected").val();
		var tool_functionality_id= $(this).find("#functionality option:selected").val();
		
		//Esto es para el caso finlandes, para meter la descricion al construir el requerimiento//
		if ($(this).find(".requirement_description_display").size()>0){
			var requirement_description=$(this).find(".requirement_description").val();
			if (requirement_description!="")
				$(this).find(".requirement_description_display").html(requirement_description+",&nbsp;");
			else $(this).find(".requirement_description_display").html("");
		}
		//Fin caso finlandes//
		
		if (requirement_optionality_value != "" && requirement_optionality_value != undefined){
			$(this).find(".requirement_optionality_display").html(requirement_optionality);
		}
		// Person abstract
		if (person_category_id != "" && person_category_id != undefined){
			$(this).find(".person_category_display").html($(this).find("#person_category option:selected").text());
		}
		if (person_role_id != ""  && person_role_id != undefined){
			$(this).find(".person_role_display").html($(this).find("#person_role option:selected").text());
		}
		// Event abstract
		if (event_place_id != "" && event_place_id != undefined){
			$(this).find(".event_place_display").html($(this).find("#event_place option:selected").text());
		}
		if (event_type_id != "" && event_type_id != undefined){
			$(this).find(".event_type_display").html($(this).find("#event_type option:selected").text());
		}
		// Tool abstract
		if (tool_functionality_id != "" && tool_functionality_id != undefined){
			$(this).find(".tool_functionality_display").html($(this).find("#functionality option:selected").text());
		}
		// Concrete requirement
		if((requirement_specified_resource != undefined) && (requirement_specified_resource != "")){
			$(this).find(".resource_specified p").html(requirement_specified_resource);
			$(this).find(".requirement_resource").removeClass("concrete_not_specified");
			$(this).find(".requirement_resource").addClass("concrete_specified");
			$(this).find(".resource_selected_display").html(requirement_specified_resource);
		}
	});
}

function build_attribute_strings(){
	$(".activity_form .box_container").each(function(box_index, box_element){
 		var box_id = $(this).find("#box_id").attr('name','activity[boxes_attributes]['+box_index+'][id]');
		var box_type = $(this).find("#box_type").attr('name','activity[boxes_attributes]['+box_index+'][box_type]');
		
		$(this).find(".component_container").each(function(component_index, component_element){
	 		var component_id = $(this).find("#component_id").attr('name','activity[boxes_attributes]['+box_index+'][components_attributes]['+component_index+'][id]');
			var component_type = $(this).find("#component_type").attr('name','activity[boxes_attributes]['+box_index+'][components_attributes]['+component_index+'][component_type]');
			$(this).find(".text_container").each(function(text_index, text_container){
				var component_id = $(text_container).find(".text_id").attr('name','activity[boxes_attributes]['+box_index+'][components_attributes]['+component_index+'][texts_attributes]['+text_index+'][id]');
				var component_text = $(text_container).find(".text_content").attr('name','activity[boxes_attributes]['+box_index+'][components_attributes]['+component_index+'][texts_attributes]['+text_index+'][content]');
				if($(text_container).hasClass('deleted')){
					$(text_container).append("<input type=\"hidden\" value=\"1\" id=\"destroy\" name=\"activity[boxes_attributes]["+box_index+"][components_attributes]["+component_index+"][texts_attributes]["+text_index+"][_destroy]\">");
				}	
			});
			
		});
		
	});
	
	$(".requirements_body .concrete_requirement").each(function(requirement_index, requirement_element){
		var requirement_id_input = $(this).find(".requirement_id");
		requirement_id_input.attr('name','activity[concrete_requirements_attributes]['+ requirement_index +'][id]');
		if ($(this).hasClass("deleted")){
			$(this).append("<input type=\"hidden\" value=\"1\" id=\"destroy\" name=\"activity[concrete_requirements_attributes]["+ requirement_index +"][_destroy]\">");
		}else{
			var tool_id_input = $(this).find(".tool_id");
			var tool_type_input = $(this).find(".tool_type");
			if (tool_id_input.val() == ""){
				$(this).append("<input type=\"hidden\" value=\"1\" id=\"destroy\" name=\"activity[concrete_requirements_attributes]["+ requirement_index +"][_destroy]\">");
			}else{
				var requirement_description_textarea = $(this).find(".requirement_description");
				requirement_description_textarea.attr('name','activity[concrete_requirements_attributes]['+ requirement_index +'][description]');
				var requirement_optionality_select = $(this).find(".requirement_optionality");
				requirement_optionality_select.attr('name','activity[concrete_requirements_attributes]['+ requirement_index +'][optionality]');
				tool_id_input.attr('name','activity[concrete_requirements_attributes]['+ requirement_index +'][concrete_requirement_tool_annotation_attributes][tool_id]');
				tool_type_input.attr('name','activity[concrete_requirements_attributes]['+ requirement_index +'][concrete_requirement_tool_annotation_attributes][tool_type]');
			}
			
		};
	});
	
	$(".requirements_body .person_concrete_requirement").each(function(requirement_index, requirement_element){
		var requirement_id_input = $(this).find(".requirement_id");
		requirement_id_input.attr('name','activity[person_concrete_requirements_attributes]['+ requirement_index +'][id]');
		if ($(this).hasClass("deleted")){
			$(this).append("<input type=\"hidden\" value=\"1\" id=\"destroy\" name=\"activity[person_concrete_requirements_attributes]["+ requirement_index +"][_destroy]\">");
		}else{
			var person_id_input = $(this).find(".resource_id");
			if (person_id_input.val() == ""){
				$(this).append("<input type=\"hidden\" value=\"1\" id=\"destroy\" name=\"activity[person_concrete_requirements_attributes]["+ requirement_index +"][_destroy]\">");
			}else{
				var requirement_description_textarea = $(this).find(".requirement_description");
				requirement_description_textarea.attr('name','activity[person_concrete_requirements_attributes]['+ requirement_index +'][description]');
				var requirement_optionality_select = $(this).find(".requirement_optionality");
				requirement_optionality_select.attr('name','activity[person_concrete_requirements_attributes]['+ requirement_index +'][optionality]');
				person_id_input.attr('name','activity[person_concrete_requirements_attributes]['+ requirement_index +'][person_concrete_requirement_person_annotation_attributes][person_id]');	
			}
		}
	});
	
	$(".requirements_body .event_concrete_requirement").each(function(requirement_index, requirement_element){
		var requirement_id_input = $(this).find(".requirement_id");
		requirement_id_input.attr('name','activity[event_concrete_requirements_attributes]['+ requirement_index +'][id]');
		if ($(this).hasClass("deleted")){
			$(this).append("<input type=\"hidden\" value=\"1\" id=\"destroy\" name=\"activity[event_concrete_requirements_attributes]["+ requirement_index +"][_destroy]\">");
		}else{
			var event_id_input = $(this).find(".resource_id");
			if (event_id_input.val() == ""){
				$(this).append("<input type=\"hidden\" value=\"1\" id=\"destroy\" name=\"activity[event_concrete_requirements_attributes]["+ requirement_index +"][_destroy]\">");
			}else{
				var requirement_description_textarea = $(this).find(".requirement_description");
				requirement_description_textarea.attr('name','activity[event_concrete_requirements_attributes]['+ requirement_index +'][description]');
				var requirement_optionality_select = $(this).find(".requirement_optionality");
				requirement_optionality_select.attr('name','activity[event_concrete_requirements_attributes]['+ requirement_index +'][optionality]');
				event_id_input.attr('name','activity[event_concrete_requirements_attributes]['+ requirement_index +'][event_concrete_requirement_event_annotation_attributes][event_id]');
			}
			
		}
	});
	
	$(".requirements_body .abstract_requirement").each(function(requirement_index, requirement_element){
		var requirement_id_input = $(this).find(".requirement_id");
		requirement_id_input.attr('name','activity[abstract_requirements_attributes]['+ requirement_index +'][id]');
		if ($(this).hasClass("deleted")){
			$(this).append("<input type=\"hidden\" value=\"1\" id=\"destroy\" name=\"activity[abstract_requirements_attributes]["+ requirement_index +"][_destroy]\">");
		}else{
			var functionality_id_select = $(this).find("#functionality");
			if (functionality_id_select.val() == ""){
				$(this).append("<input type=\"hidden\" value=\"1\" id=\"destroy\" name=\"activity[abstract_requirements_attributes]["+ requirement_index +"][_destroy]\">");
			}else{
				var requirement_description_textarea = $(this).find(".requirement_description");
				requirement_description_textarea.attr('name','activity[abstract_requirements_attributes]['+ requirement_index +'][description]');
				var requirement_optionality_select = $(this).find(".requirement_optionality");
				requirement_optionality_select.attr('name','activity[abstract_requirements_attributes]['+ requirement_index +'][optionality]');
				functionality_id_select.attr('name','activity[abstract_requirements_attributes]['+ requirement_index +'][abstract_requirement_functionality_annotation_attributes][functionality_id]');
			}
		}
		
	});
	
	$(".requirements_body .contributor_requirement").each(function(requirement_index, requirement_element){
		var requirement_id_input = $(this).find(".requirement_id");
		requirement_id_input.attr('name','activity[contributor_requirements_attributes]['+ requirement_index +'][id]');
		if ($(this).hasClass("deleted")){
			$(this).append("<input type=\"hidden\" value=\"1\" id=\"destroy\" name=\"activity[contributor_requirements_attributes]["+ requirement_index +"][_destroy]\">");
		}else{
			var person_category_id_select = $(this).find("#person_category");
			var person_role_id_select = $(this).find("#person_role");
			if (person_category_id_select.val() == "" || person_role_id_select.val() == ""){
				$(this).append("<input type=\"hidden\" value=\"1\" id=\"destroy\" name=\"activity[contributor_requirements_attributes]["+ requirement_index +"][_destroy]\">");
			}else{
				var requirement_description_textarea = $(this).find(".requirement_description");
				requirement_description_textarea.attr('name','activity[contributor_requirements_attributes]['+ requirement_index +'][description]');
				var requirement_optionality_select = $(this).find(".requirement_optionality");
				requirement_optionality_select.attr('name','activity[contributor_requirements_attributes]['+ requirement_index +'][optionality]');
				person_category_id_select.attr('name','activity[contributor_requirements_attributes]['+ requirement_index +'][contributor_requirement_person_category_annotation_attributes][person_category_id]');
				person_role_id_select.attr('name','activity[contributor_requirements_attributes]['+ requirement_index +'][contributor_requirement_person_role_annotation_attributes][person_role_id]');
			}
		}
	});
	
	$(".requirements_body .event_requirement").each(function(requirement_index, requirement_element){
		var requirement_id_input = $(this).find(".requirement_id");
		requirement_id_input.attr('name','activity[event_requirements_attributes]['+ requirement_index +'][id]');
		if ($(this).hasClass("deleted")){
			$(this).append("<input type=\"hidden\" value=\"1\" id=\"destroy\" name=\"activity[event_requirements_attributes]["+ requirement_index +"][_destroy]\">");
		}else{
			var event_type_id_select = $(this).find("#event_type");
			var event_place_id_select = $(this).find("#event_place");
			if (event_type_id_select.val() == "" || event_place_id_select.val() == ""){
				$(this).append("<input type=\"hidden\" value=\"1\" id=\"destroy\" name=\"activity[event_requirements_attributes]["+ requirement_index +"][_destroy]\">");
			}else{
				var requirement_description_textarea = $(this).find(".requirement_description");
				requirement_description_textarea.attr('name','activity[event_requirements_attributes]['+ requirement_index +'][description]');
				var requirement_optionality_select = $(this).find(".requirement_optionality");
				requirement_optionality_select.attr('name','activity[event_requirements_attributes]['+ requirement_index +'][optionality]');
				event_type_id_select.attr('name','activity[event_requirements_attributes]['+ requirement_index +'][event_requirement_event_type_annotation_attributes][event_type_id]');
				event_place_id_select.attr('name','activity[event_requirements_attributes]['+ requirement_index +'][event_requirement_event_place_annotation_attributes][event_place_id]');
			}
		}
	});
	
	
	return false;
}