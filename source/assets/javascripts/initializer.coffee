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

$(".quick-navigation").waypoint (direction) ->
  firstArticle = $(".article-container").first()

  if direction == "down"
    $(@).addClass "_fixed"
    firstArticle.addClass "_adjusted"
  else
    $(@).removeClass "_fixed"
    firstArticle.removeClass "_adjusted"
