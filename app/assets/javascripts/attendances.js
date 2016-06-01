$(document).ready(function() {
  $('.js-day-select').select2({
    placeholder: "Choose Practice Days",
    allowClear: true,
    width: '100%'
  });

  $('#minutes-late-modal').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget); // Button that triggered the modal
    // Extract info from data-* attributes
    var diver = button.data('diver-name');
    var diverId = button.data('diver-id');
    var diverPracticeId = button.data('diver-practice-id');
    var minutesLate = button.data('minutes-late');
    var excusedAbsence = button.data('excused-absence');
    // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
    var modal = $(this);
    modal.find('.modal-title').text('How many minutes late was ' + diver + '?');
    modal.find('#minutes_late').val(minutesLate);
    modal.find('#diver_id').val(diverId);
    modal.find('#excused_absence').val(excusedAbsence);
    modal.find('#id').val(diverPracticeId);
  });

  $('#late-excuse-modal').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget); // Button that triggered the modal
    // Extract info from data-* attributes
    var diver = button.data('diver-name');
    var diverId = button.data('diver-id');
    var diverPracticeId = button.data('diver-practice-id');
    var excuse = button.data('excuse');
    var isExcused = button.data('excused-absence');
    // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
    var modal = $(this);
    modal.find('.modal-title').text('Does ' + diver + ' have an excused absence?');
    modal.find('#excuse').val(excuse);
    modal.find('#excused_absence').prop('checked', isExcused);
    modal.find('#diver_id').val(diverId);
    modal.find('#id').val(diverPracticeId);
  });
});
