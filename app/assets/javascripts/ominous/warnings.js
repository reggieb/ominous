// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


$(function() {  

  $('.ominous_warnings .reveal_hidden').click( function() {
    $('.ominous_warnings .start_visible').hide();
    $('.ominous_warnings .start_hidden').show();
    return false;
  });
  
  $('.ominous_warnings .close_and_dismiss_warning').click( function() {
    send_data_to_server($(this).attr('href'));
    $(this).closest('.warning').hide('fade');
    return false;    
  });
  

  function send_data_to_server(url) {
    $.ajax({
      type: "PUT",
      url: url,

      success: function (data) {
        // console.log(data);
      },
      error: function () {
        // console.log('Error updating');
      }
    })
  }
})
