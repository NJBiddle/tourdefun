#= require active_admin/base
#= require jquery-ui-1.10.4.custom
#= require jquery.ui.nestedSortable
#= require sortable_tree/initializer
#= require select2
#= require medium-editor/dist/js/medium-editor

$ ->

  editor_selector = '.medium-editable'
  $editor_textarea = $($(editor_selector).data('for'))
  $(editor_selector).html($editor_textarea.val())
  $(editor_selector).find("span").contents().unwrap()

  editor = new MediumEditor(editor_selector, {
    buttons:  [
      'bold',
      'italic'
      'underline'
      'anchor'
      'header1'
      'header2'
      'quote',
      'unorderedlist',
      'orderedlist'
    ]
    firstHeader: 'h2',
    secondHeader: 'h3'
  })
  $(editor_selector).on 'keyup input', ->
    $(this).find( "span" ).contents().unwrap()
    $editor_textarea.val($(this).html())

  $('[data-tags]').each ->
    $(this).select2
      tags: $(this).data('tags'),
      width: '76%'

  $('[data-tags][data-value]').each ->
    $(this).select2('data', $(this).data('value'))

  $('#timeslot_artist_ids').select2
    width: '76%'

  $('.select2').select2
    width: '76%'
