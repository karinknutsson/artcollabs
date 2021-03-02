// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------


// Delete will work on Edge

//= require jquery_ujs

// External imports
import "bootstrap";

// Internal imports, e.g:
import { initProjectChatCable } from '../channels/project_chat_channel';
import { initChatroomCable } from '../channels/chatroom_channel';
import { initSendMessage } from './init_send_message';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  initProjectChatCable();
  initChatroomCable();
  initSendMessage();
});

// SHOW TABS LOGIC

$('#ProjectsTab #about-tab').on('click', function (e) {
  e.preventDefault()
  $(this).tab('show active')
  $('#ProjectsTab li:first-child a').tab('show') // Select first tab
})

$('#ProjectsTab #timeline-tab').on('click', function (e) {
  e.preventDefault()
  $(this).tab('show active')
  $('#myTab li:nth-child(2) a').tab('show') // Select second tab
})

$('#ProjectsTab #media-tab').on('click', function (e) {
  e.preventDefault()
  $(this).tab('show active')
  $('#myTab li:nth-child(3) a').tab('show') // Select third tab
})

$('#ProjectsTab #chat-tab').on('click', function (e) {
  e.preventDefault()
  $(this).tab('show active')
  $('#ProjectsTab li:last-child a').tab('show') // Select last tab
})

$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
  e.target // newly activated tab
  e.relatedTarget // previous active tab
})