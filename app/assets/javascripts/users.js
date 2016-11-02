var main;
main = function() {
	var bar = $('.fa-bars'),
	grid = $('.fa-th-large'),
	photos = $('.photo_section'),
	flexitem = $('.imageauthor'),
	img = $('img').filter('.fullimg');

	$('button.multi-img').click(function() {
		photos.removeClass('single');
		photos.addClass('multi');
		flexitem.addClass('grid');

		grid.removeClass('inactive');
		grid.addClass('active');
		bar.removeClass('active');
		bar.addClass('inactive');

		img.removeClass('fullimg');
		img.addClass('multiimg');
	});

	$('button.single-img').click(function() {
		photos.removeClass('multi');
		photos.addClass('single');
		flexitem.removeClass('grid');


		bar.removeClass('inactive');
		bar.addClass('active');
		grid.removeClass('active');
		grid.addClass('inactive');

		img.removeClass('multiimg');
		img.addClass('fullimg');
	});
	
	$('#cropbox').Jcrop({
		onChange: update_crop,
		onSelect: update_crop,
		setSelect: [0, 0, 200, 200],
		aspectRatio: 1
	});
	
	function update_crop(coords) {
		$("#user_crop_x").val(coords.x);
		$("#user_crop_y").val(coords.y);
		$("#user_crop_w").val(coords.w);
		$("#user_crop_h").val(coords.h);
	}
};

$(document).ready(main);