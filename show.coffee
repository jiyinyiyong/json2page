
window.get = (id) ->
  re = document.getElementById id

textareaEditor 'area'
(get 'run').onclick = ->
  source = (get 'area').value
  console.log source
  CoffeeScript.eval source, bare: 'on'
  html = json2page window.in
  try
    html = css_beautify html
  catch error
    console.log 'no css here'
  html = style_html html
  new_text = document.createTextNode html
  (get 'paint').replaceChild new_text, (get 'paint').firstChild