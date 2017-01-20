$ ->
  $('[id^=booking_check_in_date], [id^=booking_check_out_date], #booking_hotel_id').change ->
    if $('#booking_hotel_id').val() is ''
      $('#booking_room_id').empty()
      return
    start_date = $('#booking_check_in_date_1i').val() + '-' + $('#booking_check_in_date_2i').val() + '-' + $('#booking_check_in_date_3i').val() + 'T' + $('#booking_check_in_date_4i').val() + ':' + $('#booking_check_in_date_5i').val() + ':00Z'
    end_date = $('#booking_check_out_date_1i').val() + '-' + $('#booking_check_out_date_2i').val() + '-' + $('#booking_check_out_date_3i').val() + 'T' + $('#booking_check_out_date_4i').val() + ':' + $('#booking_check_out_date_5i').val() + ':00Z'
    url = '/hotels/' + $('#booking_hotel_id').val() + '/available_rooms.json?start_date=' + start_date + '&end_date=' + end_date
    $.get(url, ( data ) ->
      $('#booking_room_id').empty()
      $.each(data, (item) ->
        $('#booking_room_id').append($("<option></option>")
                                     .attr("value",data[item]['id'])
                                     .text(data[item]['room_label']))
      )
    )
