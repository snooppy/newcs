// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require jquery.form
//= require jquery.remotipart
//= require_tree .
//= require tinymce-jquery  


// походу нахуй не нада 
//jQuery.ajaxSetup({ 
//  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
//})
//
//jQuery.fn.submitWithAjax = function() {
//  this.submit(function() {
//    $.post(this.action, $(this).serialize(), null, "script");
//    return false;
//  })
//  return this;
//};
//
//$(document).ready(function() {
//  $("#publication_types").submitWithAjax();
//})
//jQuery.ajaxSetup({ 'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript,application/javascript,text/html")} })
/////////// global events//////

EVENTS=""; // string values, separeited by "-". example dialog-coment-foo

function get_message(){
    $.ajax({
        type: 'GET',
        url: '/messages/get_new_message',
        dataType: "text",
        //        error: function(request,error) 
        //        {
        //            alert ( " Can't do because: " + error );
        //        },
        success: function (data){
            $("#popup_message").replaceWith(data);
            $("#popup_message").fadeIn(1000);
            $("#popup_message").fadeOut(10000);
        } 
    });
}



function event_success(data){
    var datas = data.split(";");
    for (var i=0; i<=datas.length-1;i++){
        console.log(datas[i]);
        if (jQuery.trim(datas[i]) == "message"){
            get_message();
        }
        if (jQuery.trim(datas[i]) == "dialog"){
            get_dialog();
        }
    }
}
  
function event_scan(){
    $.ajax({
        type: 'GET',
        url: '/events/scan/'+EVENTS,
        dataType: "text",
        success: function (data){
            event_success(data); 
        }
    });
}

  
///////////end global events//////
