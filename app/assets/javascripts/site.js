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
    lensSize: 200,
		lensFadeIn: 200,
		lensFadeOut: 200
	});
	
});