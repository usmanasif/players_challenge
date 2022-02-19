$('.search-by-offer-target').on('change', function() {
  $.ajax({
    url: "/players/search_by",
    type: 'GET',
    data: { offer_target_id: this.value },
    success: handleSuccess
  })
});

const handleSuccess = (data) => {
  $('table.players tbody').empty();
  let newRows;

  if (data.length) {
    newRows = data.map((player) => (
      `
        <tr class='align-middle'>
          <td>${player.first_name}</td>
          <td>${player.last_name}</td>
          <td>${player.birthdate}</td>
          <td>${player.gender}</td>
          <td><a href="/players/${player.id}" class="mt-2 btn btn-outline-primary">Show</a></td>
          <td><a href="/players/${player.id}/edit" class="mt-2 btn btn-outline-primary">Edit</a></td>
          <td>
            <form class="button_to" method="post" action="/players/${player.id}"> 
              <input type="hidden" name="_method" value="delete" autocomplete="off">
              <button data-confirm="Are you sure?" class="mt-2 btn btn-outline-danger" type="submit">Destroy</button>
            </form>
          </td>
        </tr>
      `
    ));
  } else {
    newRows = `
      <tr class="text-center">
        <td colspan="7">No player found!</td>
      </tr>
    `;
  }
  $('table.players tbody').append(newRows);
};
