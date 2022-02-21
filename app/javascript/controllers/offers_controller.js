import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  total_payout_by_age_range() {
    $('#age-range-input').removeClass('is-invalid');

    const age_range = this.element.querySelectorAll('#age-range-input')[0].value;

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
  }
}

const handleSuccess = (data) => {
  $('.modal-body').addClass('text-success');
  $('.modal-body').text(`$${data.total_payout}`);
  $('#count_modal_label').text('Total Payout');
  $('#count_modal').modal('show');
};

const handleOnError = () => {
  $('#age-range-input').addClass('is-invalid');
};
