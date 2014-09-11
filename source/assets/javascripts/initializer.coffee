window.App = {}

hljs.initHighlightingOnLoad()

$(".js-disabled").removeClass("js-disabled").addClass("js-enabled")

$("data.wallet-id").on "click", -> selectText(event.target)

selectText = (element) ->
  selection = window.getSelection()
  range = document.createRange()
  range.selectNodeContents element
  selection.removeAllRanges()
  selection.addRange range
