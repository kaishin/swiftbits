class Modal
  $triggers = $("[data-trigger]")
  $modals = $("[data-role$=modal]")
  $overlay = $("[data-role=overlay]")
  $closeButton = $("[data-role=close]")

  VISIBLE_CLASS = "_visible"

  constructor: ->
    @_bindOverlayClickEvents()
    @_bindTriggerClickEvents()
    @_bindCloseButtonClickEvents()

  _bindOverlayClickEvents: =>
    $overlay.on "click", @_hideModal

  _bindTriggerClickEvents: =>
    $triggers.on "click", @_showModal

  _bindCloseButtonClickEvents: =>
    $closeButton.on "click", @_hideModal

  _showModal: (event) ->
    event.preventDefault()
    $trigger = $(event.target)
    modalRole = $trigger.data("trigger")
    $modal = $("[data-role=#{modalRole}]")
    $modal.addClass(VISIBLE_CLASS)

  _hideModal: ->
    $modals.removeClass(VISIBLE_CLASS)

App.Modal = Modal

$ ->
  if $("[data-role$=modal]").length >= 1
    new Modal
