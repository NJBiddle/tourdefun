$platinum = undefined
$bronze = undefined

alignLogos = (collection) ->
  $.each collection, ->
    $(this).css({
        height: 'auto',
        lineHeight: 1
      })
     .equalHeights()
     .css('line-height', "#{$(this).first().height()}px")

resizeSets = ->
  alignLogos([$bronze])

$(document).on 'ready page:load', (e) ->
  $platinum = $('.platinum-sponsor')
  $bronze = $('.bronze-sponsor')

  if e.type == 'page:load'
    setTimeout resizeSets, 200

$(window).load resizeSets

$(window).on 'resize', ->
  setTimeout resizeSets, 200
