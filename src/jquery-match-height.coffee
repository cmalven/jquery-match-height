 # jquery-match-height
 # Matches the height of all target elements to the tallest in the collection
 # https://github.com/cmalven/jquery-match-height
 #
 # Copyright (c) 2013 Chris Malven
 # Licensed under the MIT, GPL licenses.

 $ = jQuery
 
# $specificTarget:  The element you'd like to match all collection's el to.

$.fn.extend
  matchHeight: (options) ->
    settings = {}

    settings = $.extend settings, options

    adjustSize = (evt) =>
      $(@).css({"min-height": 0})
      if settings.$specificTarget?
        matchHeight = settings.$specificTarget.outerHeight()
      else
        matchHeight = findTallest()
      @each () ->
        $(@).css({"min-height": matchHeight})

    findTallest = () =>
      tallest = 0
      @each () ->
        thisHeight = $(@).outerHeight()
        tallest = thisHeight if thisHeight > tallest
      return tallest

    # Bind to and trigger a throttled resize event
    $(window).on "resize", adjustSize
    $(window).trigger "resize"

    return @each () ->
