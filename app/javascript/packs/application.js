// import "bootstrap";
// import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
// import { initMapbox } from '../plugins/init_mapbox';
// import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

// initMapbox();
import "bootstrap";
import "../plugins/flatpickr";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

import { initMapbox } from '../plugins/init_mapbox';
import { initAutocomplete } from '../plugins/init_autocomplete';
import "../booking_listener";
initMapbox();
initAutocomplete();
