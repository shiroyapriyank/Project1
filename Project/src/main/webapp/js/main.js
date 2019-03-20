(function($) {
	"use strict"
	
	///////////////////////////
	
	// Preloader 
	$(window).on('load', function() {
		$("#preloader").delay(500).fadeOut("slow");	
	});
	
	///////////////////////////

	// Smooth scroll
	$(".main-nav a[href^='#']").on('click', function(e) {
		e.preventDefault();
		var hash = this.hash;
		if($(".main-nav").hasClass("menu-in")){
			$('.btn-menu').removeClass("btn-close");
			$(".main-nav").removeClass("menu-in");
		}
		$('html, body').animate({
			scrollTop: $(this.hash).offset().top
			}, 800, function(){
		});	
	});
	
	///////////////////////////
	
	$(window).on('scroll', function() {
		var wScroll = $(this).scrollTop();
		
		// Fixed nav
		if ( wScroll > 1) {
			$('nav').addClass('fixed');
		} else {
			$('nav').removeClass('fixed');
		}
		
        // Back to top appear
        if (wScroll > 800) {
            $('#back-to-top').fadeIn();
        } else {
            $('#back-to-top').fadeOut();
        }
		
	});
	
	///////////////////////////
	
	// Back to top on click
	$('#back-to-top').on("click", function(){
		$('body,html').animate({
                scrollTop: 0
        }, 1000);
	});
	
	///////////////////////////
	
	// Scrollspy
	$('body').scrollspy({
		target: '.navbar',
		offset: $(window).height() / 2 
	});
	
	///////////////////////////

	// Collapse btn
	$('.btn-menu').on("click", function(){
		$(this).toggleClass("btn-close");
		$('.main-nav').toggleClass("menu-in");
	});

	///////////////////////////

	// Counter
	$('.counter').each(function(){
		var $this = $(this);
		var counter = new Waypoint({
			element: $this,
			handler: function() {
				this.element.countTo();
				this.destroy();
			},
			offset: '90%'
		});
	});
		
	///////////////////////////
	
	//  Progress bar
	$('.skill').each(function(){
		var progressBar = $(this).find('.progressbar');
		var progressPerc = progressBar.attr('data-to');
		var dataSpeed = progressBar.attr('data-speed');
		
		var progress = new Waypoint({
			element: progressBar,
			handler: function() {
				progressBar.animate({ width: progressPerc +'%'}, parseInt(dataSpeed,10));
				this.destroy();
			},
			offset: '90%'
		});
	});
	
	///////////////////////////
	
	//  Scroll animation
	$('.animated').each(function(){
		var $this = $(this);
		var animation = $this.attr("data-animation");
		var animationDelay = $this.attr('data-animation-delay') || 0 ;
		
		var animated = new Waypoint({
			element: $this,
			handler: function() {
				setTimeout(function(){
					$this.addClass(animation).css('opacity', 1);
				}, animationDelay );
				this.destroy();
			},
			offset: '90%'
		});
	});
	
	///////////////////////////
	
	// Testimonial carousel
	$("#testimonial-slider").owlCarousel({
        slideSpeed : 1000,
		singleItem:true,
		pagination:true,
		autoPlay : true,
		stopOnHover : true,
	});
		
	///////////////////////////

	// Stellar Parallax
	$.stellar({
		responsive: true
	});

	///////////////////////////

})(jQuery);