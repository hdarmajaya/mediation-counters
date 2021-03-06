// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.datepicker
//= require jquery.ui.autocomplete
//= require bootstrap
//= require_tree .

$(function () {
  $('#start_date').datepicker({ dateFormat: 'yy-mm-dd' });
  $('#search_cgf_filename').autocomplete({ source: "/search_cgf_suggestion/index" });
  $('#search_gcdr_filename').autocomplete({ source: "/search_gcdr_suggestion/index" });
  $('#search_scdr_filename').autocomplete({ source: "/search_scdr_suggestion/index" });
});
