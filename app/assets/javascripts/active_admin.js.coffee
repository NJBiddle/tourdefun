#= require active_admin/base
#= require jquery.ui.nestedSortable
#= require sortable_tree/initializer
#= require sir-trevor
#= require sir-trevor/initializer
#= require select2

$ ->

	$('[data-tags]').each ->
		$(this).select2
			tags: $(this).data('tags'),
			width: '76%'

	$('[data-tags][data-value]').each ->
		$(this).select2('data', $(this).data('value'))

	$('#timeslot_artist_ids').select2
		width: '76%'