
var register_sites_toggler = function() {
  $(document).ready(function() {

    $('#show_registered_sites').on('click', function(e) {
      e.preventDefault();
      $('#registered_site_dropdown').toggleClass('hidden');
    })
  })
}