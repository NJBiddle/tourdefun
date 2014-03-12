// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require timeslots

var resizeSponsorLogos = function () {
  var $sponsors_logos = $('.sponsors-logos img');

  var smallestLogo = 1000;
  $sponsors_logos.each(function(index, el) {
    var this_height = $(el).height();

    if (this_height < smallestLogo) {
      smallestLogo = this_height
    }
  });
  $sponsors_logos.each(function(index, el) {
    $(el).height(smallestLogo);
  });
}

$(window).load(resizeSponsorLogos);
$(window).resize(function() {
  setTimeout(resizeSponsorLogos, 200);
});
