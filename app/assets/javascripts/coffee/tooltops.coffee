do ($ = jQuery) ->
  $ ->
    $(document).mousemove (e)->
      $('.tooltip').css
        top: "#{e.pageY-40}px",
        left: "#{e.pageX-40}px"
    $('[data-tooltip]').mouseover ->
      $('.tooltip').text($(this).data('tooltip')).show()
    $('[data-tooltip]').mouseout ->
      $('.tooltip').hide()
