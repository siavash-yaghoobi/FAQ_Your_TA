// import places from 'places.js';

// const initAutocomplete = () => {
//   const addressInput = document.getElementById('flat_address');
//   if (addressInput) {
//     places({ container: addressInput });
//   }
// };

// export { initAutocomplete };
import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('query');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
