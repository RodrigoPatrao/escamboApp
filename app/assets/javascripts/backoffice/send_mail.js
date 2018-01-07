// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(function() {
  $('#sendEmailModal').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget) // Button that triggered the modal
    var name = button.data('name') // Extract info from data-* attributes
    var email = button.data('email') // Extract info from data-* attributes
    var modal = $(this)
    modal.find('.modal-title').text('Nova mensagem para ' + name)
    modal.find('#recipient').val(email)
  })
});
