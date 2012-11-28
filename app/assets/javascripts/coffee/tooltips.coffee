do ($ = jQuery) ->
  $ ->
    $tooltip = $('.tooltip')
    $('[data-tooltip]').hover ->
      $this = $(this)
      position = $this.offset()
      $tooltip
        .css
          top: "#{position.top-40}px",
          left: "#{position.left-24}px"
        .text($this.data('tooltip'))
        .stop()
        .fadeIn()
    , ->
      $tooltip.stop().fadeOut()
