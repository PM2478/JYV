#$(document).on 'page:load', ->
  $(document).on 'ready turbolinks:load', ->
    $('#comments-link').click  ->
      $('#comments-section').toggle()
      