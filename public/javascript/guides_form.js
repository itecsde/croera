$(document).ready(function() {
	if($(".guide_container").index() != -1){
		guide_form_init();
	}
});

function guide_form_init(){
	check_edition_mode(".guide_container");
	var technological_setting_id = $("#technological_setting_id").val();
	var contextual_setting_id = $("#contextual_setting_id").val();
	var sequence_id = $("#sequence_id").val();
	
	if(technological_setting_id != ""){
		show_technological_setting(technological_setting_id);
	}else{
		new_technological_setting();
	}
	if(contextual_setting_id != ""){
		show_contextual_setting(contextual_setting_id);
	}else{
		new_contextual_setting();
	}
	if(sequence_id != ""){
		show_sequence(sequence_id);
	}else{
		new_sequence();
	}
	
	$(".guide_description textarea").autosize();
	$(".popup_open_button").colorbox({inline:true, width:"70%", height: "90%",onClosed: function(){close_selector_popup($(this).attr("href"))}});
	init_masonry("#tool_assignment_selection .recommendations");
	init_masonry("#event_assignment_selection .recommendations");
	init_masonry("#person_assignment_selection .recommendations");
	
	$(".guide_form").submit(function(){
		confirmation_needed = false;
		guide_submit();
	});	
}


function validate_tool_assignment(row,funtionality_id,element_class,element_id){
	var assignment_validation=false;
	var form_id= $("form").attr('id');
	if(form_id.indexOf("new") != -1){
		var url= "../guides/validate_tool_assignment";
	}else{
		var url= "../../guides/validate_tool_assignment";
	}
	if(element_id == undefined || element_id == ""){	
		assignment_validation="incomplete";
		$(row).find(".validation_icon img").attr('src', "/images/exclamation.png");	
	}
	else {
		jQuery.ajax({
		    	url: url,
				type: "GET",
				async: true,
				data: {"functionality_id" : funtionality_id,"element_class": element_class, "element_id": element_id}
			}).done(function() {
				if (result=="true"){
					$(row).find(".validation_icon img").attr('src', "/images/v.png");				
					assignment_validation="true";
				}
				else if (result=="false"){
					$(row).find(".validation_icon img").attr('src', "/images/x.png");				
					assignment_validation="false";
				}
				else {
					$(row).find(".validation_icon img").attr('src', "/images/exclamation.png");				
					assignment_validation="incomplete";
				}
			}).always(function() {
				
			}).fail(function() {
						
			});
	}
	return assignment_validation;
}


function validate_resource_assignments(activity){
	var arr=$(activity).find(".requirement_row").not(":has(> .deleted)");
	var assignment_validation;
	var activity_validation="valid";
	jQuery.each(arr,function (){
		//icon_type=$(this).find(".requirement_icon i").attr("class");
		//if (icon_type=="icon-abstract_requirement"){
			var tool_selected_id = $(this).find("#resource_identification").val();
			var tool_selected_class = $(this).find("#resource_type").val();
			assignment_validation=validate_tool_assignment($(this),$(this).find("#functionality").val(),tool_selected_class,tool_selected_id);
			if (assignment_validation=="false")
				activity_validation="invalid";
			else if (activity_validation!="invalid" && assignment_validation=="incomplete")
				activity_validation="incomplete";
		//}
	});	
	/*
	if (activity_validation=="valid")
		$(activity).find(".activity_validation_icon img").attr('src', "/images/v_with_border.png");
	else if (activity_validation=="invalid")
		$(activity).find(".activity_validation_icon img").attr('src', "/images/x_with_border.png");
	else $(activity).find(".activity_validation_icon img").attr('src', "/images/exclamation_with_border.png");*/
}


function do_magic(element){
	arr=$(element).closest(".step_body").find(".requirement_row").not(":has(> .deleted)");
	jQuery.each(arr,function (){
		icon_type=$(this).find(".requirement_icon i").attr("class");
		if (icon_type=="icon-abstract_requirement"){
			get_best_recommendation($(this));
		}	
		
		
	});
}


function select_tool_assignment(){
	var tool_selected_id = $("#tool_assignment_selection .selected_elements .selection_info").find(".element_id").val();
	if(tool_selected_id != undefined && tool_selected_id != ""){	
		var tool_selected_name = $("#tool_assignment_selection .selected_elements .selection_info").find(".element_name").val();
		var tool_selected_class = $("#tool_assignment_selection .selected_elements .selection_info").find(".element_class").val();
		tool_selected_class= tool_selected_class.charAt(0).toUpperCase() + tool_selected_class.slice(1);
		
		requirement_row.find(".resource_cell").removeClass("uncovered");
		requirement_row.find(".resource_cell").addClass("covered");
		if(tool_selected_name==""){tool_selected_name= "Resource (No name)";};
		requirement_row.find(".resource p").html(tool_selected_name);
		requirement_row.find(".resource_type").val(tool_selected_class);
		requirement_row.find(".resource_identification").val(tool_selected_id);
		
		validate_resource_assignments($(requirement_row).closest(".step_body"));
		//validate_tool_assignment(requirement_row,$(requirement_row).find("#functionality").val(),tool_selected_class,tool_selected_id);

	}
}

function select_person_assignment(){
	var person_selected_id = $("#person_assignment_selection .selected_elements .selection_info").find(".element_id").val();
	if(person_selected_id != undefined && person_selected_id != ""){
		var person_selected_name = $("#person_assignment_selection .selected_elements .selection_info").find(".element_name").val();
		requirement_row.find(".resource_cell").removeClass("uncovered");
		requirement_row.find(".resource_cell").addClass("covered");
		if(person_selected_name==""){person_selected_name= "Resource (No name)";};
		requirement_row.find(".resource p").html(person_selected_name);
		requirement_row.find(".resource_identification").val(person_selected_id);
	}
}

function select_event_assignment(){
	var event_selected_id = $("#event_assignment_selection .selected_elements .selection_info").find(".element_id").val();
	if(event_selected_id != undefined && event_selected_id != ""){
		var event_selected_name = $("#event_assignment_selection .selected_elements .selection_info").find(".element_name").val();		
		requirement_row.find(".resource_cell").removeClass("uncovered");
		requirement_row.find(".resource_cell").addClass("covered");
		if(event_selected_name==""){ event_selected_name= "Resource (No name)"; };
		requirement_row.find(".resource p").html(event_selected_name);
		requirement_row.find(".resource_identification").val(event_selected_id);
	}
}

function show_technological_setting(selected){	
	var locale= $("#locale").val();
	jQuery.ajax({
    	url: "/" + locale + "/guides/select_technological_setting",
		type: "GET",
		data: {"id" : selected}
  	});
};

function show_technological_setting_callback(technological_setting){
	var form= technological_setting.find(".technological_setting_form").html();
	var guide_edition_mode = $(".guide_container #edition_mode").val();
	var edition_mode= $("<input type='hidden' id='edition_mode' value='"+guide_edition_mode+"'/>");
	$("#guide_technological_setting_content").html(form);
	$("#guide_technological_setting_content").append(edition_mode);	
	technological_setting_form_init();
};

function select_technological_setting(){
	var technological_setting_selected = $("#technological_settings .selected_elements .selection_info").find(".element_id").val();
	if (technological_setting_selected != "" && technological_setting_selected != undefined){
		var form_id= $("form").attr('id');
		if(form_id.indexOf("new") != -1){
			var url= "../guides/get_technological_setting";
		}else{
			var url= "../../guides/get_technological_setting";
		}
		jQuery.ajax({
	    	url: url,
			type: "GET",
			data: {"id" : technological_setting_selected}
		}).done(function() {
			var form= technological_setting.find(".technological_setting_form").html();
			var edition_mode= $("<input type='hidden' id='edition_mode' value='on'/>");
			$("#guide_technological_setting_content").html(form);
			$("#guide_technological_setting_content").append(edition_mode);
			technological_setting_form_init();
			$("#guide_technological_setting_content").find('input[id$="_id"]').val("");
		});
	}
};

function show_contextual_setting(selected) {
	var locale= $("#locale").val();	
	jQuery.ajax({
    	url: "/" + locale + "/guides/select_contextual_setting",
		type: "GET",
		data: {"id" : selected}
  	});
};

function show_contextual_setting_callback(contextual_setting){
	var form= contextual_setting.find(".contextual_setting_form").html();
	var guide_edition_mode = $(".guide_container #edition_mode").val();
	var edition_mode= $("<input type='hidden' id='edition_mode' value='"+guide_edition_mode+"'/>");
	$("#guide_contextual_setting_content").html(form);
	$("#guide_contextual_setting_content").append(edition_mode);
	guide_contextual_setting_form_init();
}

function select_contextual_setting(){
	var contextual_setting_selected = $("#contextual_settings .selected_elements .selection_info").find(".element_id").val();
	if (contextual_setting_selected != "" && contextual_setting_selected != undefined){
		var form_id= $("form").attr('id');
		if(form_id.indexOf("new") != -1){
			var url= "../guides/get_contextual_setting";
		}else{
			var url= "../../guides/get_contextual_setting";
		}
		jQuery.ajax({
	    	url: url,
			type: "GET",
			data: {"id" : contextual_setting_selected}
		}).done(function() {
			var form= contextual_setting.find(".contextual_setting_form").html();
			var edition_mode= $("<input type='hidden' id='edition_mode' value='on'/>");
			$("#guide_contextual_setting_content").html(form);
			$("#guide_contextual_setting_content").append(edition_mode);
			guide_contextual_setting_form_init();
			$("#guide_contextual_setting_content").find('input[id$="_id"]').val("");
		});
	}
};

function show_sequence(selected){ 
	var locale= $("#locale").val(); 
	jQuery.ajax({
    	url: "/" + locale + "/guides/select_sequence",
		type: "GET",
		data: {"id" : selected}
  	});
};

function show_sequence_callback(sequence){
	var form= sequence.find(".sequence_form").html();
	var guide_edition_mode = $(".guide_container #edition_mode").val();
	var edition_mode= $("<input type='hidden' id='edition_mode' value='"+guide_edition_mode+"'/>");
	$("#guide_sequence_content").html(form);
	$("#guide_sequence_content").append(edition_mode);
	
	activity_sequence_form_init();
	
	var arr=$(".step_body");	
	jQuery.each(arr,function (){
		validate_resource_assignments($(this));
	});
}

function select_sequence(){
	var sequence_selected = $("#sequences .selected_elements .selection_info").find(".element_id").val();
	if (sequence_selected != "" && sequence_selected != undefined){
		var form_id= $("form").attr('id');
		if(form_id.indexOf("new") != -1){
			var url= "../guides/get_sequence";
		}else{
			var url= "../../guides/get_sequence";
		}
		jQuery.ajax({
	    	url: url,
			type: "GET",
			data: {"id" : sequence_selected}
		}).done(function() {
			var form= sequence.find(".sequence_form").html();
			var edition_mode= $("<input type='hidden' id='edition_mode' value='on'/>");
			$("#guide_sequence_content").html(form);
			$("#guide_sequence_content").append(edition_mode);
			activity_sequence_form_init();
			$("#guide_sequence_content").find('input[id$="_id"]').val("");
		});
	}
};

function new_sequence() {
	jQuery.ajax({
    	url: "new_sequence",
		type: "GET"
  	}).done(function(){
		$("#sequences +.area_popup_overlay").removeClass("active");
		$("#sequences").removeClass("active");
		$("body").css('overflow', 'auto');
	});
};

function new_sequence_callback(sequence){
	var form= sequence.find(".sequence_form").html();
	var guide_edition_mode = $(".guide_container").find("#edition_mode").val();
	if (guide_edition_mode == "on"){
		var edition_mode= $("<input type='hidden' id='edition_mode' value='on'/>");
	}else{
		var edition_mode= $("<input type='hidden' id='edition_mode' value='off'/>");
	}
	$("#guide_sequence_content").html(form);
	$("#guide_sequence_content").append(edition_mode);
	$("#guide_sequence_header .header_actions").html("");
	
	activity_sequence_form_init();
};


function new_technological_setting() {
	jQuery.ajax({
    	url: "new_technological_setting",
		type: "GET"
  	}).done(function(){
		$("#technological_settings +.area_popup_overlay").removeClass("active");
		$("#technological_settings").removeClass("active");
		$("body").css('overflow', 'auto');
	});
};

function new_technological_setting_callback(technological_setting){
	var form= technological_setting.find(".technological_setting_form").html();
	var guide_edition_mode = $(".guide_container").find("#edition_mode").val();
	if (guide_edition_mode == "on"){
		var edition_mode= $("<input type='hidden' id='edition_mode' value='on'/>");
	}else{
		var edition_mode= $("<input type='hidden' id='edition_mode' value='off'/>");
	}
	$("#guide_technological_setting_content").html(form);
	$("#guide_technological_setting_content").append(edition_mode);
	$("#guide_technological_setting_header .header_actions").html("");
	
	
	technological_setting_status = "new";
	technological_setting_form_init();
	$.colorbox.close();
};

function new_contextual_setting() {
	jQuery.ajax({
    	url: "new_contextual_setting",
		type: "GET"
  	}).done(function(){
		$("#contextual_settings +.area_popup_overlay").removeClass("active");
		$("#contextual_settings").removeClass("active");
		$("body").css('overflow', 'auto');
	});
};

function new_contextual_setting_callback(contextual_setting){
	var form= contextual_setting.find(".contextual_setting_form").html();
	var guide_edition_mode = $(".guide_container").find("#edition_mode").val();
	if (guide_edition_mode == "on"){
		var edition_mode= $("<input type='hidden' id='edition_mode' value='on'/>");
	}else{
		var edition_mode= $("<input type='hidden' id='edition_mode' value='off'/>");
	}
	$("#guide_contextual_setting_content").html(form);
	$("#guide_contextual_setting_content").append(edition_mode);
	$("#guide_contextual_setting_header .header_actions").html("");
	
	guide_contextual_setting_form_init();
	$.colorbox.close();
}

function popup_contextual_setting_form_init(){
	$("#contextual_settings #map-canvas").attr('id','popup_map-canvas');
	var latitude= $("#contextual_settings #contextual_setting_latitude").val();
	var longitude= $("#contextual_settings #contextual_setting_longitude").val();

	if(latitude != undefined && latitude != ""){
		popup_map_create(latitude, longitude, 10);
		school_address= new google.maps.LatLng(latitude, longitude);
		popup_add_marker(school_address);
	}else{
		popup_map_create("40.4167754", "-3.703790", 5);
  	}
}

function guide_contextual_setting_form_init(){
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

function save_guide_form(){
	$(".guide_form").submit();
}

function recommend_tools_call(){
	var requirement_sentence= $(requirement_row).find(".requirement_sentence").html();
	$("#tool_assignment_selection .requirement_sentence_header").html(requirement_sentence);
	
	var query_data = new Object();
	query_data.method = "Recommend.Tools.B";
	query_data.params = [];
	
	var requirements = [];
	var requirement_type = $(requirement_row).find(".requirement_type").val();
	var requirement = new Object();
	
	if (requirement_type == "AbstractRequirement"){		
		var tool_requirement_spec = new Object();
		var functionality = $(requirement_row).find(".functionality_name").html().trim();
		tool_requirement_spec.functionalities = [functionality];
		requirement.tool_requirement_spec = tool_requirement_spec;
		requirement.identifier = $(requirement_row).find("#functionality").val();	
	}else{
		var direct_tool = $(requirement_row).find(".tool_itec_id").val();
		requirement.direct_tool_requirement = direct_tool;
		requirement.identifier = "2";	
	}
	
	requirements.push(requirement);
	var learning_activities = [];
	var learning_activity = new Object();
	learning_activity.id = "1";
	learning_activity.requirements = requirements;
	learning_activities.push(learning_activity);

	var technical_setting = new Object();
	technical_setting.id= "http://itec-composer-dev.eun.org/TechnicalSetting/555555202";
	
	/*var location = new Object();
	var country = $("#contextual_setting_country").val();
	location.country= country;
	var locality = $("#contextual_setting_locality").val();
	location.locality= locality;
	var postal_code = $("#contextual_setting_postal_code").val();
	location.postalCode= postal_code;
	var street_address = $("#contextual_setting_street_address").val();
	location.streetAddress= street_address;
	technical_setting.location= location;*/
	technical_setting.tools = [];
	
	$("#technological_setting_editable_tools .selected_device_itec_id").each(function(index, element){
		var device_id = $(this).val();
		technical_setting.tools.push(device_id);
	});
	$("#technological_setting_editable_tools .selected_application_itec_id").each(function(index, element){
		var application_id = $(this).val();
		technical_setting.tools.push(application_id);
	});
	
	var contextual_setting = new Object();
	
	var age_range = $("#contextual_setting_age_range").val();
	var education_levels= [];
	$("#contextual_setting_education_level_ids_ option:selected").each(function(index, element){
		if($(element).val() != ""){
			education_levels.push(element.text);
		}
	});
	var languages= [];
	$("#contextual_setting_contextual_language_ids_ option:selected").each(function(index, element){
		if($(element).val() != ""){
			languages.push(element.text);
		}
	});
	var keywords=[];
	keywords= $("#contextual_setting_keywords").val().split(",");
	
	var subjects=[];
	$("#contextual_setting_contextual_setting_subject_annotation_attributes_subject_id option:selected").each(function(index, element){
		if($(element).val() != ""){
			subjects.push(element.text);
		}
	});
	
	var dates= new Object();
	dates.start= $("#contextual_setting_start_date").val();
	dates.end= $("#contextual_setting_end_date").val();
	
	
	contextual_setting.age_range= age_range;
	contextual_setting.education_levels= education_levels;
	contextual_setting.languages= languages;
	contextual_setting.keywords = keywords;
	contextual_setting.knowledge_areas = subjects;
	contextual_setting.dates = dates;
	//contextual_setting.location = location;
	
	var param = new Object();
	param.learning_activities = learning_activities;
	param.technical_settings = [];
	param.technical_settings.push(technical_setting);
	param.context =contextual_setting;
	
	query_data.params.push(param);
	
	query_data.jsonrpc = "2.0";
	query_data.id = "AREA_request";
	var json_text = JSON.stringify(query_data);
	//alert(json_text);
	if($("#slideThree").is(':checked')){
		var sde_url="http://itec.det.uvigo.es/itec-sde-javi-enriched/wservices/ws";
	}else{
		var sde_url="http://itec.det.uvigo.es/itec-sde-javi/wservices/ws";
	}
	jQuery.ajax({
    	url: "recommend_tools",
		type: "POST",
		data: {"request": json_text, "sde_url": sde_url}
  	});
}

function recommend_tools_callback(){
	$("#tool_assignment_selection .recommendations").html(recommended_tools);
	$("#tool_assignment_selection .recommendations").masonry('reload');
	$('#tool_list').masonry('reload');
	$("#tool_assignment_selection .recommendations").masonry('reload');
	$('#tool_list').masonry('reload');
}

function recommend_people_call(){
	var requirement_sentence= $(assignments_row).find(".requirement_sentence").html();
	$("#contributor_requirement_assignment_box .requirement_sentence_header").html(requirement_sentence);
	
	var query_data = new Object();
	query_data.method = "Recommend.People.B";
	query_data.params = [];
	
	var requirements = [];
	var requirement_type = $(assignments_row).find(".requirement_type").val();
	var requirement = new Object();
	
	if (requirement_type == "ContributorRequirement"){		
		var person_requirement_spec = new Object();
		var person_category = $(assignments_row).find(".person_category_name").html().trim();
		person_requirement_spec.person_category = [person_category];
		var person_role = $(assignments_row).find(".person_role_name").html().trim();
		if (person_role == "other"){
			person_role= "";
		}
		person_requirement_spec.person_role = [person_role];
		requirement.person_requirement_spec = person_requirement_spec;
		requirement.identifier = "1";	
	}else{
		var direct_person = $(assignments_row).find(".person_itec_id").val();
		requirement.direct_person_requirement = direct_person;
		requirement.identifier = "2";	
	}
	
	requirements.push(requirement);
	var learning_activities = [];
	var learning_activity = new Object();
	learning_activity.id = "1";
	learning_activity.requirements = requirements;
	learning_activities.push(learning_activity);

	var technical_setting = new Object();
	technical_setting.id= "http://itec-composer-dev.eun.org/TechnicalSetting/555555202";
	
	var location = new Object();
	var country = $("#contextual_setting_country").val();
	location.country= country;
	var locality = $("#contextual_setting_locality").val();
	location.locality= locality;
	var postal_code = $("#contextual_setting_postal_code").val();
	location.postalCode= postal_code;
	var street_address = $("#contextual_setting_street_address").val();
	location.streetAddress= street_address;
	technical_setting.location= location;
	technical_setting.tools = [];
	
	$("#technological_setting_editable_tools .selected_device_itec_id").each(function(index, element){
		var device_id = $(this).val();
		technical_setting.tools.push(device_id);
	});
	$("#technological_setting_editable_tools .selected_application_itec_id").each(function(index, element){
		var application_id = $(this).val();
		technical_setting.tools.push(application_id);
	});
	
	var contextual_setting = new Object();
	
	var age_range = $("#contextual_setting_age_range").val();
	var education_levels= [];
	$("#contextual_setting_education_level_ids_ option:selected").each(function(index, element){
		if($(element).val() != ""){
			education_levels.push(element.text);
		}
	});
	var languages= [];
	$("#contextual_setting_contextual_language_ids_ option:selected").each(function(index, element){
		if($(element).val() != ""){
			languages.push(element.text);
		}
	});
	var keywords=[];
	keywords= $("#contextual_setting_keywords").val().split(",");
	
	var subjects=[];
	$("#contextual_setting_contextual_setting_subject_annotation_attributes_subject_id option:selected").each(function(index, element){
		if($(element).val() != ""){
			subjects.push(element.text);
		}
	});
	
	var dates= new Object();
	dates.start= $("#contextual_setting_start_date").val();
	dates.end= $("#contextual_setting_end_date").val();
	
	var address = new Object();
	address = $("#contextual_setting_address").val()
	
	contextual_setting.age_range= age_range;
	contextual_setting.education_levels= education_levels;
	contextual_setting.languages= languages;
	contextual_setting.keywords = keywords;
	contextual_setting.knowledge_areas = subjects;
	contextual_setting.dates = dates;
	contextual_setting.location = address;
	
	var param = new Object();
	param.learning_activities = learning_activities;
	param.technical_settings = [];
	param.technical_settings.push(technical_setting);
	param.context =contextual_setting;
	
	query_data.params.push(param);
	
	query_data.jsonrpc = "2.0";
	query_data.id = "AREA_request";
	var json_text = JSON.stringify(query_data);
	//alert(json_text);
	sde_url="http://itec.det.uvigo.es/itec-sde-javi/wservices/ws"
	jQuery.ajax({
    	url: "recommend_people",
		type: "POST",
		data: {"request": json_text, "sde_url": sde_url}
  	});
	
}
function recommend_people_callback(){
	$(".area_popup.active .recommendations").html(recommended_people);
	$("#person_assignment_selection .recommendations").masonry({
	  itemSelector: '.extract_box'
	});
	$("#person_assignment_selection .recommendations").masonry('reload');
	
}

function recommend_events_call(){
	var requirement_sentence= $(assignments_row).find(".requirement_sentence").html();
	$("#event_requirement_assignment_box .requirement_sentence_header").html(requirement_sentence);
	
	var query_data = new Object();
	query_data.method = "Recommend.Events.B";
	query_data.params = [];
	
	var requirements = [];
	var requirement_type = $(assignments_row).find(".requirement_type").val();
	var requirement = new Object();
	
	if (requirement_type == "EventRequirement"){		
		var event_requirement_spec = new Object();
		var event_type = $(assignments_row).find(".event_type_name").html().trim();
		event_requirement_spec.event_type = [event_type];
		var event_place = $(assignments_row).find(".event_place_name").html().trim();
		if (event_place == "other"){
			event_place= "";
		}
		event_requirement_spec.event_place = [event_place];
		requirement.event_requirement_spec = event_requirement_spec;
		requirement.identifier = "1";	
	}else{
		var direct_event = $(assignments_row).find(".event_itec_id").val();
		requirement.direct_event_requirement = direct_event;
		requirement.identifier = "2";	
	}
	
	requirements.push(requirement);
	var learning_activities = [];
	var learning_activity = new Object();
	learning_activity.id = "1";
	learning_activity.requirements = requirements;
	learning_activities.push(learning_activity);

	var technical_setting = new Object();
	technical_setting.id= "http://itec-composer-dev.eun.org/TechnicalSetting/555555202";
	
	var location = new Object();
	var country = $("#contextual_setting_country").val();
	location.country= country;
	var locality = $("#contextual_setting_locality").val();
	location.locality= locality;
	var postal_code = $("#contextual_setting_postal_code").val();
	location.postalCode= postal_code;
	var street_address = $("#contextual_setting_street_address").val();
	location.streetAddress= street_address;
	technical_setting.location= location;
	technical_setting.tools = [];
	
	$("#technological_setting_editable_tools .selected_device_itec_id").each(function(index, element){
		var device_id = $(this).val();
		technical_setting.tools.push(device_id);
	});
	$("#technological_setting_editable_tools .selected_application_itec_id").each(function(index, element){
		var application_id = $(this).val();
		technical_setting.tools.push(application_id);
	});
	
	var contextual_setting = new Object();
	
	var age_range = $("#contextual_setting_age_range").val();
	var education_levels= [];
	$("#contextual_setting_education_level_ids_ option:selected").each(function(index, element){
		if($(element).val() != ""){
			education_levels.push(element.text);
		}
	});
	var languages= [];
	$("#contextual_setting_contextual_language_ids_ option:selected").each(function(index, element){
		if($(element).val() != ""){
			languages.push(element.text);
		}
	});
	var keywords=[];
	keywords= $("#contextual_setting_keywords").val().split(",");
	
	var subjects=[];
	$("#contextual_setting_contextual_setting_subject_annotation_attributes_subject_id option:selected").each(function(index, element){
		if($(element).val() != ""){
			subjects.push(element.text);
		}
	});
	
	var dates= new Object();
	dates.start= $("#contextual_setting_start_date").val();
	dates.end= $("#contextual_setting_end_date").val();
	
	var address = new Object();
	address = $("#contextual_setting_address").val()
	
	contextual_setting.age_range= age_range;
	contextual_setting.education_levels= education_levels;
	contextual_setting.languages= languages;
	contextual_setting.keywords = keywords;
	contextual_setting.knowledge_areas = subjects;
	contextual_setting.dates = dates;
	contextual_setting.location = address;
	
	var param = new Object();
	param.learning_activities = learning_activities;
	param.technical_settings = [];
	param.technical_settings.push(technical_setting);
	param.context =contextual_setting;
	
	query_data.params.push(param);
	
	query_data.jsonrpc = "2.0";
	query_data.id = "AREA_request";
	var json_text = JSON.stringify(query_data);
	//alert(json_text);
	sde_url="http://itec.det.uvigo.es/itec-sde-javi/wservices/ws"
	jQuery.ajax({
    	url: "recommend_events",
		type: "POST",
		data: {"request": json_text, "sde_url": sde_url}
  	});
}
function recommend_events_callback(){
	$(".recommendations").html(recommended_events);
	$(" .recommendations").masonry('reload');
	$('#events_list').masonry('reload');
	$(" .recommendations").masonry('reload');
	$('#events_list').masonry('reload');
}

function build_activity_sequence_attributes(){
	var activity_sequence_id= $(".sequence_id").find("#activity_sequence_id");
	if(activity_sequence_id.val() != ""){
		activity_sequence_id.attr('name','guide[activity_sequence_attributes][id]');
	}
	var activity_sequence_status= $(".sequence_status").find("#activity_sequence_status");
	if(activity_sequence_status.val() != ""){
		activity_sequence_status.attr('name','guide[activity_sequence_attributes][status]');
	}
	var activity_sequence_name= $(".sequence_name").find("#activity_sequence_name");
	if(activity_sequence_name.val() != ""){
		activity_sequence_name.attr('name','guide[activity_sequence_attributes][name]');
	}
	var activity_sequence_description= $(".sequence_description").find("#activity_sequence_description");
	if(activity_sequence_description.val() != ""){
		activity_sequence_description.attr('name','guide[activity_sequence_attributes][description]');
	}
	
	var activity_sequence_image= $(".activity_sequence_image").find("#activity_sequence_element_image");
	if(activity_sequence_image.val() != ""){
		activity_sequence_image.attr('name','guide[activity_sequence_attributes][element_image]');
	}
		
	$("#activity_selected_list .edit_sequence_box").each(function(index, element){
		$(element).find("#activity_id").attr('name','guide[activity_sequence_attributes][activities_attributes]['+item_index+'][id]');
		$(element).find("#activity_referenced_activity_id").attr('name','guide[activity_sequence_attributes][activities_attributes]['+item_index+'][referenced_activity_id]');
		$(element).find("#activity_status").attr('name','guide[activity_sequence_attributes][activities_attributes]['+item_index+'][status]');
		$(element).find("#activity_name").attr('name','guide[activity_sequence_attributes][activities_attributes]['+item_index+'][name]');
		$(element).find("#activity_description").attr('name','guide[activity_sequence_attributes][activities_attributes]['+item_index+'][description]');
		$(element).find("#activity_element_image").attr('name','guide[activity_sequence_attributes][activities_attributes]['+item_index+'][element_image]');
		$(element).find("#activity_position").attr('name','guide[activity_sequence_attributes][activities_attributes]['+item_index+'][position]');
		$(element).find("#activity_position").val(index +1);
		
		$(element).find(".box_container").each(function(box_index, box_element){
	 		var box_id = $(this).find("#box_id").attr('name','guide[activity_sequence_attributes][activities_attributes]['+item_index+'][boxes_attributes]['+box_index+'][id]');
			var box_type = $(this).find("#box_type").attr('name','guide[activity_sequence_attributes][activities_attributes]['+item_index+'][boxes_attributes]['+box_index+'][box_type]');
			
			$(this).find(".component_container").each(function(component_index, component_element){
		 		var component_id = $(this).find("#component_id").attr('name','guide[activity_sequence_attributes][activities_attributes]['+item_index+'][boxes_attributes]['+box_index+'][components_attributes]['+component_index+'][id]');
				var component_type = $(this).find("#component_type").attr('name','guide[activity_sequence_attributes][activities_attributes]['+item_index+'][boxes_attributes]['+box_index+'][components_attributes]['+component_index+'][component_type]');
				$(this).find(".text_container").each(function(text_index, text_container){
					var component_id = $(text_container).find(".text_id").attr('name','guide[activity_sequence_attributes][activities_attributes]['+item_index+'][boxes_attributes]['+box_index+'][components_attributes]['+component_index+'][texts_attributes]['+text_index+'][id]');
					var component_text = $(text_container).find(".text_content").attr('name','guide[activity_sequence_attributes][activities_attributes]['+item_index+'][boxes_attributes]['+box_index+'][components_attributes]['+component_index+'][texts_attributes]['+text_index+'][content]');
					if($(text_container).hasClass('deleted')){
						$(text_container).append("<input type=\"hidden\" value=\"1\" id=\"destroy\" name=\"guide[activity_sequence_attributes][activities_attributes]["+item_index+"][boxes_attributes]["+box_index+"][components_attributes]["+component_index+"][texts_attributes]["+text_index+"][_destroy]\">");
					}	
				});
				
			});
			
		});
		
		$(element).find(".requirements_body .concrete_requirement").each(function(requirement_index, requirement_element){
			var requirement_id_input = $(this).find(".requirement_id");
			requirement_id_input.attr('name','guide[activity_sequence_attributes][activities_attributes]['+item_index+'][concrete_requirements_attributes]['+ requirement_index +'][id]');
			if ($(this).hasClass("deleted")){
				$(this).append("<input type=\"hidden\" value=\"1\" id=\"destroy\" name=\"guide[activity_sequence_attributes][activities_attributes]["+item_index+"][concrete_requirements_attributes]["+ requirement_index +"][_destroy]\">");
			}else{
				var tool_id_input = $(this).find(".tool_id");
				var tool_type_input = $(this).find(".tool_type");
				if (tool_id_input.val() == ""){
					$(this).append("<input type=\"hidden\" value=\"1\" id=\"destroy\" name=\"guide[activity_sequence_attributes][activities_attributes]["+item_index+"][concrete_requirements_attributes]["+ requirement_index +"][_destroy]\">");
				}else{
					var requirement_description_textarea = $(this).find(".requirement_description");
					requirement_description_textarea.attr('name','guide[activity_sequence_attributes][activities_attributes]['+item_index+'][concrete_requirements_attributes]['+ requirement_index +'][description]');
					var requirement_optionality_select = $(this).find(".requirement_optionality");
					requirement_optionality_select.attr('name','guide[activity_sequence_attributes][activities_attributes]['+item_index+'][concrete_requirements_attributes]['+ requirement_index +'][optionality]');
					tool_id_input.attr('name','guide[activity_sequence_attributes][activities_attributes]['+item_index+'][concrete_requirements_attributes]['+ requirement_index +'][concrete_requirement_tool_annotation_attributes][tool_id]');
					tool_type_input.attr('name','guide[activity_sequence_attributes][activities_attributes]['+item_index+'][concrete_requirements_attributes]['+ requirement_index +'][concrete_requirement_tool_annotation_attributes][tool_type]');
					
					var resource_id_input = $(this).closest(".requirement_row").find(".resource_identification");
					var resource_type_input = $(this).closest(".requirement_row").find(".resource_type");
					
					if(resource_id_input.val() != ""){
						resource_id_input.attr('name','guide[activity_sequence_attributes][activities_attributes]['+item_index+'][concrete_requirements_attributes]['+ requirement_index +'][concrete_requirement_tool_assignment_attributes][tool_id]');
						resource_type_input.attr('name','guide[activity_sequence_attributes][activities_attributes]['+item_index+'][concrete_requirements_attributes]['+ requirement_index +'][concrete_requirement_tool_assignment_attributes][tool_type]');
					}
				}
				
			};
		});
		
		$(element).find(".requirements_body .person_concrete_requirement").each(function(requirement_index, requirement_element){
			var requirement_id_input = $(this).find(".requirement_id");
			requirement_id_input.attr('name','guide[activity_sequence_attributes][activities_attributes]['+item_index+'][person_concrete_requirements_attributes]['+ requirement_index +'][id]');
			if ($(this).hasClass("deleted")){
				$(this).append("<input type=\"hidden\" value=\"1\" id=\"destroy\" name=\"guide[activity_sequence_attributes][activities_attributes]["+item_index+"][person_concrete_requirements_attributes]["+ requirement_index +"][_destroy]\">");
			}else{
				var person_id_input = $(this).find(".resource_id");
				if (person_id_input.val() == ""){
					$(this).append("<input type=\"hidden\" value=\"1\" id=\"destroy\" name=\"guide[activity_sequence_attributes][activities_attributes]["+item_index+"][person_concrete_requirements_attributes]["+ requirement_index +"][_destroy]\">");
				}else{
					var requirement_description_textarea = $(this).find(".requirement_description");
					requirement_description_textarea.attr('name','guide[activity_sequence_attributes][activities_attributes]['+item_index+'][person_concrete_requirements_attributes]['+ requirement_index +'][description]');
					var requirement_optionality_select = $(this).find(".requirement_optionality");
					requirement_optionality_select.attr('name','guide[activity_sequence_attributes][activities_attributes]['+item_index+'][person_concrete_requirements_attributes]['+ requirement_index +'][optionality]');
					person_id_input.attr('name','guide[activity_sequence_attributes][activities_attributes]['+item_index+'][person_concrete_requirements_attributes]['+ requirement_index +'][person_concrete_requirement_person_annotation_attributes][person_id]');
					
					var resource_id_input = $(this).closest(".requirement_row").find(".resource_identification");
					if(resource_id_input.val() != ""){
						resource_id_input.attr('name','guide[activity_sequence_attributes][activities_attributes]['+item_index+'][person_concrete_requirements_attributes]['+ requirement_index +'][person_concrete_requirement_person_assignment_attributes][person_id]');
					}	
				}
			}
		});
		
		$(element).find(".requirements_body .event_concrete_requirement").each(function(requirement_index, requirement_element){
			var requirement_id_input = $(this).find(".requirement_id");
			requirement_id_input.attr('name','guide[activity_sequence_attributes][activities_attributes]['+item_index+'][event_concrete_requirements_attributes]['+ requirement_index +'][id]');
			if ($(this).hasClass("deleted")){
				$(this).append("<input type=\"hidden\" value=\"1\" id=\"destroy\" name=\"guide[activity_sequence_attributes][activities_attributes]["+item_index+"][event_concrete_requirements_attributes]["+ requirement_index +"][_destroy]\">");
			}else{
				var event_id_input = $(this).find(".resource_id");
				if (event_id_input.val() == ""){
					$(this).append("<input type=\"hidden\" value=\"1\" id=\"destroy\" name=\"guide[activity_sequence_attributes][activities_attributes]["+item_index+"][event_concrete_requirements_attributes]["+ requirement_index +"][_destroy]\">");
				}else{
					var requirement_description_textarea = $(this).find(".requirement_description");
					requirement_description_textarea.attr('name','guide[activity_sequence_attributes][activities_attributes]['+item_index+'][event_concrete_requirements_attributes]['+ requirement_index +'][description]');
					var requirement_optionality_select = $(this).find(".requirement_optionality");
					requirement_optionality_select.attr('name','guide[activity_sequence_attributes][activities_attributes]['+item_index+'][event_concrete_requirements_attributes]['+ requirement_index +'][optionality]');
					event_id_input.attr('name','guide[activity_sequence_attributes][activities_attributes]['+item_index+'][event_concrete_requirements_attributes]['+ requirement_index +'][event_concrete_requirement_event_annotation_attributes][event_id]');
					
					var resource_id_input = $(this).closest(".requirement_row").find(".resource_identification");
					if(resource_id_input.val() != ""){
						resource_id_input.attr('name','guide[activity_sequence_attributes][activities_attributes]['+item_index+'][event_concrete_requirements_attributes]['+ requirement_index +'][event_concrete_requirement_event_assignment_attributes][event_id]');
					}
				}
				
			}
		});
		
		$(element).find(".requirements_body .abstract_requirement").each(function(requirement_index, requirement_element){
			var requirement_id_input = $(this).find(".requirement_id");
			requirement_id_input.attr('name','guide[activity_sequence_attributes][activities_attributes]['+item_index+'][abstract_requirements_attributes]['+ requirement_index +'][id]');
			if ($(this).hasClass("deleted")){
				$(this).append("<input type=\"hidden\" value=\"1\" id=\"destroy\" name=\"guide[activity_sequence_attributes][activities_attributes]["+item_index+"][abstract_requirements_attributes]["+ requirement_index +"][_destroy]\">");
			}else{
				var functionality_id_select = $(this).find("#functionality");
				if (functionality_id_select.val() == ""){
					$(this).append("<input type=\"hidden\" value=\"1\" id=\"destroy\" name=\"guide[activity_sequence_attributes][activities_attributes]["+item_index+"][abstract_requirements_attributes]["+ requirement_index +"][_destroy]\">");
				}else{
					var requirement_description_textarea = $(this).find(".requirement_description");
					requirement_description_textarea.attr('name','guide[activity_sequence_attributes][activities_attributes]['+item_index+'][abstract_requirements_attributes]['+ requirement_index +'][description]');
					var requirement_optionality_select = $(this).find(".requirement_optionality");
					requirement_optionality_select.attr('name','guide[activity_sequence_attributes][activities_attributes]['+item_index+'][abstract_requirements_attributes]['+ requirement_index +'][optionality]');
					functionality_id_select.attr('name','guide[activity_sequence_attributes][activities_attributes]['+item_index+'][abstract_requirements_attributes]['+ requirement_index +'][abstract_requirement_functionality_annotation_attributes][functionality_id]');
					
					var resource_id_input = $(this).closest(".requirement_row").find(".resource_identification");
					var resource_type_input = $(this).closest(".requirement_row").find(".resource_type");
					if(resource_id_input.val() != ""){
						resource_id_input.attr('name','guide[activity_sequence_attributes][activities_attributes]['+item_index+'][abstract_requirements_attributes]['+ requirement_index +'][abstract_requirement_tool_assignment_attributes][tool_id]');
						resource_type_input.attr('name','guide[activity_sequence_attributes][activities_attributes]['+item_index+'][abstract_requirements_attributes]['+ requirement_index +'][abstract_requirement_tool_assignment_attributes][tool_type]');
					}
				}
			}
			
		});
		
		$(element).find(".requirements_body .contributor_requirement").each(function(requirement_index, requirement_element){
			var requirement_id_input = $(this).find(".requirement_id");
			requirement_id_input.attr('name','guide[activity_sequence_attributes][activities_attributes]['+item_index+'][contributor_requirements_attributes]['+ requirement_index +'][id]');
			if ($(this).hasClass("deleted")){
				$(this).append("<input type=\"hidden\" value=\"1\" id=\"destroy\" name=\"guide[activity_sequence_attributes][activities_attributes]["+item_index+"][contributor_requirements_attributes]["+ requirement_index +"][_destroy]\">");
			}else{
				var person_category_id_select = $(this).find("#person_category");
				var person_role_id_select = $(this).find("#person_role");
				if (person_category_id_select.val() == "" || person_role_id_select.val() == ""){
					$(this).append("<input type=\"hidden\" value=\"1\" id=\"destroy\" name=\"guide[activity_sequence_attributes][activities_attributes]["+item_index+"][contributor_requirements_attributes]["+ requirement_index +"][_destroy]\">");
				}else{
					var requirement_description_textarea = $(this).find(".requirement_description");
					requirement_description_textarea.attr('name','guide[activity_sequence_attributes][activities_attributes]['+item_index+'][contributor_requirements_attributes]['+ requirement_index +'][description]');
					var requirement_optionality_select = $(this).find(".requirement_optionality");
					requirement_optionality_select.attr('name','guide[activity_sequence_attributes][activities_attributes]['+item_index+'][contributor_requirements_attributes]['+ requirement_index +'][optionality]');
					person_category_id_select.attr('name','guide[activity_sequence_attributes][activities_attributes]['+item_index+'][contributor_requirements_attributes]['+ requirement_index +'][contributor_requirement_person_category_annotation_attributes][person_category_id]');
					person_role_id_select.attr('name','guide[activity_sequence_attributes][activities_attributes]['+item_index+'][contributor_requirements_attributes]['+ requirement_index +'][contributor_requirement_person_role_annotation_attributes][person_role_id]');
					
					var resource_id_input = $(this).closest(".requirement_row").find(".resource_identification");
					if(resource_id_input.val() != ""){
						resource_id_input.attr('name','guide[activity_sequence_attributes][activities_attributes]['+item_index+'][contributor_requirements_attributes]['+ requirement_index +'][contributor_requirement_person_assignment_attributes][person_id]');
					}
				}
			}
		});
		
		$(element).find(".requirements_body .event_requirement").each(function(requirement_index, requirement_element){
			var requirement_id_input = $(this).find(".requirement_id");
			requirement_id_input.attr('name','guide[activity_sequence_attributes][activities_attributes]['+item_index+'][event_requirements_attributes]['+ requirement_index +'][id]');
			if ($(this).hasClass("deleted")){
				$(this).append("<input type=\"hidden\" value=\"1\" id=\"destroy\" name=\"guide[activity_sequence_attributes][activities_attributes]["+item_index+"][event_requirements_attributes]["+ requirement_index +"][_destroy]\">");
			}else{
				var event_type_id_select = $(this).find("#event_type");
				var event_place_id_select = $(this).find("#event_place");
				if (event_type_id_select.val() == "" || event_place_id_select.val() == ""){
					$(this).append("<input type=\"hidden\" value=\"1\" id=\"destroy\" name=\"guide[activity_sequence_attributes][activities_attributes]["+item_index+"][event_requirements_attributes]["+ requirement_index +"][_destroy]\">");
				}else{
					var requirement_description_textarea = $(this).find(".requirement_description");
					requirement_description_textarea.attr('name','guide[activity_sequence_attributes][activities_attributes]['+item_index+'][event_requirements_attributes]['+ requirement_index +'][description]');
					var requirement_optionality_select = $(this).find(".requirement_optionality");
					requirement_optionality_select.attr('name','guide[activity_sequence_attributes][activities_attributes]['+item_index+'][event_requirements_attributes]['+ requirement_index +'][optionality]');
					event_type_id_select.attr('name','guide[activity_sequence_attributes][activities_attributes]['+item_index+'][event_requirements_attributes]['+ requirement_index +'][event_requirement_event_type_annotation_attributes][event_type_id]');
					event_place_id_select.attr('name','guide[activity_sequence_attributes][activities_attributes]['+item_index+'][event_requirements_attributes]['+ requirement_index +'][event_requirement_event_place_annotation_attributes][event_place_id]');
					
					var resource_id_input = $(this).closest(".requirement_row").find(".resource_identification");
					if(resource_id_input.val() != ""){
						resource_id_input.attr('name','guide[activity_sequence_attributes][activities_attributes]['+item_index+'][event_requirements_attributes]['+ requirement_index +'][event_requirement_event_assignment_attributes][event_id]');
					}
				}
			}
		});
				
		item_index++
	});
}

function build_technological_setting_attributes(){
	var attributes= $("#guide_technological_setting_content #attributes");
	attributes.html("");
	var technological_setting_id= $("#guide_technological_setting_content").find("#technological_setting_id");
	if(technological_setting_id.val() != ""){
		technological_setting_id.attr('name','guide[technological_setting_attributes][id]');
	}	
	var technological_setting_name= $("#guide_technological_setting_content").find("#technological_setting_name");
	if(technological_setting_name.val() != ""){
		technological_setting_name.attr('name','guide[technological_setting_attributes][name]');
	}
	var technological_setting_description= $("#guide_technological_setting_content").find("#technological_setting_description");
	if(technological_setting_description.val() != ""){
		technological_setting_description.attr('name','guide[technological_setting_attributes][description]');
	}
	var technological_setting_status= $("#guide_technological_setting_content").find("#technological_setting_status");
	if(technological_setting_status != ""){
		technological_setting_status.attr('name','guide[technological_setting_attributes][status]');
	}
	$(".devices .device_square_box").each(function(index, element){
		var device_id = $(this).find(".selected_device_id").html();
		attributes.append("<input id=\"technological_setting_technological_setting_device_annotations_attributes_" + index + "_device_id\" type=\"text\" value= \""+device_id +"\" size=\"30\" name=\"guide[technological_setting_attributes][technological_setting_device_annotations_attributes][" + index + "][device_id]\">");					
	});
	$(".applications .application_square_box").each(function(index, element){
		var application_id = $(this).find(".selected_application_id").html();
		attributes.append("<input id=\"technological_setting_technological_setting_application_annotations_attributes_" + index + "_application_id\" type=\"text\" value= \""+application_id +"\" size=\"30\" name=\"guide[technological_setting_attributes][technological_setting_application_annotations_attributes][" + index + "][application_id]\">");				
	});
}

function build_contextual_setting_attributes(){
	var contextual_setting_id= $("#guide_contextual_setting_content").find("#contextual_setting_id");
	if(contextual_setting_id.val() != ""){
		contextual_setting_id.attr('name','guide[contextual_setting_attributes][id]');
	}
	var contextual_setting_name= $("#guide_contextual_setting_content").find("#contextual_setting_name");
	if (contextual_setting_name.val() != ""){
		contextual_setting_name.attr('name','guide[contextual_setting_attributes][name]');
	}
	var contextual_setting_description= $("#guide_contextual_setting_content").find("#contextual_setting_description");
	if(contextual_setting_description.val() != ""){
		contextual_setting_description.attr('name','guide[contextual_setting_attributes][description]');
	}
	var contextual_setting_status= $("#guide_contextual_setting_content").find("#contextual_setting_status");
	if(contextual_setting_status != ""){
		contextual_setting_status.attr('name','guide[contextual_setting_attributes][status]');
	}		
	var contextual_setting_subject= $("#guide_contextual_setting_content").find("#contextual_setting_contextual_setting_subject_annotation_attributes_subject_id");
	contextual_setting_subject.attr('name','guide[contextual_setting_attributes][contextual_setting_subject_annotation_attributes][subject_id]');
	var contextual_setting_age_range= $("#guide_contextual_setting_content").find("#contextual_setting_age_range");
	if(contextual_setting_age_range.val() != ""){
		contextual_setting_age_range.attr('name','guide[contextual_setting_attributes][age_range]');
	}
	var contextual_setting_education_level= $("#guide_contextual_setting_content").find("#contextual_setting_education_level_ids_");
	contextual_setting_education_level.attr('name','guide[contextual_setting_attributes][education_level_ids][]');
	var contextual_setting_language= $("#guide_contextual_setting_content").find("#contextual_setting_contextual_language_ids_");
	contextual_setting_language.attr('name','guide[contextual_setting_attributes][contextual_language_ids][]');
	var contextual_setting_address= $("#guide_contextual_setting_content").find("#contextual_setting_address");
	if(contextual_setting_address.val() != ""){
		contextual_setting_address.attr('name','guide[contextual_setting_attributes][address]');
	}
	var contextual_setting_latitude= $("#guide_contextual_setting_content").find("#contextual_setting_latitude");
	if(contextual_setting_latitude.val() != ""){
		contextual_setting_latitude.attr('name','guide[contextual_setting_attributes][latitude]');
	}
	var contextual_setting_longitude= $("#guide_contextual_setting_content").find("#contextual_setting_longitude");
	if(contextual_setting_longitude.val() != ""){
		contextual_setting_longitude.attr('name','guide[contextual_setting_attributes][longitude]');
	}
	var contextual_setting_start_date= $("#guide_contextual_setting_content").find("#contextual_setting_start_date");
	if(contextual_setting_start_date.val() != ""){
		contextual_setting_start_date.attr('name','guide[contextual_setting_attributes][start_date]');
	}
	var contextual_setting_end_date= $("#guide_contextual_setting_content").find("#contextual_setting_end_date");
	if(contextual_setting_end_date.val() != ""){
		contextual_setting_end_date.attr('name','guide[contextual_setting_attributes][end_date]');
	}
	var contextual_setting_keywords= $("#guide_contextual_setting_content").find("#contextual_setting_keywords");
	if(contextual_setting_keywords.val() != ""){
		contextual_setting_keywords.attr('name','guide[contextual_setting_attributes][keywords]');
	}
}

function guide_submit(){
	build_technological_setting_attributes();
	build_contextual_setting_attributes();
	build_activity_sequence_attributes();
	
	return true;
}


function change_triangle(src){
	if (src.indexOf("triangle_up.png") != -1){
		src = "";
		src="/images/triangle_down.png";
		return src;
	}
	else {
		src = "";
		src="/images/triangle_up.png";
		return src;
	}
}


function get_best_recommendation(row){
	var requirement_sentence= $(row).find(".requirement_sentence").html();
	$("#tool_assignment_selection .requirement_sentence_header").html(requirement_sentence);
	
	var query_data = new Object();
	query_data.method = "Recommend.Tools.B";
	query_data.params = [];
	
	var requirements = [];
	var requirement_type = $(row).find(".requirement_type").val();
	var requirement = new Object();
	
	if (requirement_type == "AbstractRequirement"){		
		var tool_requirement_spec = new Object();
		var functionality = $(row).find(".functionality_name").html().trim();
		tool_requirement_spec.functionalities = [functionality];
		requirement.tool_requirement_spec = tool_requirement_spec;
		requirement.identifier = $(row).find("#functionality").val();	
	}else{
		var direct_tool = $(row).find(".tool_itec_id").val();
		requirement.direct_tool_requirement = direct_tool;
		requirement.identifier = "2";	
	}
	
	requirements.push(requirement);
	var learning_activities = [];
	var learning_activity = new Object();
	learning_activity.id = "1";
	learning_activity.requirements = requirements;
	learning_activities.push(learning_activity);

	var technical_setting = new Object();
	technical_setting.id= "http://itec-composer-dev.eun.org/TechnicalSetting/555555202";
	
	/*var location = new Object();
	var country = $("#contextual_setting_country").val();
	location.country= country;
	var locality = $("#contextual_setting_locality").val();
	location.locality= locality;
	var postal_code = $("#contextual_setting_postal_code").val();
	location.postalCode= postal_code;
	var street_address = $("#contextual_setting_street_address").val();
	location.streetAddress= street_address;
	technical_setting.location= location;*/
	technical_setting.tools = [];
	
	$("#technological_setting_editable_tools .selected_device_itec_id").each(function(index, element){
		var device_id = $(this).val();
		technical_setting.tools.push(device_id);
	});
	$("#technological_setting_editable_tools .selected_application_itec_id").each(function(index, element){
		var application_id = $(this).val();
		technical_setting.tools.push(application_id);
	});
	
	var contextual_setting = new Object();
	
	var age_range = $("#contextual_setting_age_range").val();
	var education_levels= [];
	$("#contextual_setting_education_level_ids_ option:selected").each(function(index, element){
		if($(element).val() != ""){
			education_levels.push(element.text);
		}
	});
	var languages= [];
	$("#contextual_setting_contextual_language_ids_ option:selected").each(function(index, element){
		if($(element).val() != ""){
			languages.push(element.text);
		}
	});
	var keywords=[];
	keywords= $("#contextual_setting_keywords").val().split(",");
	
	var subjects=[];
	$("#contextual_setting_contextual_setting_subject_annotation_attributes_subject_id option:selected").each(function(index, element){
		if($(element).val() != ""){
			subjects.push(element.text);
		}
	});
	
	var dates= new Object();
	dates.start= $("#contextual_setting_start_date").val();
	dates.end= $("#contextual_setting_end_date").val();
	
	
	contextual_setting.age_range= age_range;
	contextual_setting.education_levels= education_levels;
	contextual_setting.languages= languages;
	contextual_setting.keywords = keywords;
	contextual_setting.knowledge_areas = subjects;
	contextual_setting.dates = dates;
	//contextual_setting.location = location;
	
	var param = new Object();
	param.learning_activities = learning_activities;
	param.technical_settings = [];
	param.technical_settings.push(technical_setting);
	param.context =contextual_setting;
	
	query_data.params.push(param);
	
	query_data.jsonrpc = "2.0";
	query_data.id = "AREA_request";
	var json_text = JSON.stringify(query_data);
	//alert(json_text);
	if($("#slideThree").is(':checked')){
		var sde_url="http://itec.det.uvigo.es/itec-sde-javi-enriched/wservices/ws";
	}else{
		var sde_url="http://itec.det.uvigo.es/itec-sde-javi/wservices/ws";
	}
	jQuery.ajax({
    	url: "recommend_tools",
		type: "POST",
		async:true,
		data: {"request": json_text, "sde_url": sde_url}		
	}).done(function() {
		var recommended_tools_object=jQuery.parseHTML(recommended_tools);
		var tool_selected_class=$(recommended_tools_object).find(".element_class").val();
		var tool_selected_id=$(recommended_tools_object).find(".element_id").val();
		var tool_selected_name=$(recommended_tools_object).find(".element_name").val();		
		
		
		tool_selected_class= tool_selected_class.charAt(0).toUpperCase() + tool_selected_class.slice(1);
		row.find(".resource_cell").removeClass("uncovered");
		row.find(".resource_cell").addClass("covered");
		if(tool_selected_name==""){tool_selected_name= "Resource (No name)";};
		row.find(".resource p").html(tool_selected_name);
		row.find(".resource_type").val(tool_selected_class);
		row.find(".resource_identification").val(tool_selected_id);
		
		//validate_resource_assignments($(requirement_row).closest(".step_body"));
		
		var tool_selected_id = $(row).find("#resource_identification").val();
		var tool_selected_class = $(row).find("#resource_type").val(); 
		validate_tool_assignment($(row),$(row).find("#functionality").val(),tool_selected_class,tool_selected_id);	
			
		
		
  	});
}





