$(function() {

	var userModal = $('#user-modal');

	// Whenever a list-item is clicked
	$('.user_listing li').on('click', function() {

		// Grab the guid and store it in a variable
		var guid = $(this).attr('data-user-id');

		// Append the guid to our user/show json and grab it
		$.getJSON('/users/' + guid, function(data) {
			var userString = "<h2>" + data.name + "</h2><p>" + data.email + "</p><p>" + data.description + "</p>";

			userModal.html(userString);
			userModal.modal();

		});
	});
});