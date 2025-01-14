// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require cocoon
//= require jquery
//= require jquery_ujs
//= require bootstrap.min 
//= require jquery.turbolinks
//= require turbolinks
//= require_tree .

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import 'bootstrap';
import "../stylesheets/application.scss";

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")
require("@nathanvda/cocoon")
window.bootstrap = require("bootstrap");
global.toastr = require("toastr")

Turbolinks.start()
ActiveStorage.start()
window.jQuery = $;
window.$ = $;
// Lấy token CSRF từ thẻ meta
var csrfToken = $('meta[name="csrf-token"]').attr('content');
// Thiết lập token CSRF cho tất cả các yêu cầu Ajax
$.ajaxSetup({
  headers: {
    'X-CSRF-Token': csrfToken
  }
});