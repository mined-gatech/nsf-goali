---
layout: post
im:
  type: img
  src:  "https://farm4.staticflickr.com/3919/14466781737_a37c893a07_n.jpg"
pres:
  type: slideshare
  id: 33944674
link1:
  type: a
  src: http://www.google.com
  text: A bunch of shit
  alt: overtop the jawn

---
{% include ContentManager.html content=page.pres %}

# A Post written in Markdown



Markdown is a text-to-HTML conversion language.

It is nice:

* It does most things you need to do when reporting content
* It doesn't do a lot of things you don't need to do either.

## There are Images

![An Image](https://farm4.staticflickr.com/3919/14466781737_a37c893a07_n.jpg)

## There are Links

[A link to a picture](https://farm4.staticflickr.com/3919/14466781737_a37c893a07_n.jpg)

## There is a little bit of HTML

You can use ``iframe`` to access external Api's

#### Plot.ly

``
<iframe width="600" height="432" frameborder="0" seamless="seamless" scrolling="no" src="https://plot.ly/~TonyFast/4/.embed?width=1296&height=432"></iframe>
``
<!--
<iframe width="600" height="432" frameborder="0" seamless="seamless" scrolling="no" src="https://plot.ly/~TonyFast/4/.embed?width=1296&height=432"></iframe>
-->

#### Slideshare

```
<iframe src="http://www.slideshare.net/tonyfast1/slideshelf" width="615px" height="470px" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" style="border:none;" allowfullscreen webkitallowfullscreen mozallowfullscreen></iframe>
```

<iframe src="http://www.slideshare.net/tonyfast1/slideshelf" width="615px" height="470px" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" style="border:none;" allowfullscreen webkitallowfullscreen mozallowfullscreen></iframe>
