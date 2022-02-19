$('.find_matching_devices').on('click', function () {
  $('#os_version_range').removeClass('is-invalid');

  const os_version_range = $('#os_version_range').val();

  if (os_version_range) {
    $.ajax({
      url: '/devices/search_by',
      type: 'GET',
      data: { os_version_range },
      success: handleSuccess,
      error: () => $('#os_version_range').addClass('is-invalid'),
    });
  } else {
    $('#os_version_range').addClass('is-invalid');
  }
});

const handleSuccess = (data) => {
  if (!data) {
    $('.modal-body').css('color', 'red');
    $('.modal-body').text("Couldn't find any devices");
  }else{
    $('.modal-body').text(`${data} matching devices`);
  }

  $('#devices_count_modal').modal('show');
};
