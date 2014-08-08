nsf-goali
=========

A Repository for the GT-MINED and IMAT NSF funded GOALI Project

## Flickr

Every image has a 11 digit photo-id, for example:

https://www.flickr.com/photos/123578762@N06/14523859440/

photo-id: 14523859440

So when you go to link above, after '/' add ``sizes/l`` and will get you to
all sizes page like the example below:
```
https://www.flickr.com/photos/123578762@N06/14523859440/sizes/l
                                  |      |
                                 id      N
```
By dragging the image to address bar (Where we type www. .... .com), you will
get a url like the example below:

```
https://farm6.staticflickr.com/5578/14523859440_3e28e8b469_m.jpg
            |                   |       |           |      |
          farm                server    |           |     size
                                    photo-id      secret
```
```yaml
type: flickr
   farm: 6
   server: 5578
   photo-id: 14523859440
   secret: 3e28e8b469
   size: m
   id: 123578762
   N: N06
```

## Slideshare

Every slideshare has "Embed" on top of it, for example:

http://www.slideshare.net/tonyfast1

On the top right of slides, click on "Embed" and it will give a code that you can post in your website.

> In the code given, the important part of it is " 
```html
<iframe src="//www.slideshare.net/slideshow/embed_code/33944674" width="427" height="356"> </iframe>
                                                          |
                                                          id
```
