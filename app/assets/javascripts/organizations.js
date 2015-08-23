$(function() {

	var productTemplate = _.template($('#product-template').html())

	$('.event').on('click', function(event) {
		event.preventDefault();

		var eventId = $(event.target).attr('data-event-id');

		$.ajax({
			url: '/products?event_id=' + eventId,
			type: 'GET',
			success: function(products) {

				$('#products').empty();
				
				_.each(products, function(product) {
					var productElement = $(productTemplate(product));
					$('#products').append(productElement);
				})
			},
			error: function(error) {
				console.log('some error happened', error)
			}
		})
	});
});