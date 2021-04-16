var Slider = require("bootstrap-slider");

export const slider = () => {
  const mySlider = new Slider('#ex1', {
    formatter: function(value) {
      //console.log(value)
      document.getElementById("order_item_quantity").value = value;
      //document.getElementById("ex1SliderVal").textContent = value * 10;
      return 'Valeur: ' + (value * 10);
    }
  });

  $('#new_order_item').on('submit', function() {
    $('#exampleModalCenter').modal('hide');
  });
}
