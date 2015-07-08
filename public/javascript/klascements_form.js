$(document).ready(function() 
{
	klascement_form_init();
});

function klascement_form_init()
{
	confirmation_needed = true;
	/*check_edition_mode(".lre_container");*/				
   	if ($("#is_edition").attr("data-value")=="true"){
   		$(".klascement_description textarea").autosize();
		$(".klascement_name textarea").autosize();   		
	}
}

function save_klascement_form()
{
	$(".klascement_subjects .subject_item").each(function(index, element){
		$(element).find(".subject").attr('name','klascement[klascement_subject_annotations_attributes]['+index+'][subject_id]');		
	});
		
	confirmation_needed = false;
	$(".klascement_form").submit();
}

function add_subject(element)
{
	subject =$('<div class="subject_item">').append($("#snippets_library .subject_item").clone()).html();
	$(".klascement_subjects .field_body").append(subject);
}

function delete_subject (element){
	$(element).closest(".subject_item").remove();
}
