$(document).ready ->
  $("#new_payment").on("ajax:success", (e, data, status, xhr) ->
    $("#new_payment").append xhr.responseText
  ).on "ajax:error", (e, xhr, status, error) ->
    $("#new_payment").append "<p>ERROR</p>"


