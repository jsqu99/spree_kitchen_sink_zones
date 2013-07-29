replace_zipcode_ids = (s) ->
  new_id = new Date().getTime()
  return_arr = new Array()
  return_arr[0] = new_id
  return_arr[1] = s.replace(/NEW_RECORD/g, new_id)
  return_arr

$ ->
  $("a[id=nested-zipcode]").off('click') # i have to get ride of the handler that is attached in nested-attributes.js.
  # I thought this below would overwrite that handler, but it appends it, curiously
  $("a[id=nested-zipcode]").click ->
    template = $(this).attr("href").replace(/.*#/, "")
    r = replace_zipcode_ids(eval(template))
    new_id = r[0]
    html = r[1]

    $("#ul-" + $(this).attr("id")).append html
    update_remove_links()
    zipcode_autocomplete(new_id)

  ($ '#country_based').click ->
    show_country()

  ($ '#state_based').click ->
    show_state()

  ($ '#city_based').click ->
    show_city()

  ($ '#zipcode_based').click ->
    show_zipcode()

  if ($ '#country_based').is(':checked')
    show_country()
  else if ($ '#state_based').is(':checked')
    show_state()
  else if ($ '#city_based').is(':checked')
    show_city()
  else if ($ '#zipcode_based').is(':checked')
    show_zipcode()
  else
    show_state()
    ($ '#state_based').click()

enable_members = (member)->
  ($ '#' + member + '_members :input').each ->
    ($ this).prop 'disabled', false
  ($ '#' + member + '_members').show()

disable_members = (member)->
  ($ '#' + member + '_members :input').each ->
    ($ this).prop 'disabled', true
  ($ '#' + member + '_members').hide()

show_country = ->
  disable_members('state')
  disable_members('zone')
  disable_members('city')
  disable_members('zipcode')
  enable_members('country')

show_state = ->
  disable_members('zone')
  disable_members('country')
  disable_members('city')
  disable_members('zipcode')
  enable_members('state')

show_city = ->
  disable_members('zone')
  disable_members('country')
  disable_members('state')
  disable_members('zipcode')
  enable_members('city')

show_zipcode = ->
  disable_members('zone')
  disable_members('country')
  disable_members('city')
  disable_members('state')
  enable_members('zipcode')
