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
//= require bootstrap.min



// Assign handlers immediately after making the request,
// and remember the jqxhr object for this request

function refresh_codes_used(){
    var jqxhr = $.getJSON( gon.url )
    .done(function(data) {
      console.log(data);
      if (typeof gon.array !== 'undefined' && gon.array==true ) {
        for ( var i=0; i<data.length; i++ ){
            console.log("$('#js_offer_used'" + data[i].id + ").text(" + data[i].codes_used +")");
            $('#js_offer_used_' + data[i].id).text(data[i].codes_used);
        }
      }
      else{
        $('#js_offer_used').text(data.codes_used);
      }
    });
};

$(document).ready(function() {
  if ( typeof gon.interval !== 'undefined' && gon.interval == true ) {
    window.setInterval(function(){refresh_codes_used()}, 10000);
    gon.interval = false;
}

});

$(document).ready(function() {
  if ($("#map").length > 0) {
    console.log("log");
    IPMapper.initializeMap("map");
    IPMapper.addIPMarker("109.206.223.85");
  } 
})

//= require turbolinks
//= require_tree .
