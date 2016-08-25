$(document).ready(function() {
	$('.orderGetId').on('click', function() {
		var id = $(this).attr('data-id') + "/";
		$(".orderGetId").change(function() {
			var value = $('input[name=order_status]:checked').val() + "/";
			var url = "/change_status/" + value + id;
			$.get(url);
			location.reload();
		});
	});
});
