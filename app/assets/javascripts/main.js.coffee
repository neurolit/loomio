window.Application ||= {}

Application.convertUtcToRelativeTime = ->
  if $(".utc-time").length > 0
    today = new Date()
    month = [ "Jan", "Feb", "Mar", "Apr", "May", "Jun",
               "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" ]
    date_offset = new Date()
    offset = date_offset.getTimezoneOffset()/-60
    $(".utc-time").each((index, element)->
      date = $(element).html()
      local_datetime = new Date()
      local_datetime.setYear(date.substring(0,4))
      local_datetime.setMonth((parseInt(date.substring(5,7)) - 1).toString(), date.substring(8,10))
      local_datetime.setHours((parseInt(date.substring(11,13)) + offset).toString())
      local_datetime.setMinutes(date.substring(14,16))
      hours = local_datetime.getHours()
      mins = local_datetime.getMinutes()
      mins = "0#{mins}" if mins.toString().length == 1
      if local_datetime.getDate() == today.getDate()
        if hours < 12
          hours = 12 if hours == 0
          date_string = "#{hours}:#{mins} AM"
        else
          hours = 24 if hours == 12
          date_string = "#{hours-12}:#{mins} PM"
      else
        date_string = "#{local_datetime.getDate()} #{month[local_datetime.getMonth()]}"
      $(element).html(String(date_string))
      $(element).removeClass('utc-time')
      $(element).addClass('relative-time')
    )

$ ->
  $(".dismiss-system-notice").click( (event)->
    $.post($(this).attr("href"))
    $("#system-notice").remove()
    event.preventDefault()
  )

  $(document.body).keypress ->
    keyCode = event.which || event.keyCode
    keyChar = String.fromCharCode(keyCode)
    
    if check_page_focus_non_textarea()
      switch keyChar
        when "g" then show_group_dropdown()
      
check_page_focus_non_textarea = ->
  non_textarea = true
  if $('input').is(":focus")
    non_textarea = false
  if $('textarea').is(":focus")
    non_textarea = false
  return non_textarea
      
show_group_dropdown = ->
  $('#my_groups_header').click()
