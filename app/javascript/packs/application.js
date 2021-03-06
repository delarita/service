// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
// import { initMapbox } from '../plugins/init_mapbox';
import 'mapbox-gl/dist/mapbox-gl.css';
Rails.start()
Turbolinks.start()
ActiveStorage.start()
require("trix")
require("@rails/actiontext")

// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------



import "./actiontext.scss"

// External imports
import "bootstrap";

import $ from 'jquery';
global.$ = jQuery;

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import { selectNav } from '../components/stickymenu';
import { openNav } from '../components/openmenu';
import { initMapbox } from '../plugins/init_mapbox';
import { slider } from '../components/theslider';
import {animateButton} from '../components/blubby-button';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  initMapbox();
  selectNav();
  openNav();
  slider();
  animateButton();

});


