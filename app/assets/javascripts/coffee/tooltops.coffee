do ($ = jQuery) ->
  $ ->
    $tooltip = $('.tooltip')
    $('[data-tooltip]').mouseover ->
      $this = $(this)
      position = $this.offset()
      $tooltip.css
        top: "#{position.top-40}px",
        left: "#{position.left-24}px"
      $tooltip.text($this.data('tooltip')).show()
    $('[data-tooltip]').mouseout ->
      $tooltip.hide()
