$(document).ready(function() {
  $('.js-dive-select').select2({
    placeholder: "Choose a dive",
    allowClear: true,
    width: '100%'
  });

  $('#new-goal-modal').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget); // Button that triggered the modal
    // Extract info from data-* attributes
    var diver = button.data('diver-name');
    var diverId = button.data('diver-id');
    // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
    var modal = $(this);
    modal.find('.modal-title').text('Add a goal for ' + diver);
    modal.find('#diver_id').val(diverId);
  });
});
