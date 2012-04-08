$('#party').live("change", function() {
	$.post('/search/refine_participants',{party: $('#party').val(), survey: $('#survey').val()});
});