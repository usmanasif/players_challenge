import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  find_devices_count() {
    $('#os_version_range').removeClass('is-invalid');
    const os_version_range = this.element.querySelectorAll('#os_version_range')[0].value;

    if (os_version_range) {
      $.ajax({
        url: '/devices/search_by',
        type: 'GET',
        data: { os_version_range },
        success: handleSuccess,
        error: handleOnError,
      });
    } else {
      handleOnError();
    }
  }
}

const handleSuccess = (data) => {
  if (data.count) {
    $('.modal-body').removeClass('text-danger');
    $('.modal-body').addClass('text-success');
    $('.modal-body').text(`${data.count} matching devices`);
  } else {
    $('.modal-body').removeClass('text-success');
    $('.modal-body').addClass('text-danger');
    $('.modal-body').text("Couldn't find any devices");
  }

  $('#count_modal_label').text('Devices Count');
  $('#count_modal').modal('show');
};

const handleOnError = () => {
  $('#os_version_range').addClass('is-invalid');
};
