var item_index=0;
var assignments_row;

$(document).ready(function() {
	if($(".sequence_container").index() != -1 && $(".guide_container").index() == -1){
		activity_sequence_form_init();
	}
	

});

function activity_sequence_form_init(){
	check_edition_mode(".sequence_container");
	recompose_list_selected();
	$(".sequence_container #activity_sequence_description").autosize();
	disable_template_edition("#activity_selected_list .draggable_box");
	$( "#activity_selected_container" ).sortable({
		items: ".draggable_box",
		appendTo: "activity_selected_container",
		handle: ".handle",
		start: function( event, ui ) {
			if(ui.helper.find(".border_top").length){
				ui.helper.find(".arrow_top").remove();
				ui.helper.find(".border_top").toggleClass("border_top_1").toggleClass("border_top");
			};
			ui.helper.find(".BorderBoxBottom").html("");
		},
		stop: function( event, ui ) {
			recompose_list_selected();
		}
	});
		
	$(".popup_open_button").colorbox({inline:true, width:"70%", height: "90%",onClosed: function(){close_selector_popup($(this).attr("href"))}});
	//$(".select_resource_button").on('click', function(){select_resource($(this));});
	
	$(".sequence_form").submit(function(){
		confirmation_needed = false;
		build_activity_sequence_attribute_strings();
	});

	$('#search').bind('ajax:success', function(){
  		alert("Success!");
  		$('.activity_list').html(my_activity_list);
	});
};

function show_templates(show_templates_button){
	var popup_content= $(show_templates_button).closest(".popup_content");
	popup_content.find(".activity_list").css('display', 'none');
	popup_content.find(".template_list").css('display', 'block');
	popup_content.find(".template_list").masonry({
	  itemSelector: '.extract_box:visible'
	});
}

function maximize(element){
	$(element).find("i").toggleClass("minimize");
	$(element).closest(".draggable_box").find(".minimizable").toggle("slow");	
	$(element).closest(".colapsable").find(".minimizable").toggleClass("default_hidden");
}

function trash(element){
	var activity_id = $(element).closest(".draggable_box").find("#activity_id").val();
	
	if (activity_id != ""){
		destroy(activity_id);
	}
	
	$(element).closest(".draggable_box").fadeOut('slow',function() {
		$(element).closest(".draggable_box").remove();
		recompose_list_selected();
	});
}

function close_assignment_extract(close_button){
	if($(close_button).closest(".assignments_row").find(".requirement_extract").css("visibility")=="visible"){
		$(close_button).closest(".assignments_row").find(".requirement_extract").css("visibility","hidden");
		
	}else{
		$(".requirement_extract").css("visibility","hidden");
		$(close_button).closest(".assignments_row").find(".requirement_extract").css("visibility","visible");
	}
}

/*
function select_resource(assignment_button){
	assignments_row = assignment_button.closest(".assignments_row");
	assignment_type= assignment_button.attr("href");
	$(assignment_type +" .recommendations").html("<div class='loading'><img src='/images/icons/loader.gif' /></div>");
	if(assignment_type == "#abstract_requirement_assignment_box") {
		recommend_tools_call();
	}else if(assignment_type == "#contributor_requirement_assignment_box") {
		recommend_people_call();
	}else if(assignment_type == "#event_requirement_assignment_box") {
		recommend_events_call();
	}
}
*/

function close_activity_selector_popup(){
	$("#activity_selector_box .selector_box_navigation h2").remove();
	$("#activity_selector_box .selector_box_navigation h1").removeAttr('onClick');
	$("#activity_selector_box .selector_box_navigation h1").css('cursor','inherit');
	$("#activity_selector_box .selector").removeClass("hidden");
  	$("#activity_selector_box .details").addClass("hidden");
}


function view_activity_details(activity_id){
	jQuery.ajax({
    	url: "show_activity",
		type: "GET",
		data: {"id" : activity_id}
  	}).done(function(result){
  		$("#content_activity").html(details);
  		check_edition_mode(".activity_details");
  		activity_form_init();
  		$(".inline").click ();
  	});
}


function destroy(activity_id){
	if($(".guide_container").index() == (-1)){
		$("#activities_to_delete").append("<input type=\"text\" id=\"attributes_activity_id_" + item_index +"\" name=\"activity_sequence[activities_attributes][" + item_index + "][id]\">");
		$("#attributes_activity_id_" + item_index).val(activity_id);
		$("#activities_to_delete").append("<input type=\"hidden\" value=\"1\" id=\"destroy\" name=\"activity_sequence[activities_attributes][" + item_index +"][_destroy]\">");	
	} else {
		$("#activities_to_delete").append("<input type=\"text\" id=\"attributes_activity_id_" + item_index +"\" name=\"guide[activity_sequence_attributes][activities_attributes][" + item_index + "][id]\">");
		$("#attributes_activity_id_" + item_index).val(activity_id);
		$("#activities_to_delete").append("<input type=\"hidden\" value=\"1\" id=\"destroy\" name=\"guide[activity_sequence_attributes][activities_attributes][" + item_index +"][_destroy]\">");
	}
	
	item_index++;
};

function save_sequence_form(){
	$(".sequence_form").submit();
}

function recompose_list_selected(){
	
	var len = $('#activity_selected_list .draggable_box').length;
	
	$('#activity_selected_list .draggable_box').each(function(index, element) {
		$(this).find("textarea").autosize();
		if(index == 0){
			if($(this).find(".border_top").length){
				$(this).find(".arrow_top").remove();
				$(this).find(".border_top").toggleClass("border_top_1").toggleClass("border_top");
			}
			
			
		} else {
			if($(this).find(".border_top_1").length){
				$(this).find(".BorderBoxTop").prepend("<div class=\"arrow_top\"></div>");
				$(this).find(".border_top_1").toggleClass("border_top").toggleClass("border_top_1");
			}
		}
		
		if(index!=len-1){
			$(this).find(".BorderBoxBottom").html("<div id=\"arrow_bottom\"></div>");
		}else {
			$(this).find(".BorderBoxBottom").html("");
		}	
	});
	
};

function get_assignments_rows(activity_id,activity_instance_box){
	jQuery.ajax({
    	url: "get_assignments_rows",
		type: "GET",
		data: {"id" : activity_id}
  	}).done(function(result){
  		activity_instance_box.find(".assignments_body").html(assignments_rows);
  		activity_instance_box.find(".popup_open_button").colorbox({inline:true, width:"70%", height: "90%", onClosed: function(){close_selector_popup($(this).attr("href"))}});
  		//activity_instance_box.find(".select_resource_button").on('click', function(){select_resource($(this));});
  	});
}

function select_activity_from_sequence() {
	var activity_selected = $("#activities .selected_elements .selection_info").find(".element_id").val();
	if (activity_selected != "" && activity_selected != undefined){
		var form_id= $("form").attr('id');
		if(form_id.indexOf("new") != -1){
			var url= "../activity_sequences/get_activity";
		}else{
			var url= "../../activity_sequences/get_activity";
		}
		jQuery.ajax({
	    	url: url,
			type: "GET",
			data: {"id" : activity_selected, "current_tab" : "activity_sequences"}
		}).done(function(){
			$("#activity_selected_list").append(step);
			var id=$("#activity_selected_list .draggable_box:last").find("#activity_id").val();
			$("#activity_selected_list .draggable_box:last").find('input[id$="_id"]').val("");			
			$("#activity_selected_list .draggable_box:last").find('#activity_referenced_activity_id').val(id);
			$("#activity_selected_list .draggable_box:last textarea").autosize();
			check_edition_mode("#activity_selected_list .draggable_box:last");
			$(".popup_open_button").colorbox({inline:true, width:"70%", height: "90%"});
			disable_template_edition("#activity_selected_list .draggable_box:last");
			recompose_list_selected();
			validate_resource_assignments($('.step_body:last'));
		});	
	}
	
	$("#activities .activity_list").css('display', 'block');
	$("#activities .template_list").css('display', 'none');
};

function select_activity_from_guide() {
	var activity_selected = $("#activities .selected_elements .selection_info").find(".element_id").val();
	if (activity_selected != "" && activity_selected != undefined){
		var form_id= $("form").attr('id');
		if(form_id.indexOf("new") != -1){
			var url= "../activity_sequences/get_activity";
		}else{
			var url= "../../activity_sequences/get_activity";
		}
		jQuery.ajax({
	    	url: url,
			type: "GET",
			data: {"id" : activity_selected, "current_tab" : "guides"}
		}).done(function(){
			$("#activity_selected_list").append(step);
			var id=$("#activity_selected_list .draggable_box:last").find("#activity_id").val();
			$("#activity_selected_list .draggable_box:last").find('input[id$="_id"]').val("");			
			$("#activity_selected_list .draggable_box:last").find('#activity_referenced_activity_id').val(id);
			$("#activity_selected_list .draggable_box:last textarea").autosize();
			check_edition_mode("#activity_selected_list .draggable_box:last");
			$(".popup_open_button").colorbox({inline:true, width:"70%", height: "90%"});
			disable_template_edition("#activity_selected_list .draggable_box:last");
			recompose_list_selected();
			validate_resource_assignments($('.step_body:last'));
		});	
	}
	
	$("#activities .activity_list").css('display', 'block');
	$("#activities .template_list").css('display', 'none');
};


function build_activity_sequence_attribute_strings(){
	$("#activity_selected_list .edit_sequence_box").each(function(index, element){
		$(element).find("#activity_id").attr('name','activity_sequence[activities_attributes]['+item_index+'][id]');
		$(element).find("#activity_status").attr('name','activity_sequence[activities_attributes]['+item_index+'][status]');
		$(element).find("#activity_name").attr('name','activity_sequence[activities_attributes]['+item_index+'][name]');
		$(element).find("#activity_description").attr('name','activity_sequence[activities_attributes]['+item_index+'][description]');
		$(element).find("#activity_element_image").attr('name','activity_sequence[activities_attributes]['+item_index+'][element_image]');
		$(element).find("#activity_position").attr('name','activity_sequence[activities_attributes]['+item_index+'][position]');
		$(element).find("#activity_position").val(index +1);
		
		$(element).find(".box_container").each(function(box_index, box_element){
	 		var box_id = $(this).find("#box_id").attr('name','activity_sequence[activities_attributes]['+item_index+'][boxes_attributes]['+box_index+'][id]');
			var box_type = $(this).find("#box_type").attr('name','activity_sequence[activities_attributes]['+item_index+'][boxes_attributes]['+box_index+'][box_type]');
			
			$(this).find(".component_container").each(function(component_index, component_element){
		 		var component_id = $(this).find("#component_id").attr('name','activity_sequence[activities_attributes]['+item_index+'][boxes_attributes]['+box_index+'][components_attributes]['+component_index+'][id]');
				var component_type = $(this).find("#component_type").attr('name','activity_sequence[activities_attributes]['+item_index+'][boxes_attributes]['+box_index+'][components_attributes]['+component_index+'][component_type]');
				$(this).find(".text_container").each(function(text_index, text_container){
					var component_id = $(text_container).find(".text_id").attr('name','activity_sequence[activities_attributes]['+item_index+'][boxes_attributes]['+box_index+'][components_attributes]['+component_index+'][texts_attributes]['+text_index+'][id]');
					var component_text = $(text_container).find(".text_content").attr('name','activity_sequence[activities_attributes]['+item_index+'][boxes_attributes]['+box_index+'][components_attributes]['+component_index+'][texts_attributes]['+text_index+'][content]');
					if($(text_container).hasClass('deleted')){
						$(text_container).append("<input type=\"hidden\" value=\"1\" id=\"destroy\" name=\"activity_sequence[activities_attributes]["+item_index+"][boxes_attributes]["+box_index+"][components_attributes]["+component_index+"][texts_attributes]["+text_index+"][_destroy]\">");
					}	
				});
				
			});
			
		});
		
		$(element).find(".requirements_body .concrete_requirement").each(function(requirement_index, requirement_element){
			var requirement_id_input = $(this).find(".requirement_id");
			requirement_id_input.attr('name','activity_sequence[activities_attributes]['+item_index+'][concrete_requirements_attributes]['+ requirement_index +'][id]');
			if ($(this).hasClass("deleted")){
				$(this).append("<input type=\"hidden\" value=\"1\" id=\"destroy\" name=\"activity_sequence[activities_attributes]["+item_index+"][concrete_requirements_attributes]["+ requirement_index +"][_destroy]\">");
			}else{
				var tool_id_input = $(this).find(".tool_id");
				var tool_type_input = $(this).find(".tool_type");
				if (tool_id_input.val() == ""){
					$(this).append("<input type=\"hidden\" value=\"1\" id=\"destroy\" name=\"activity_sequence[activities_attributes]["+item_index+"][concrete_requirements_attributes]["+ requirement_index +"][_destroy]\">");
				}else{
					var requirement_description_textarea = $(this).find(".requirement_description");
					requirement_description_textarea.attr('name','activity_sequence[activities_attributes]['+item_index+'][concrete_requirements_attributes]['+ requirement_index +'][description]');
					var requirement_optionality_select = $(this).find(".requirement_optionality");
					requirement_optionality_select.attr('name','activity_sequence[activities_attributes]['+item_index+'][concrete_requirements_attributes]['+ requirement_index +'][optionality]');
					tool_id_input.attr('name','activity_sequence[activities_attributes]['+item_index+'][concrete_requirements_attributes]['+ requirement_index +'][concrete_requirement_tool_annotation_attributes][tool_id]');
					tool_type_input.attr('name','activity_sequence[activities_attributes]['+item_index+'][concrete_requirements_attributes]['+ requirement_index +'][concrete_requirement_tool_annotation_attributes][tool_type]');
				}
				
			};
		});
		
		$(element).find(".requirements_body .person_concrete_requirement").each(function(requirement_index, requirement_element){
			var requirement_id_input = $(this).find(".requirement_id");
			requirement_id_input.attr('name','activity_sequence[activities_attributes]['+item_index+'][person_concrete_requirements_attributes]['+ requirement_index +'][id]');
			if ($(this).hasClass("deleted")){
				$(this).append("<input type=\"hidden\" value=\"1\" id=\"destroy\" name=\"activity_sequence[activities_attributes]["+item_index+"][person_concrete_requirements_attributes]["+ requirement_index +"][_destroy]\">");
			}else{
				var person_id_input = $(this).find(".resource_id");
				if (person_id_input.val() == ""){
					$(this).append("<input type=\"hidden\" value=\"1\" id=\"destroy\" name=\"activity_sequence[activities_attributes]["+item_index+"][person_concrete_requirements_attributes]["+ requirement_index +"][_destroy]\">");
				}else{
					var requirement_description_textarea = $(this).find(".requirement_description");
					requirement_description_textarea.attr('name','activity_sequence[activities_attributes]['+item_index+'][person_concrete_requirements_attributes]['+ requirement_index +'][description]');
					var requirement_optionality_select = $(this).find(".requirement_optionality");
					requirement_optionality_select.attr('name','activity_sequence[activities_attributes]['+item_index+'][person_concrete_requirements_attributes]['+ requirement_index +'][optionality]');
					person_id_input.attr('name','activity_sequence[activities_attributes]['+item_index+'][person_concrete_requirements_attributes]['+ requirement_index +'][person_concrete_requirement_person_annotation_attributes][person_id]');	
				}
			}
		});
		
		$(element).find(".requirements_body .event_concrete_requirement").each(function(requirement_index, requirement_element){
			var requirement_id_input = $(this).find(".requirement_id");
			requirement_id_input.attr('name','activity_sequence[activities_attributes]['+item_index+'][event_concrete_requirements_attributes]['+ requirement_index +'][id]');
			if ($(this).hasClass("deleted")){
				$(this).append("<input type=\"hidden\" value=\"1\" id=\"destroy\" name=\"activity_sequence[activities_attributes]["+item_index+"][event_concrete_requirements_attributes]["+ requirement_index +"][_destroy]\">");
			}else{
				var event_id_input = $(this).find(".resource_id");
				if (event_id_input.val() == ""){
					$(this).append("<input type=\"hidden\" value=\"1\" id=\"destroy\" name=\"activity_sequence[activities_attributes]["+item_index+"][event_concrete_requirements_attributes]["+ requirement_index +"][_destroy]\">");
				}else{
					var requirement_description_textarea = $(this).find(".requirement_description");
					requirement_description_textarea.attr('name','activity_sequence[activities_attributes]['+item_index+'][event_concrete_requirements_attributes]['+ requirement_index +'][description]');
					var requirement_optionality_select = $(this).find(".requirement_optionality");
					requirement_optionality_select.attr('name','activity_sequence[activities_attributes]['+item_index+'][event_concrete_requirements_attributes]['+ requirement_index +'][optionality]');
					event_id_input.attr('name','activity_sequence[activities_attributes]['+item_index+'][event_concrete_requirements_attributes]['+ requirement_index +'][event_concrete_requirement_event_annotation_attributes][event_id]');
				}
				
			}
		});
		
		$(element).find(".requirements_body .abstract_requirement").each(function(requirement_index, requirement_element){
			var requirement_id_input = $(this).find(".requirement_id");
			requirement_id_input.attr('name','activity_sequence[activities_attributes]['+item_index+'][abstract_requirements_attributes]['+ requirement_index +'][id]');
			if ($(this).hasClass("deleted")){
				$(this).append("<input type=\"hidden\" value=\"1\" id=\"destroy\" name=\"activity_sequence[activities_attributes]["+item_index+"][abstract_requirements_attributes]["+ requirement_index +"][_destroy]\">");
			}else{
				var functionality_id_select = $(this).find("#functionality");
				if (functionality_id_select.val() == ""){
					$(this).append("<input type=\"hidden\" value=\"1\" id=\"destroy\" name=\"activity_sequence[activities_attributes]["+item_index+"][abstract_requirements_attributes]["+ requirement_index +"][_destroy]\">");
				}else{
					var requirement_description_textarea = $(this).find(".requirement_description");
					requirement_description_textarea.attr('name','activity_sequence[activities_attributes]['+item_index+'][abstract_requirements_attributes]['+ requirement_index +'][description]');
					var requirement_optionality_select = $(this).find(".requirement_optionality");
					requirement_optionality_select.attr('name','activity_sequence[activities_attributes]['+item_index+'][abstract_requirements_attributes]['+ requirement_index +'][optionality]');
					functionality_id_select.attr('name','activity_sequence[activities_attributes]['+item_index+'][abstract_requirements_attributes]['+ requirement_index +'][abstract_requirement_functionality_annotation_attributes][functionality_id]');
				}
			}
			
		});
		
		$(element).find(".requirements_body .contributor_requirement").each(function(requirement_index, requirement_element){
			var requirement_id_input = $(this).find(".requirement_id");
			requirement_id_input.attr('name','activity_sequence[activities_attributes]['+item_index+'][contributor_requirements_attributes]['+ requirement_index +'][id]');
			if ($(this).hasClass("deleted")){
				$(this).append("<input type=\"hidden\" value=\"1\" id=\"destroy\" name=\"activity_sequence[activities_attributes]["+item_index+"][contributor_requirements_attributes]["+ requirement_index +"][_destroy]\">");
			}else{
				var person_category_id_select = $(this).find("#person_category");
				var person_role_id_select = $(this).find("#person_role");
				if (person_category_id_select.val() == "" || person_role_id_select.val() == ""){
					$(this).append("<input type=\"hidden\" value=\"1\" id=\"destroy\" name=\"activity_sequence[activities_attributes]["+item_index+"][contributor_requirements_attributes]["+ requirement_index +"][_destroy]\">");
				}else{
					var requirement_description_textarea = $(this).find(".requirement_description");
					requirement_description_textarea.attr('name','activity_sequence[activities_attributes]['+item_index+'][contributor_requirements_attributes]['+ requirement_index +'][description]');
					var requirement_optionality_select = $(this).find(".requirement_optionality");
					requirement_optionality_select.attr('name','activity_sequence[activities_attributes]['+item_index+'][contributor_requirements_attributes]['+ requirement_index +'][optionality]');
					person_category_id_select.attr('name','activity_sequence[activities_attributes]['+item_index+'][contributor_requirements_attributes]['+ requirement_index +'][contributor_requirement_person_category_annotation_attributes][person_category_id]');
					person_role_id_select.attr('name','activity_sequence[activities_attributes]['+item_index+'][contributor_requirements_attributes]['+ requirement_index +'][contributor_requirement_person_role_annotation_attributes][person_role_id]');
				}
			}
		});
		
		$(element).find(".requirements_body .event_requirement").each(function(requirement_index, requirement_element){
			var requirement_id_input = $(this).find(".requirement_id");
			requirement_id_input.attr('name','activity_sequence[activities_attributes]['+item_index+'][event_requirements_attributes]['+ requirement_index +'][id]');
			if ($(this).hasClass("deleted")){
				$(this).append("<input type=\"hidden\" value=\"1\" id=\"destroy\" name=\"activity_sequence[activities_attributes]["+item_index+"][event_requirements_attributes]["+ requirement_index +"][_destroy]\">");
			}else{
				var event_type_id_select = $(this).find("#event_type");
				var event_place_id_select = $(this).find("#event_place");
				if (event_type_id_select.val() == "" || event_place_id_select.val() == ""){
					$(this).append("<input type=\"hidden\" value=\"1\" id=\"destroy\" name=\"activity_sequence[activities_attributes]["+item_index+"][event_requirements_attributes]["+ requirement_index +"][_destroy]\">");
				}else{
					var requirement_description_textarea = $(this).find(".requirement_description");
					requirement_description_textarea.attr('name','activity_sequence[activities_attributes]['+item_index+'][event_requirements_attributes]['+ requirement_index +'][description]');
					var requirement_optionality_select = $(this).find(".requirement_optionality");
					requirement_optionality_select.attr('name','activity_sequence[activities_attributes]['+item_index+'][event_requirements_attributes]['+ requirement_index +'][optionality]');
					event_type_id_select.attr('name','activity_sequence[activities_attributes]['+item_index+'][event_requirements_attributes]['+ requirement_index +'][event_requirement_event_type_annotation_attributes][event_type_id]');
					event_place_id_select.attr('name','activity_sequence[activities_attributes]['+item_index+'][event_requirements_attributes]['+ requirement_index +'][event_requirement_event_place_annotation_attributes][event_place_id]');
				}
			}
		});
		
		
		
		item_index++
	});
	
	
	
	
	return false;
}
