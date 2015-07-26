$ ->

  $('.comment-trigger').on 'click', ->
    $('.comment').toggleClass('hidden')
    new_text = toggleText($(this).text())
    $(this).text(new_text)

  toggleText = (text) ->
    if text == "reply"
      new_text = "cancel"
    else
      new_text = "reply"

    return new_text

