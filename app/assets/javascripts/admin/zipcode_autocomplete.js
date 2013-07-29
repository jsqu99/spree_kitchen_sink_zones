function zipcode_autocomplete() {

  //  if ($('input[type=hidden][value=' + dom_id + ']').length > 0) {
  if ($('.zipcode_select').length > 0) {
      //    $('input[type=hidden][value=' + dom_id + ']').select2({

    // $(
    $('.zipcode_select').each(function(index,element) {
      if ($(this).parents('.select2-container').length > 0) {  // if we've already called
        return;
      }
      $(this).select2({
      placeholder: Spree.translations.zipcode_placeholder,
      multiple: false,
      initSelection: function(element, callback) {
        return $.getJSON(Spree.routes.zipcode_search + "?id=" + (element.val()), null, function(data) {
          return callback(data);
        });
      },
      ajax: {
        url: Spree.routes.zipcode_search,
        quietMillis: 200,
        datatype: 'json',
        data: function(term, page) {
          return {
            q: {
              zipcode_start: term
            }
          };
        },
        results: function (data, page) {
          return { results: data };
        }
      },
      formatResult: function(zipcode) {
        return zipcode.zipcode + " (" + zipcode.city + ", " + zipcode.state_abbr + ")";
      },
      formatSelection: function(zipcodes) {
        if (Object.prototype.toString.call( zipcodes ) === '[object Array]' ) {
          return zipcodes[0].zipcode + " (" + zipcodes[0].city + ", " + zipcodes[0].state_abbr + ")";
        } else {
          return zipcodes.zipcode + " (" + zipcodes.city + ", " + zipcodes.state_abbr + ")";
        }
      }
    });

    });
  }
}
