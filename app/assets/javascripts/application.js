//= require jquery3
//= require jquery_ujs
//= require cocoon
//= require_tree .

$(function(){
  $('.table').DataTable({
    responsive: {
      details: {
        display: $.fn.dataTable.Responsive.display.childRowImmediate
      }
    }
  });
})
