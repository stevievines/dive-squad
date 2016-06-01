$(document).ready(function() {
  $('#new-goal-modal').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget); // Button that triggered the modal
    // Extract info from data-* attributes
    var diver = button.data('diver-name');
    var diverId = button.data('diver-id');
    // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
    var modal = $(this);
    modal.find('.modal-title').text('How many minutes late was ' + diver + '?');
    modal.find('#diver_id').val(diverId);
  });

});
