$ ->
  $('.timesection h2[id]').each ->
    link = $("<a>", {
      href: "##{@id}"
      class: 'browser-link-to fa fa-link'
    })
    $(this).prepend(link)
