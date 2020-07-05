// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require jquery.turbolinks
//= require turbolinks
//= require activestorage
//= require materialize-sprockets


$(document).on('turbolinks:load', function() {
    // 各項目を初期化
    $('.sidenav').sidenav();
    $('.parallax').parallax();
    $('.dropdown-trigger').dropdown();
    $('.modal').modal();
    $('select').formSelect();
});

// sidenavだけは、進む/戻るで動かなくなるので都度destroyが必要
$(document).on("turbolinks:before-cache", function() {
    if ('token' in $('.sidenav')) {
        $('.sidenav').sidenav('destroy');
    }
    if ('token' in $('.dropdown-trigger')) {
        $('.dropdown-trigger').dropdown('destroy');
    }
    if ('token' in $('.modal')) {
        $('.modal').modal('destroy');
    }
});