// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap-sprockets

function toggleText(element, text1, text2) {
  if (element.text() === text1) {
    element.text(text2);
  } else {
    element.text(text1);
  }
}

function readyReferences() {
  $("#references-link").click(function() {
    $("#references").toggle();
    toggleText($("#references-link"), "See References", "Hide References");
  });
}

$(document).ready(readyReferences);
$(document).on('page:load', readyReferences);
