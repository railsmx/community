class Form
  constructor: ->
    elements = $('.first, .second');

    elements.mouseover( ->
      $('.second:odd').find('a.edit').css({left: 10})
      $('.second:even, .first').find('a.edit').css({left: 10})
      pos = $(this).position()
      a = $(this).find('a.edit')
      toptmp = parseInt(a[0].style.left.replace('px',''), 10)
      a.css({top: (pos.top + $(this).height()) - 25, left: (pos.left + toptmp) + 20});
      a.show();
    )

    elements.mouseout( ->
      $('.second:odd').find('a.edit').css({left: 20})
      $('.second:even, .first').find('a.edit').css({left: 20})
      $(this).find('a.edit').hide();
    )

    $('.group').masonry({
      itemSelector : '.third',
      columnWidth : 240
    });

class Highligh
  constructor: ->
    $.getScript("http://yandex.st/highlightjs/6.1/highlight.min.js", ->
      hljs.initHighlighting()
    )

class DisQus
  constructor: (name) ->
    dsq = document.createElement('script');
    dsq.type = 'text/javascript';
    dsq.async = true;
    dsq.src = 'http://' + name + '.disqus.com/embed.js';
    (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);


App.Utilities.Form = Form
App.Utilities.Highligh = Highligh
App.Utilities.DisQus = DisQus