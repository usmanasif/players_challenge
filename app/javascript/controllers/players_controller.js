$('.search-by-offer-target').on('change', function() {
  console.log('=====', this.value)
  $.ajax({
    url: "/players/search_by",
    type: 'GET',
    data: { offer_target_id: this.value },
    success: handleSuccess
  })
});

const handleSuccess = (data) => {
  // will update dynamically
  console.log(data);
};
