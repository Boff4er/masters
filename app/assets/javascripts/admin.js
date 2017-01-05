// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
// require jquery
//= require_tree ./plugins/jQuery
//= require jquery.turbolinks
//= require_tree ./plugins/jQueryUI
//= require bootstrap.min
// require jquery_ujs
// require turbolinks
//= require jquery-ui.min
//= require raphael-min
//= require plugins/morris/morris.min
//= require plugins/sparkline/jquery.sparkline.min
//= require plugins/jvectormap/jquery-jvectormap-1.2.2.min
//= require plugins/jvectormap/jquery-jvectormap-world-mill-en
//= require plugins/knob/jquery.knob
//= require moment.min
//= require plugins/daterangepicker/daterangepicker
//= require plugins/datepicker/bootstrap-datepicker
//= require plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min
//= require plugins/slimScroll/jquery.slimscroll.min
//= require plugins/fastclick/fastclick.min

//= require_tree ./plugins/bootstrap-slider
//= require_tree ./plugins/bootstrap-wysihtml5/
//= require_tree ./plugins/chartjs/
//= require_tree ./plugins/colorpicker/
//= require_tree ./plugins/datepicker/
//= require_tree ./plugins/daterangepicker/
//= require_tree ./plugins/fastclick/
//= require_tree ./plugins/select2/
//= require_tree ./plugins/fullcalendar/
//= require plugins/flot/jquery.flot.min
//= require plugins/flot/jquery.flot.resize.min
//= require plugins/flot/jquery.flot.pie.min
//= require plugins/flot/jquery.flot.categories.min
//= require ui.multiselect
//= require jquery.multi-select
// require jquery.easytree
//= require jstree

// require app.min
// require adminlte
//= require pages/dashboard
//= require demo
//= require app
// require_tree .

//= require turbolinks
//= require turbolinks.redirect

$(function(){
	$("select").select2();
});