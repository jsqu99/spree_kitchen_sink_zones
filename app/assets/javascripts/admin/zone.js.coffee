$ ->
  ($ '#country_based').click ->
    show_country()

  ($ '#state_based').click ->
    show_state()

  ($ '#city_based').click ->
    show_city()

  if ($ '#country_based').is(':checked')
    show_country()
  else if ($ '#state_based').is(':checked')
    show_state()
  else if ($ '#city_based').is(':checked')
    show_city()
  else
    show_state()
    ($ '#state_based').click()

disable_state_members = ->
  ($ '#state_members :input').each ->
    ($ this).prop 'disabled', true
  ($ '#state_members').hide()

enable_state_members = ->
  ($ '#state_members :input').each ->
    ($ this).prop 'disabled', false
  ($ '#state_members').show()

disable_zone_members = ->
  ($ '#zone_members :input').each ->
    ($ this).prop 'disabled', true
  ($ '#zone_members').hide()

enble_zone_members = ->
  ($ '#zone_members :input').each ->
    ($ this).prop 'disabled', false
  ($ '#zone_members').show()

disable_country_members = ->
  ($ '#country_members :input').each ->
    ($ this).prop 'disabled', true
  ($ '#country_members').hide()

enable_country_members = ->
  ($ '#country_members :input').each ->
    ($ this).prop 'disabled', false
  ($ '#country_members').show()

disable_city_members = ->
  ($ '#city_members :input').each ->
    ($ this).prop 'disabled', true
  ($ '#city_members').hide()

enable_city_members = ->
  ($ '#city_members :input').each ->
    ($ this).prop 'disabled', false
  ($ '#city_members').show()

show_country = ->
  disable_state_members()
  disable_zone_members()
  disable_city_members()
  enable_country_members()

show_state = ->
  disable_zone_members()
  disable_country_members()
  disable_city_members()
  enable_state_members()

show_city = ->
  disable_zone_members()
  disable_country_members()
  disable_state_members()
  enable_city_members()
