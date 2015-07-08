$(document).ready(function() 
{
	documentary_form_init();
});

function documentary_form_init()
{
	confirmation_needed = true;
	/*check_edition_mode(".documentary_container");*/				
   	if ($("#is_edition").attr("data-value")=="true"){
   		$(".documentary_description textarea").autosize();
		$(".documentary_name textarea").autosize();   		
	}
}

function save_documentary_form()
{
	$(".documentary_subjects .subject_item").each(function(index, element){
		$(element).find(".subject").attr('name','documentary[documentary_subject_annotations_attributes]['+index+'][subject_id]');		
	});
		
	confirmation_needed = false;
	$(".documentary_form").submit();
}

function add_subject(element)
{
	subject =$('<div class="subject_item">').append($("#snippets_library .subject_item").clone()).html();
	$(".documentary_subjects .field_body").append(subject);
}

function delete_subject (element){
	$(element).closest(".subject_item").remove();
}