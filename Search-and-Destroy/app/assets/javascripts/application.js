// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .
$(document).ready(function() {
  var url = (document.URL + "/status")
  var url2 = (document.URL + "/update")
	console.log("Ready!");
  checkTurn()
  function ajaxTurn() {
    console.log(url)
    $.ajax({
    url: url,
    type: "get",
    dataType : 'html'
  }).done(function(server_data){
    console.log(server_data);
    if (server_data == 202) {
      location.reload();
      };
    })

}
  function checkTurn() {
    setInterval(function() { ajaxTurn(); }, 15000);
  }
})
