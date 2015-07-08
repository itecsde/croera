$(document).ready(function() 
{
	group_form_init();
});

function group_form_init()
{
	confirmation_needed = true;
	check_edition_mode(".group_container");
	$(".group_description textarea").autosize();
	//check_selected_users();
	update_users_group_selected();
	init_masonry('#user_list');
	popup_infinite_scroll_init('#group_user_selection #user_list','.extract_box', '"#group_user_selection .popup_body:first"', 'group_user_selection');
	/*$(".group_form").submit(function(e){
		var i = 0;
		$('.users .extract_box').each(function(index, element) {
			$("#attributes").append("<input id=\"group_group_user_annotations_attributes_" + i + "_user_id\" type=\"text\" size=\"30\" name=\"group[group_user_annotations_attributes][" + i + "][user_id]\">");
			var user_id = $(this).find(".selected_user_id").html();
			$("#group_group_user_annotations_attributes_" + i + "_user_id").val(user_id);
			i++;
		});		
	});*/
}


function save_group_form()
{	
	$(".users .small_extract_box .selection_info_box .element_id").each(function(index, element){
		$(element).attr('name','group[group_user_annotations_attributes]['+index+'][user_id]');		
	});
	confirmation_needed = false;
	$(".group_form").submit();
}


function remove_group_user_selection_popup_content() {
	$("#group_user_selection .popup_content .popup_body #user_list").empty();
}


function update_users_group_selected(){
	var users_popup = $("#group_user_selection");
	var selected_users = users_popup.find(".selected_elements");
	
	$(".users .small_extract_box .selection_info_box").each (function(index, user_node){
		//Vemos si ya seleccionado, si no se pone como seleccionado		
		if ($(selected_users).find(".selection_info .element_id[value="+$(user_node).find(".element_id").val()+"]").size()==0){
			$(selected_users).append($(user_node).find(".selection_info").clone());
		}
		//Actualizamos los botones de + y - para que salga el adecuado. Si + Activo lo pongo inactivo y activo el menos
		if ($("#group_user_selection .extract_box .selection_info_box .element_id[value="+$(user_node).find(".element_id").val()+"]").closest(".extract_box").find(".selection_button").hasClass("active")){
			$("#group_user_selection .extract_box .selection_info_box .element_id[value="+$(user_node).find(".element_id").val()+"]").closest(".extract_box").find(".selection_button").toggleClass("active");
			$("#group_user_selection .extract_box .selection_info_box .element_id[value="+$(user_node).find(".element_id").val()+"]").closest(".extract_box").find(".deselection_button").toggleClass("active");
			$("#group_user_selection .extract_box .selection_info_box .element_id[value="+$(user_node).find(".element_id").val()+"]").closest(".extract_box").css('opacity','0.7');
		}
			
				
	});
	
	
	
	
}

function check_selected_users(){
	var users_popup = $("#group_user_selection");
	var selected_users = users_popup.find(".selected_elements");
	$(".selected_user_id").each(function(index, element){
		user_id = $(element).html();
		user_extract_box= $("#group_user_selection .extract_box .selection_info_box .element_id[value="+user_id+"]").closest(".extract_box");
		user_selection_info= user_extract_box.find(".selection_info_box");
		selected_users.append(user_selection_info.html());
		user_extract_box.find(".selection_button").toggleClass("active");
		user_extract_box.find(".deselection_button").toggleClass("active");
		user_extract_box.css('opacity','0.7');
	});
}

function select_group_user(){
	var selected_user_info = $("#group_user_selection .selected_elements .selection_info:last");
	var selected_user_id= selected_user_info.find(".element_id").val();
	var selected_user_name= selected_user_info.find(".element_name").val();
	
	
	//Obtenemos parte del html del user del popup para introducirlo en la vista del formulario.
	$("#group_user_selection .popup_content :input.element_id[type=hidden]").each(function(index, element) {
		if ($(element).val()==selected_user_id){
			user_image = $(element).closest(".extract_box").find(".extract_box_button .image_preview").attr('src');
			user_name = $(element).closest(".extract_box").find(".extract_box_button .extract_name").text();
			var html_user_new = '<div class="small_extract_box" style="background-image: url(\'' + user_image + '\')"><div class="deselection_button_always_visible" onclick="remove_user_from_group_form(this);"><span class="selection_icon_always_visible">-</span></div></div>';
			html_user_new = $(html_user_new).append($(element).closest(".selection_info_box").clone());
			html_user_new.append('<div class="small_extract_box_footer"><p>'+user_name+'</p></div></div>');
			//html_user_new=$(html_user_new).append($(element).closest(".extract_box").find(".extract_box_button").clone());
			$(".users").append(html_user_new);
			//$(".users").append($(element).closest(".extract_box").clone());
		}
	});
	//$(".users").masonry();
	
	
	
	/*user_square_box = $("#elements_library #new_user_square_box .user_square_box").clone();
	user_square_box.find(".trash").attr('name', selected_user_id);
	user_square_box.find(".view_details_button").attr('onclick', 'user_details_view('+selected_user_id+',this)');
	user_square_box.find(".selected_user_id").attr('name', selected_user_id);
	user_square_box.find(".selected_user_id").html(selected_user_id);
	user_square_box.find(".selected_user_name").html(selected_user_name);
	$(".users").append(user_square_box);*/
}

function deselect_group_user(){
	var deselected_user_info = $("#group_user_selection .deselected_element .selection_info");
	var deselected_user_id= deselected_user_info.find(".element_id").val();
	deselected_user_info.remove();
	//user_box_deselected=$(".users .user_square_box .selected_user_id[name="+deselected_user_id+"]").closest(".user_square_box").remove();
	//Eliminamos del formulario el usuario deseleccionado
	user_box_deselected=$(".users .small_extract_box :input.element_id[value="+deselected_user_id+"]").closest(".small_extract_box").remove();

}

function deselect_user(trash_button){
	var deselect_user_id = $(trash_button).attr("name");
	$("#group_user_selection .extract_box .selection_info_box .element_id[value="+deselect_user_id+"]").closest(".extract_box").find(".deselection_button").click();	
}


/**
 * Funcion que elimina a un usuario del grupo. (Graficamente y de inputs ocultos del formulario)
 * @param {Object} element
 */
function remove_user_from_group_form(element){	
	var deselect_user_id=$(element).closest(".small_extract_box").find(".selection_info_box .selection_info .element_id").val();
	//Tengo que borrar por un lado el elemento de los inputs ocultos de selected_elements y ademas cambiar el estado de los usuarios del popup para acutalizar 
	$("#group_user_selection .selected_elements .selection_info").each (function(index, nodo){
		if (($(nodo).find(".element_id")).val()==deselect_user_id){
			$(nodo).remove();
			$("#group_user_selection .extract_box .selection_info_box .element_id[value="+deselect_user_id+"]").closest(".extract_box").find(".selection_button").toggleClass("active");
			$("#group_user_selection .extract_box .selection_info_box .element_id[value="+deselect_user_id+"]").closest(".extract_box").find(".deselection_button").toggleClass("active");
			$("#group_user_selection .extract_box .selection_info_box .element_id[value="+deselect_user_id+"]").closest(".extract_box").css('opacity','1');
		}
	});
	//Borro el elemento de la lista de usuarios del formulario	
	$(element).closest(".small_extract_box").remove();
}


