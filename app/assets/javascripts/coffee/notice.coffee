do ($ = jQuery) ->
  $ ->
    $inputs = $('.input-name, .input-email, .input-message')
    $notice = $('.notice')

    $('.contact-form').submit ->
      $inputs.val('')
      $('.notice').hide(0)
      $('.notice').slideDown(1000).delay(1500).slideUp(1000)
      return false
