$ ->

  $('.comment-trigger').on 'click', ->
    $('.new-comment').toggleClass('hidden')
    new_text = toggleText($(this).text())
    $(this).text(new_text)

  $('.sub-comment-trigger').on 'click', ->
    $(this).parent().find(".sub-comment").toggleClass("hidden")
    new_text = toggleText($(this).text())
    $(this).text(new_text)

  toggleText = (text) ->
    if text == "reply"
      new_text = "cancel"
    else
      new_text = "reply"

    return new_text

