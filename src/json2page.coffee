
json2page = (data) ->
  is_arr = (item) -> Array.isArray item
  is_str = (item) -> (typeof item) is "string"

  render_arr = (list) -> list.map(render_elem).join ""
  
  render_elem = (obj) ->
    tag_name = "div"
    inner = ""
    attrbutes = []
    for attr, value of obj
      switch attr
        when "" then tag_name = value
        when "$" then inner = render_arr value
        when "_" then unless inner.length > 0 then inner = value
        else attrbutes.push "#{attr}=\"#{value}\""
    attr_str = attrbutes.join " "
    "<#{tag_name} #{attr_str}>#{inner}</#{tag_name}>"

  render = (item) ->
    if is_arr item then render_arr item
    else if is_str item then item
    else render_elem item
  
  render data

window?.json2page = json2page
exports?.json2page = json2page