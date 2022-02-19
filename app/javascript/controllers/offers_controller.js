$('.total-payout-btn').on('click', function () {
  $('#age-range-input').removeClass('is-invalid');

  const age_range = $('#age-range-input').val();

  if (age_range) {
    $.ajax({
      url: '/offers/payout_with_age_range',
      type: 'GET',
      data: { age_range },
      success: handleSuccess,
      error: handleOnError,
    });
  } else {
    handleOnError();
  }
});

const handleSuccess = (data) => {
  $('.modal-body').css('color', 'green');

  $('.modal-body').text(`$${data.total_payout}`);
  $('#devices_count_modal').modal('show');
};

const handleOnError = () => {
  $('#age-range-input').addClass('is-invalid');
};
