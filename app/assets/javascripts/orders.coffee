$(document).ready ->
  console.log "Orders coffee document ready"
  
  $("#new_payment").on("ajax:success", (e, data, status, xhr) ->
    
    console.log "New Payment ajax:success"
    $("#new_payment").append xhr.responseText

  ).on("ajax:beforeSend", () ->
    
    console.log "New Payment ajax:BeforeSend"
  
  ).on("ajax:complete", () ->

    console.log "New Payment ajax:complete"

  ).on "ajax:error", (e, xhr, status, error) ->
    
    console.log "New Payment ajax:error"
    $("#new_payment").append "<p>ERROR</p>"


