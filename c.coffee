
require 'coffee-script'
j = (require './json2page').json2page

data =
  $p:
    $text: '<text >'
    $page: '<page >'
console.log (j data).replace(/>/g, '&gt;').replace(/</g, '&lt;')