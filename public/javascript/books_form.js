$(document).ready(function() 
{
	book_form_init();
});

function book_form_init()
{
	confirmation_needed = true;
	/*check_edition_mode(".lre_container");*/				
   	if ($("#is_edition").attr("data-value")=="true"){
   		$(".book_description textarea").autosize();
		$(".book_name textarea").autosize();   		
	}
}

function save_book_form()
{
	$(".book_subjects .subject_item").each(function(index, element){
		$(element).find(".subject").attr('name','book[book_subject_annotations_attributes]['+index+'][subject_id]');		
	});
		
	confirmation_needed = false;
	$(".book_form").submit();
}

function add_subject(element)
{
	subject =$('<div class="subject_item">').append($("#snippets_library .subject_item").clone()).html();
	$(".book_subjects .field_body").append(subject);
}

function delete_subject (element){
	$(element).closest(".subject_item").remove();
}
