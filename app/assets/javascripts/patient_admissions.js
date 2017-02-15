// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$('input[type=radio][name=optradio]').change(function () {
  // check radio button value by this.value
  // hide div blocks by $('div#id').hide();
  if (this.value === 'A') {
    $('#ward').html('<%=j render :partial => "warda" %>')
  } else if (this.value === 'B1') {
    $('#ward').html('<%=j render :partial => "wardb1" %>')
  } else if (this.value === 'B2') {
    $('#ward').html('<%=j render :partial => "wardb2" %>')
  } else if (this.value === 'C') {
    $('#ward').html('<%=j render :partial => "wardc" %>')
  }
})
