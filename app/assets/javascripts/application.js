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
//= require twitter/bootstrap
//= require_tree .


$(document).ready(function(){

  if($('.nav-collapse').length > 0){
  
    var str = $('ul.nav li a').text();
  }

  //Payment not complete action
  $('.payment_not').click(function() {
      var element = this;
      var data = $(this).parent().find('p.complete_first a').attr('href');
      $(this).parent().find('p.complete_first a').fadeIn();
      setTimeout(function() { window.location.href = data; }, 20000 );
  });



  $(function() {
    $( ".datepicker" ).datepicker({
      dateFormat: "dd-mm-yy",
      //showOn: "button",
      //buttonImage: "/assets/datepicker_calendar_icon.gif",
      //buttonImageOnly: true
    });
  });

  $('.attent,.unattend').click(function() {
      console.log('attend');
      var start = $(".datepicker.startdate").datepicker("getDate");
      var end = $(".datepicker.enddate").datepicker("getDate");
      var data = $('.event_type').val();
      var name = $('.event_name').val();
      var user = $('#ticket_user').val();
      if ($(this).text() == "Attend"){
        if( start == null || end == null ){
          $(this).parent().find('p.foo').text('Fields are mandatory').fadeIn();
          $(".datepicker.startdate").css('border','1px solid red');
          $(".datepicker.enddate").css('border','1px solid red');
          return false
        }else{
          $(".datepicker.startdate").css('border','1px solid #ccc');
          $(".datepicker.enddate").css('border','1px solid #ccc');
          $(this).parent().find('p.foo').hide();
          var value = true;
          var dataurl =  "/tickets/new/?ticket[user_id]="+user+"&ticket["+data+"]="+value+"&ticket[startdate]="+start+"&ticket[enddate]="+end+"&ticket[event_name]="+name
          }
      }else{
        var value = false;
        var dataurl =  "/tickets/new/?ticket[user_id]="+user+"&ticket["+data+"]="+value
      }
      var amt = $('#payment_amount').val();
      var amount = amt * 58.45;
      var amt = $('#payment_amount').val(amount);
      var discount = $('#payment_discount').val();
      var savings = amount * discount / 100;
      if (discount == 0){
        var total = amount;
      }else{
        var total = amount - savings;
      }
      var element = this;
      $.ajax({
        url: dataurl,
        type: $(this).attr('method'),
        data: $(this).serialize(),
        success: function(data) {
          console.log(data.success);
          $('#payment_total').val(total);
          console.log(total);
          $('.ticket_value').val(data.success);
          $(element).parent().find('p.foo').text('Details save. Please continue with step two').css('color','yellow').fadeIn().delay(3000).fadeOut();
          $('#new_payment').delay(3000).slideDown();
          $(element).delay(3000).fadeOut();
        }
      });
    return false;
  });

  //Payment action
  $('#new_payment').submit(function() {
      var element = this;
      $.ajax({
        url: $(this).attr('action'),
        type: $(this).attr('method'),
        data: $(this).serialize(),
        success: function(data) {
          console.log(data.success);
          $(element).parent().find('p.foo1').text(data.success).css('color','yellow').fadeIn();
          //window.location.href = "/price_list";
          setTimeout(function() { window.location.href = "/all_events"; }, 2000 );
        }
      });
    return false;
  });
  
  $('.delete-action').click(function() {
      var element = this;
      var id = $(this).attr('id');
      if($('.ajax-delete').length > 0){
        var data = '/homes/'+id+'/?delete=true'
      }else{
        var data = '/homes/'+id
      }
      $.ajax({
        url: data,
        type: 'DELETE',
        success: function(data) {
          if (data.success == 'deleted'){
          $(element).parent().parent().fadeOut(500);
          console.log("delete success");
          }else if(data.success == 'deleted no ajax'){
            window.location.href = "/all_events";
          //$(element).parent().parent().slideUp('slow');
          }
        }
      });
    return false;
  });  

});





