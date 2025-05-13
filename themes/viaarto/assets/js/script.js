$(document).ready(function() {
  "use strict";
  // Scroll to top
  $("a[href='#top']").click(function() {
    $("html, body").animate({ scrollTop: 0 }, "slow");
    return false;
  });

  // Smooth scroll
  $('a.scroll-to').on('click', function (event) {
    var $anchor = $(this);
    $('html, body').stop().animate({
        scrollTop: ($($anchor.attr('href')).offset().top - 50)
    }, 700);
    event.preventDefault();
  });

  $('.site-testimonial-item').on('mouseenter', function(){
    $('.site-testimonial-item').addClass('inactive');
    $(this).removeClass('inactive').addClass('active');
  });
  $('.site-testimonial-item').on('mouseleave', function(){
    $('.site-testimonial-item').removeClass('inactive');
    $('.site-testimonial-item').removeClass('active');
  });

  // Initialize Tiny Slider for client logos
  if (document.querySelector('.client-logo-slider')) {
    tns({
      container: '.client-logo-slider',
      items: 3, // Start with 3 items on smallest screens
      slideBy: 'page',
      autoplay: true,
      autoplayTimeout: 2000, // Increased timeout for slower transition
      autoplayButtonOutput: false,
      mouseDrag: true,
      gutter: 20,
      nav: false,
      controls: false,
      responsive: {
        768: { // Medium screens
          items: 5,
          gutter: 30
        },
        992: { // Large screens
          items: 6,
          gutter: 40
        }
      }
    });
  }
});

$(window).on('scroll', function () {
  var windscroll = $(window).scrollTop();
  if (windscroll >= 100) {
    $('.site-navigation').addClass('nav-bg');
  } else {
    $('.site-navigation').removeClass('nav-bg');
  }
});
