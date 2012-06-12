# @preserve  textfill
# @name      jquery.textfill.js
# @author    Russ Painter
# @author    Yu-Jie Lin
# @version   0.1.3
# @date      03-27-2012
# @copyright (c) 2012 Yu-Jie Lin
# @copyright (c) 2009 Russ Painter
# @license   MIT License
# @homepage  https://github.com/stammy/jquery-textfill

(($) ->

  # Resizes an inner element's font so that the inner element completely fills the outer element.
  # @param {Object} Options which are maxFontPixels (default=40), innerTag (default='span')
  # @return All outer elements processed

  $.fn.textfill = (options) ->
    defaults =
      maxFontPixels: 40
      minFontPixels: 4
      innerTag: "span"
      callback: null
      complete: null

    Opts = jQuery.extend(defaults, options)
    @each ->
      ourText = $(Opts.innerTag + ":visible:first", this)
      maxHeight = $(this).height()
      maxWidth = $(this).width()
      fontSize = undefined
      minFontPixels = Opts.minFontPixels
      maxFontPixels = Opts.maxFontPixels
      while fontSize = Math.floor(minFontPixels + maxFontPixels) / 2
      minFontPixels <= maxFontPixels
        ourText.css "font-size", fontSize
        if ourText.height() < maxHeight and ourText.width() < maxWidth
          minFontPixels = fontSize + 1
        else
          maxFontPixels = fontSize - 1
      Opts.callback this  if Opts.callback

    Opts.complete this  if Opts.complete
    this
) jQuery