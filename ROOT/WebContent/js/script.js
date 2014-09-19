$(document).ready(function(){
	$('.slider')._TMS({
		preset:'diagonalExpand',
		easing:'easeOutQuad',
		duration:800,
		slideshow:6000,
		waitBannerAnimation:false,
		banners:'fade'
	});
	$('ul#menu').superfish({
      delay:       600,
      animation:   {height:'show'},
      speed:       600,
      autoArrows:  false,
      dropShadows: false
    });
});

