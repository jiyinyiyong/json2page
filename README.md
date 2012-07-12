
Json2page is a script aiming to make writing web pages easy in CoffeeScript.  
So the template is the js objects one write in a decided format,  
after that, the objects can be compiled to HTML for any use.  
You may look through these demos first to get the basic concept:  
The live version should be placed here on gh-pages:
<http://jiyinyiyong.github.com/json2page/show.html>

# This repo is no longer maintained for it's an old idea.

Is a pity we can't handle DOM like what we do on other data.  
JQuery is quite a good tool, but HTML itself is clumsy.  
One day in April I saw this piece of code which converts json to css  
https://github.com/tyrondis/jcss  
It's really simple, then I got the idea to simplize html in js.  
My first version of converter more or less is based on this attention.  
I remmembered a script(forget..) which converts arrays to html, that's powerfull..  
For js object, there's no range, no repeat.. it quite bad for html.  
Only one thing: objects looks really concise in coffee, but array not.  

Basicly, an object defined like this:  

    input =
      $html: 'context'

may be translate to a string looks like:  

    '<html>context</html>'

The '$' in front of the tag is used to identify if it's a tag.  
It should be wrote like this for the full usage:  

    input =
      id_name$tagname: 'more...'

this would be translate to a tag with an id(id_name):  

    """
    <tagname id="id_name">
      more...
    </tagname>
    """

The problem is I'm not experienced enough to make it work strictly as assumed.  
I'll give some examples below to describe what is supposed to give out after converting.  
Maybe you can just read the code in 'json2page.coffee', not neat, but short.  

Use number to tell from repeated attributes:  

    input =
      $a: 'link one'
      $a1: 'link two'
      $a11: 'etc.'
    """
    <a>link one</a>
    <a>link two</a>
    <a>etc.</a>
    """
`$page` and `$text` both render plain html, but different:  

    input =
      $page: '<page >'
      $text: '<text >'
    """
    <page >
    &lt;text&nbsp;&gt;
    """

Nesting tags is avalable:  

    input =
      $nav:
        $nav:
          $page: "text"
    """
    <nav>
      <nav>
        text
      </nav>
    </nav>
    """

Tags must contain an '$', (html) attributes shoold not:  

    input =
      id$nav:
        attr: 'something'
        class: 'else'
    """
    <nav id="id" attr="something" class="else">
    </nav>
    """

Write stylesheets together with HTML, numbers will become `#{}px`  

    input =
      $style:
        body:
          width: 2
      $nav:
        style:
          background: "#eef"
    """
    <style>
      body{
        width: 2px;
      }
    </style>
    <nav style="background: #eef;">
    </nav>
    """

You may use `$pipe` to connect pieces of codes:  

    a = $nav:
      $text: 'Tx'
    input =
      $header:
        $pipe: a
    """
    <header>
      <nav>
        Tx
      </nav>
    </header>
    """

Really a small tool. Hope you will like it.
