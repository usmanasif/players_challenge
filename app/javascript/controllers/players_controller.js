import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  filter_by_offer_target(event) {
    $.ajax({
      url: '/players/search_by',
      type: 'GET',
      data: { offer_target_id: event.target.value },
      success: handleSuccess,
    });
  }
}

const handleSuccess = (data) => {
  $('table.players tbody').empty();
  $('table.players tbody').append(data.html);
};
