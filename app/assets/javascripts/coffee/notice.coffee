do ($ = jQuery) ->
  $ ->
    $inputs = $('.input-name, .input-email, .input-message')
    $notice = $('.notice')

    $('.contact-form').submit ->
      userName = $('.input-name').val()
      userEmail = $('.input-email').val()
      userMessage = $('.input-message').val()
      $.post 'http://formsends.com/form/3/json/send',
        Name: userName
        Email: userEmail
        Message: userMessage
      $inputs.val('')
      $('.notice').hide(0)
      $('.notice').slideDown(1000).delay(1500).slideUp(1000)
      return false
