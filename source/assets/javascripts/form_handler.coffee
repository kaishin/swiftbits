class FormHandler
  $submitButtons = $("[type=submit]")
  $forms = $("form")

  ERROR_CLASS = "_oops"

  constructor: ->
    @_bindSubmitClicks()
    @_bindRequiredInputFocus()

  _bindSubmitClicks: =>
    $submitButtons.on "click", @_submitForm

  _bindRequiredInputFocus: =>
    $("input.required").on "focus", @_resetInput

  _resetInput: (event) ->
    $input = $(event.target)
    $input.removeClass(ERROR_CLASS)

  _submitForm: (event) ->
    event.preventDefault()
    $(".#{ERROR_CLASS}").removeClass(ERROR_CLASS)
    valid = true
    $button = $(event.target)
    $form = $button.closest($forms)
    $requiredFields = $form.find(".required")
    $emailFields = $form.find(".email")

    $requiredFields.each ->
      fieldValue = $(@).val().trim()
      if fieldValue is ""
        $(@).addClass(ERROR_CLASS)
        valid = false

    if !valid
      return

    $emailFields.each ->
      fieldValue = $(@).val().trim()
      emailPattern = /^([\w.-]+)@([\w.-]+)\.([a-zA-Z.]{2,10})$/i
      if not fieldValue.match emailPattern
        $(@).addClass(ERROR_CLASS)
        valid = false

    unless !valid
      $form.submit()

App.FormHandler = FormHandler

$ ->
  if $("form").length >= 1
    new FormHandler
