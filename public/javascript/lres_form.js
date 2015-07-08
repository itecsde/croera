$(document).ready(function() 
{
	lre_form_init();
});

function lre_form_init()
{
	confirmation_needed = true;
	/*check_edition_mode(".lre_container");*/				
   	if ($("#is_edition").attr("data-value")=="true"){
   		$(".lre_description textarea").autosize();
		$(".lre_name textarea").autosize();   		
	}
}

function save_lre_form()
{
	$(".lre_subjects .subject_item").each(function(index, element){
		$(element).find(".subject").attr('name','lre[lre_subject_annotations_attributes]['+index+'][subject_id]');		
	});
		
	confirmation_needed = false;
	$(".lre_form").submit();
}

function add_subject(element)
{
	subject =$('<div class="subject_item">').append($("#snippets_library .subject_item").clone()).html();
	$(".lre_subjects .field_body").append(subject);
}

function delete_subject (element){
	$(element).closest(".subject_item").remove();
}
