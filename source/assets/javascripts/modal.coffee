class Modal
  $trigger = $("[data-trigger]")
  $modal = $("[data-role$=modal]")
  $overlay = $("[data-role=overlay]")
  $closeButton = $("[data-role=close]")

  VISIBLE_CLASS = "_visible"

  constructor: ->
    @_bindOverlayClickEvents()
    @_bindTriggerClickEvents()
    @_bindCloseButtonClickEvents()

  _bindOverlayClickEvents: =>
    $overlay.on 'click', @_hideModal

  _bindTriggerClickEvents: =>
    $trigger.on 'click', @_showModal

  _bindCloseButtonClickEvents: =>
    $closeButton.on 'click', @_hideModal

  _showModal: ->
    $modal.addClass(VISIBLE_CLASS)

  _hideModal: ->
    $modal.removeClass(VISIBLE_CLASS)

App.Modal = Modal

$ ->
  if $("[data-role$=modal]").length >= 1
    new Modal
