function clearItemList() {
	$(".item__panel").remove();
};

$(document).ready(function() {
	$("#categories__select").change(function() {
		clearItemList();
		var value = $(this).val() != "0" ? $(this).val() + "/" : "";
		var url = "/categories/" + value + "items.js";
		$.get(url);
	});
});
