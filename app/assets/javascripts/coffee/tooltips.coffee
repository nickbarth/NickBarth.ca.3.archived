do ($ = jQuery) ->
  $ ->
    $tooltip = $('.tooltip')
    $('[data-tooltip]').hover ->
      $this = $(this)
      position = $this.offset()
      $tooltip
        .css
          top: "#{position.top-40}px",
          left: "#{position.left-24}px",
          opacity: 1
        .text($this.data('tooltip'))
    , ->
      $tooltip.css
        opacity: 0
