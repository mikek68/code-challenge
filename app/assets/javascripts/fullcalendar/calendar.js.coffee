$ ->
  $('#bookings-calendar').fullCalendar
    header:
      left: 'prev,next today'
      center: 'title'
      right: 'month,basicWeek,basicDay,listDay'
    editable: true
    eventLimit: true
    fixedWeekCount: false
    events: '/users/' + $('#bookings-calendar').data('userid') + '/bookings.json?auth_token' + $('#bookings-calendar').data('token')
