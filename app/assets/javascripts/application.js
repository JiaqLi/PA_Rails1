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
//= require jquery_ujs
// = require jquery
//= require turbolinks
//= require_tree .

$(function(){
  $("#search input").keyup(function() {
    $.get($("#search").attr("action"), $("#search").serialize(), null, "script");
    return false;
  });

  // $("#subject_id").change(function() {
  //   $.get($("#subject_id").attr("action"), $("#subject_id").serialize(), null, "script");
  //   return false;
  // });

});

// jQuery(function($) {
//   $("#subject_id").change(function() {
//     var state = $('search#subject_id :subject_id').val();
//     if(state == "") state="0";
//     jQuery.getJSON('/search/do_search/' + state, function(data){
//         $("#search_results").val(data.message);
//     })
//     return false;
//   });
// })
