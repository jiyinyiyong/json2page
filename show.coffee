
window.get = (id) ->
  re = document.getElementById id

event_handler 'editor'
(get 'run').onclick = ->
  source = (get 'editor').value
  console.log source
  json_ = CoffeeScript.compile source, bare: 'on'
  eval "window.json = "+json_
  html = json2page json
  try
    html = css_beautify html
  catch error
    console.log 'no css here'
  html = style_html html
  new_text = document.createTextNode html
  (get 'paint').replaceChild new_text, (get 'paint').firstChild