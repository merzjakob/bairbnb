import "bootstrap";
// $("input.date_picker").datepicker();

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';

initMapbox();

import { loadDynamicBannerText } from '../components/banner';
loadDynamicBannerText();

import "../plugins/flatpickr"

import { calculateTotalPrice, insertTotalPrice } from '../components/bookingprice';


calculateTotalPrice();
