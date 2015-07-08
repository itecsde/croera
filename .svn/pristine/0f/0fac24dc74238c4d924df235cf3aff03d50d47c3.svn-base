$(document).ready(function(){
	if($(".technological_setting_container").index() != -1 && $(".guide_container").index() == -1){
		technological_setting_form_init();
	}
});

function technological_setting_form_init()
{	
	check_edition_mode(".technological_setting_container");
	$("#technological_setting_description").autosize();
	$(".view_details_button").colorbox({inline:true, width:"70%", height: "90%"});
	check_selected_tools();
	$(".technological_setting_form").submit(function(e){
		var i = 0;
		$('.devices .device_square_box').each(function(index, element) {
			$("#attributes").append("<input id=\"technological_setting_technological_setting_device_annotations_attributes_" + i + "_device_id\" type=\"text\" size=\"30\" name=\"technological_setting[technological_setting_device_annotations_attributes][" + i + "][device_id]\">");
			var device_id = $(this).find(".selected_device_id").html();
			$("#technological_setting_technological_setting_device_annotations_attributes_" + i + "_device_id").val(device_id);
			i++;
		});
		i = 0;
		$('.applications .application_square_box').each(function(index, element) {
			$("#attributes").append("<input id=\"technological_setting_technological_setting_application_annotations_attributes_" + i + "_application_id\" type=\"text\" size=\"30\" name=\"technological_setting[technological_setting_application_annotations_attributes][" + i + "][application_id]\">");
			var application_id = $(this).find(".selected_application_id").html();
			$("#technological_setting_technological_setting_application_annotations_attributes_" + i + "_application_id").val(application_id);
			i++;
		});
	});
	
}

function check_selected_tools(){
	var devices_popup = $("#technological_setting_device_selection");
	var selected_devices = devices_popup.find(".selected_elements");
	$(".selected_device_id").each(function(index, element){
		device_id = $(element).html();
		device_extract_box= $("#technological_setting_device_selection .extract_box .selection_info_box .element_id[value="+device_id+"]").closest(".extract_box");
		device_selection_info= device_extract_box.find(".selection_info_box");
		selected_devices.append(device_selection_info.html());
		device_extract_box.find(".selection_button").toggleClass("active");
		device_extract_box.find(".deselection_button").toggleClass("active");
		device_extract_box.css('opacity','0.7');
	});
	var application_popup = $("#technological_setting_device_selection");
	var selected_applications = application_popup.find(".selected_elements");
	$(".selected_application_id").each(function(index, element){
		application_id = $(element).html();
		application_extract_box= $("#technological_setting_application_selection .extract_box .selection_info_box .element_id[value="+application_id+"]").closest(".extract_box");
		application_selection_info= application_extract_box.find(".selection_info_box");
		selected_applications.append(application_selection_info.html());
		application_extract_box.find(".selection_button").toggleClass("active");
		application_extract_box.find(".deselection_button").toggleClass("active");
		application_extract_box.css('opacity','0.7');
	});
}

function select_ts_device(){
	var selected_device_info = $("#technological_setting_device_selection .selected_elements .selection_info:last");
	var selected_device_id= selected_device_info.find(".element_id").val();
	var selected_device_name= selected_device_info.find(".element_name").val();
	var selected_device_itec_id= selected_device_info.find(".itec_id").val();
	var selected_device_ld_id= selected_device_info.find(".ld_id").val();
	
	device_square_box = $("#elements_library #new_device_square_box .device_square_box").clone();
	device_square_box.find(".trash").attr('name', selected_device_id);
	device_square_box.find(".view_details_button").attr('onclick', 'tool_details_view('+selected_device_id+',this)');
	device_square_box.find(".selected_device_id").attr('name', selected_device_id);
	device_square_box.find(".selected_device_id").html(selected_device_id);
	device_square_box.find(".selected_device_name").html(selected_device_name);
	device_square_box.find(".selected_device_itec_id").val(selected_device_itec_id);
	device_square_box.find(".selected_device_ld_id").val(selected_device_ld_id);
	$(".devices").append(device_square_box);
}

function deselect_ts_device(){
	var deselected_device_info = $("#technological_setting_device_selection .deselected_element .selection_info");
	var deselected_device_id= deselected_device_info.find(".element_id").val();
	deselected_device_info.remove();
	device_box_deselected=$(".devices .device_square_box .selected_device_id[name="+deselected_device_id+"]").closest(".device_square_box").remove();
}

function deselect_device(trash_button){
	var deselect_device_id = $(trash_button).attr("name");
	$("#technological_setting_device_selection .extract_box .selection_info_box .element_id[value="+deselect_device_id+"]").closest(".extract_box").find(".deselection_button").click();	
}

function select_ts_application(){
	var selected_application_info = $("#technological_setting_application_selection .selected_elements .selection_info:last");
	var selected_application_id= selected_application_info.find(".element_id").val();
	var selected_application_name= selected_application_info.find(".element_name").val();
	var selected_application_itec_id= selected_application_info.find(".itec_id").val();
	var selected_application_ld_id= selected_application_info.find(".ld_id").val();
	
	application_square_box = $("#elements_library #new_application_square_box .application_square_box").clone();
	application_square_box.find(".trash").attr('name', selected_application_id);
	application_square_box.find(".view_details_button").attr('onclick', 'tool_details_view('+selected_application_id+',this)');
	application_square_box.find(".selected_application_id").attr('name', selected_application_id);
	application_square_box.find(".selected_application_id").html(selected_application_id);
	application_square_box.find(".selected_application_name").html(selected_application_name);
	application_square_box.find(".selected_application_itec_id").val(selected_application_itec_id);
	application_square_box.find(".selected_application_ld_id").val(selected_application_ld_id);
	$(".applications").append(application_square_box);	
}

function deselect_ts_application(){
	var deselected_application_info = $("#technological_setting_application_selection .deselected_element .selection_info");
	var deselected_application_id= deselected_application_info.find(".element_id").val();
	deselected_application_info.remove();
	application_box_deselected=$(".applications .application_square_box .selected_application_id[name="+deselected_application_id+"]").closest(".application_square_box").remove();
}

function deselect_application(trash_button) { 
	var deselect_application_id = $(trash_button).attr("name");
	$("#technological_setting_application_selection .extract_box .selection_info_box .element_id[value="+deselect_application_id+"]").closest(".extract_box").find(".deselection_button").click();			
};

function save_technological_setting_form(){
	confirmation_needed = false;
	$(".technological_setting_form").submit();
}
