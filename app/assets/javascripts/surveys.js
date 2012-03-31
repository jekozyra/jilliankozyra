$('.language-radio').live("change", function() {
	$.post('/surveys/change_language',{language_id: $(this).val()});
});

/*$('.category-list').live("change", function() {
	//$.post('/surveys/change_language',{language: $(this).val()});
  
	if($(this).val() == "Radio"){
		console.log($(this).attr('id'));
	}
});*/


function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).parent().before(content.replace(regexp, new_id));
}