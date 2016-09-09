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
};

$(document).ready(main);