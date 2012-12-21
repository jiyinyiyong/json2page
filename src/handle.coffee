
q = (query) -> document.querySelector query
log = -> console.log.apply console, arguments

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