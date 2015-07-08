$(document).ready(function() {
	user_profile_init();
});

function user_profile_init(){
	confirmation_needed = true;
	check_edition_mode(".profile_container");
	if ($("#last_elements").length){
		init_masonry("#last_elements");
	}
}

function change_profile_image( current_user_id, user_id){
	if (current_user_id == user_id){
		$("#user_avatar").click();
	}
}

function save_user_form(){
	confirmation_needed = false;
	$(".user_form").submit();
}

function image_profile_preview(element_image_input, evt) {
	var files = evt.target.files; // FileList object
    //var picture_preview = $(element_image_input).closest(".profile_box").find(".profile_image_preview");
    var picture_preview = $(".profile_box").find(".profile_image_preview");
	// Loop through the FileList and render image files as thumbnails.
	for (var i = 0, f; f = files[i]; i++) {
	  // Only process image files.
	  if (!f.type.match('image.*')) {
	    continue;
	  }
	  var reader = new FileReader();
	  // Closure to capture the file information.
	  reader.onload = (function(theFile) {
	    return function(e) {
	     	picture_preview.attr('src',e.target.result);
	    };
	  })(f);
	  // Read in the image file as a data URL.
	  reader.readAsDataURL(f);
	}
}