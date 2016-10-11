var refreshRating = function() {
	$('.rating').raty( { path: '/assets', scoreName: 'comment[rating]' });
	$('.rated').raty({ path: '/assets',
		readOnly: true,
		score: function() {
			return $(this).attr('data-score');
		}
	});
};

$(document).on('ready page:load ajaxSuccess', function() {
	refreshRating();

		$('.img-zoom').elevateZoom({
    zoomType: "lens",
    lensShape: "round",
    lensSize: 150,
		lensFadeIn: 300,
		lensFadeOut: 400
	});
	
});