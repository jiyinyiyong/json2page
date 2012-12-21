
## JSON2Page renders JSON to HTML

### Usage

Add the `page/json2page` file to your HTML and use the `json2page` function.  
Use it like this in CoffeeScript:

```coffeescript
window.onload = ->
  mnt = q "#mnt"
  data =
    class: "border"
    $: [
      {
        class: "a"
        $: [
          "": "span", _: "inner text"
        ]
      }, {
        class: "a", $: [
          "": "span", _: "more text"
        ] 
      }
    ]
  log data
  mnt.innerHTML = json2page data
```

Or you can install that from NPM (you may need to add `sudo`):  

```
npm install -g json2page
```

And use this in you node files:  

```coffeescript
render = require("json2page").json2page
render "data"
```

### Licence

MIT