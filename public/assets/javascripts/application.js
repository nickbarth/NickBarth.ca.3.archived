(function() {

  (function($) {
    return $(function() {
      var $inputs, $notice;
      $inputs = $('.input-name, .input-email, .input-message');
      $notice = $('.notice');
      return $('.contact-form').submit(function() {
        var userEmail, userMessage, userName;
        userName = $('.input-name').val();
        userEmail = $('.input-email').val();
        userMessage = $('.input-message').val();
        $.post('http://formsends.com/form/3/json/send', {
          Name: userName,
          Email: userEmail,
          Message: userMessage
        });
        $inputs.val('');
        $('.notice').hide(0);
        $('.notice').slideDown(1000).delay(1500).slideUp(1000);
        return false;
      });
    });
  })(jQuery);

}).call(this);
(function() {

  (function($) {
    return $(function() {
      var $tooltip;
      $tooltip = $('.tooltip');
      return $('[data-tooltip]').hover(function() {
        var $this, position;
        $this = $(this);
        position = $this.offset();
        return $tooltip.css({
          top: "" + (position.top - 40) + "px",
          left: "" + (position.left - 24) + "px",
          opacity: 1
        }).text($this.data('tooltip'));
      }, function() {
        return $tooltip.css({
          opacity: 0
        });
      });
    });
  })(jQuery);

}).call(this);
