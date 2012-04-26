
require './index'

page = html _,
  head _,
    title _,
      text 'html'
    style
      body:
        color: 'red'
      div:
        color: 'blue'
        color2: 'bue'
        color4: 'ue'
  body _,
    div id: 'main',
      div id: 'left_bar',
        nav id: 'home_button',   class: 'nav'
        nav id: 'search_button', class: 'nav'
        nav id: 'msg_button',    class: 'nav'
        nav id: 'back_button',   class: 'nav'
      div id: 'right_bar',
        article class: 'post',
          p _,
            text 'need to clarify sth'
            text 'more things need to be examined'
        article class: 'post'
        article class: 'post'
        article class: 'post'

console.log page