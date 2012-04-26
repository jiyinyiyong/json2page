
pair_elems = 'html head title body script '
pair_elems+= 'div nav header footer section article '
pair_elems+= 'p span textarea br pre code '
pair_elems+= 'ul li ol table tr td'
pair_elems = pair_elems.split ' '

single_elems = 'img meta input link'
single_elems = single_elems.split ' '

write = (attrs) ->
  attr_str = ''
  if typeof attrs is 'object'
    for key, value of attrs
      attr_str+= " #{key}=\"#{value}\""
  return attr_str

for elem in pair_elems
  do (elem) ->
    global[elem] = (attrs, elems...) ->
      "<#{elem}#{write attrs}>#{elems.join ''}</#{elem}>"

for elem in single_elems
  do (elem) -> global[elem] = (attrs) -> "<#{elem}#{write attrs}/>"

global.text = (str) -> str.replace(/\s/g, '&nbsp')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')

global.style = (attrs) ->
  str = ''
  for key, value of attrs
    st = ''
    for k, v of value
      while (k.match /\d$/)?
        k = k[...-1]
      st+= "#{k}: #{v};"
    str += "#{key}{#{st}}"
  return "<style>#{str}</style>"

global.hsla = (h, s, l, a) -> "hsla(#{h},#{s}%,#{l}%,#{a/100})"
global._ = ''