$ ->
  $('#show_all').click (e) ->
    $('#gallery li').removeClass('hideyness')
  $('#show_live').click (e) ->
    e.preventDefault();
    $('#gallery li:not(.cat_live)').addClass('hideyness')
    $('#gallery li.cat_live').removeClass('hideyness')
  $('#show_laugh').click (e) ->
    e.preventDefault();
    $('#gallery li:not(.cat_laugh)').addClass('hideyness')
    $('#gallery li.cat_laugh').removeClass('hideyness')
  $('#show_love').click (e) ->
    e.preventDefault();
    $('#gallery li:not(.cat_love)').addClass('hideyness')
    $('#gallery li.cat_love').removeClass('hideyness')

  $('a', '#gallery').click (e) ->
    e.preventDefault()
    if $(@).hasClass('open')
      $(@).removeClass('open')
    else
      $('.open','#gallery').removeClass('open')
      $(@).addClass('open')