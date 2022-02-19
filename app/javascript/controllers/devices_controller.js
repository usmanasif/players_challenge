$('.find_matching_devices').on('click', function () {
  console.log('=====', this.value);
  $.ajax({
    url: '/devices/search_by',
    type: 'GET',
    data: { os_version_range: $('#os_version_range').val() },
    success: handleSuccess,
  });
});

const handleSuccess = (data) => {
  // will update dynamically
  console.log(`${data} matching devices`);
  if (data === undefined) {
    $('.modal-body').css('color', 'red');
    $('.modal-body').text("Couldn't find any devices");
  }else{
    $('.modal-body').text(`${data} matching devices`);
  }

  $('#devices_count_modal').modal('show');
};
