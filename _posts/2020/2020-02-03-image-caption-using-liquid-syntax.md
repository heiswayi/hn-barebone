---
layout: post
title: Image caption implementation in Jekyll site using Liquid syntax
---

> _This post is one of [Heiswayi Nrird's blog posts](https://heiswayi.nrird.com) used to demonstrate the use of `figure.html` file that made available in this Jekyll theme._

One of the things I really love with [Jekyll](https://jekyllrb.com/) static site is that the webpage generation allows seamless mixing of [Markdown](https://en.wikipedia.org/wiki/Markdown), [HTML5](https://en.wikipedia.org/wiki/HTML5) and [Liquid](https://shopify.github.io/liquid/) syntax. Most of my blog posts sometimes contain some images. **And some of these images need captions.**

### Using the standard Markdown syntax

All of my blog posts are written in Markdown syntax. If I'm going to insert an image with a caption in my article, by using the standard Markdown syntax, I will simply do something like this:

```markdown
![Fossil Creek Reservoir, Fort Collins, CO](https://i.imgur.com/7yOUCeG.jpg)

Figure (above): Fossil Creek Reservoir, Fort Collins, CO
```

And then, it will generate the HTML code that's looked like this:

```html
<p>
    <img src="https://i.imgur.com/7yOUCeG.jpg" alt="Fossil Creek Reservoir, Fort Collins, CO">
</p>
<p>
    Figure (above): Fossil Creek Reservoir, Fort Collins, CO
</p>
```

Demo:

![Fossil Creek Reservoir, Fort Collins, CO](https://i.imgur.com/7yOUCeG.jpg)

Figure (above): Fossil Creek Reservoir, Fort Collins, CO

The **problem with this method** is that if my article contains multiple images and each image has its own caption, the article wouldn't look nice because **I can't do a better styling for it**. If the image doesn't need a caption, then it would be okay and easier to use the Markdown syntax.

### Using the HTML5 elements

In order to do a better styling, alternatively I can use HTML5 by wrapping the `<img>` tag along with `<figcaption>` tag into a `<figure>` tag. This way I can do the styling as creative as I want using SASS/CSS.

Example of HTML5 code:

```html
<figure>
    <img src="https://i.imgur.com/7yOUCeG.jpg" alt="Fossil Creek Reservoir, Fort Collins, CO">
    <figcaption>Fossil Creek Reservoir, Fort Collins, CO</figcaption>
</figure>
```

This should be a way better than using the standard Markdown syntax. **However, inserting (or pasting) the code like above each time I need to include the captioned image can be a quite tedious.**

### Using the Liquid syntax

The best way to insert the captioned image is to use the Liquid syntax. All I need to do is **to implement the [Liquid template](https://jekyllrb.com/docs/templates/) once**, and then I can just use the [**include**](https://jekyllrb.com/docs/includes/) tag each time I want to insert the captioned image in a blog post. Here's how I created the figure caption template in my Jekyll source;

I created a file called `figure.html` and placed it inside `_includes` folder. Here's the source code for `figure.html` file:

{% raw %}
```html
{% if include.caption %}
<figure>
    {% if include.href %}
    <a href="{{ include.href }}">
        <img src="{{ include.src }}" alt="Image: {{ include.caption }}">
    </a>
    {% else %}
    <img src="{{ include.src }}" alt="Image: {{ include.caption }}">
    {% endif %}
    <figcaption><span>{{ include.caption }}</span></figcaption>
</figure>
{% else %}
<figure>
    {% if include.href %}
    <a href="{{ include.href }}">
        <img src="{{ include.src }}" alt="Image without caption">
    </a>
    {% else %}
    <img src="{{ include.src }}" alt="Image without caption">
    {% endif %}
</figure>
{% endif %}
```
{% endraw %}

As you can see, the template above is designed to be as flexible as it could be. **For the sake of consistency, I use this Liquid method in all my blog posts when inserting the images, with caption or not.** In some cases, some images don't need a caption. In other hand, some images may need to be hyperlinked.

And this is how I use the Liquid **include** tag in my blog post when I need to insert a captioned image:

{% raw %}
```liquid
{%
    include figure.html 
    src="https://i.imgur.com/7yOUCeG.jpg" 
    caption="Fossil Creek Reservoir, Fort Collins, CO"
%}
```
{% endraw %}

Demo:

{%
    include figure.html 
    src="https://i.imgur.com/7yOUCeG.jpg" 
    caption="Fossil Creek Reservoir, Fort Collins, CO"
%}

#### Hyperlinked image and hyperlink in the caption

Sometimes it could be as complex as below:

{% raw %}
```liquid
{%
    include figure.html 
    src="https://i.imgur.com/7yOUCeG.jpg" 
    caption="Fossil Creek Reservoir, Fort Collins, CO (<a href='https://heiswayi.nrird.com/photography'>source</a>)"
    href="https://heiswayi.nrird.com/photography"
%}
```
{% endraw %}

Demo:

{%
    include figure.html 
    src="https://i.imgur.com/7yOUCeG.jpg" 
    caption="Fossil Creek Reservoir, Fort Collins, CO (<a href='https://heiswayi.nrird.com/photography'>source</a>)"
    href="https://heiswayi.nrird.com/photography"
%}

Once you have this Liquid template implemented, all you need to do next is the styling. The styling can be done either using standard CSS or SASS. **Please note that this method is specific to a Jekyll template, and the source of your post may not properly work when used in other Jekyll templates.**