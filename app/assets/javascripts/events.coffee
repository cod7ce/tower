# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  eventDayDom = $('.team-events .event-day:first')
  ancestorDom = $('.team-events .event-ancestor:first')
  eventCount  = $('.team-events .event-day').length
  $('.team-events .event-day').each (index, event) ->
    return true if index == 0
    currentEventDay = $(event).find('.time').data('event-day')
    currentAncestorId = $(event).find('.event').data('ancestor-id')
    currentAncestorType = $(event).find('.event').data('ancestor-type')
    if eventDayDom.data('event-day') == currentEventDay
      if ancestorDom.data('ancestor-id') == currentAncestorId && ancestorDom.data('ancestor-type') == currentAncestorType
        $(event).find('.event').clone().appendTo(ancestorDom)
      else
        ancestorDom = $(event).find('.event-ancestor').clone()
        ancestorDom.appendTo(eventDayDom.find('.event-day-content'))
      $(event).remove()
    else
      eventDayDom = $(event)
      ancestorDom = $(event).find('.event-ancestor')
    $('.events').show() if eventCount - index == 1

  $('.controls').on 'change', '#fired_by', ->
    console.log $(this).attr('path') + '?user_id=' + $(this).val()
    window.location = $(this).attr('path') + '?user_id=' + $(this).val()
