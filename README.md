# hn-barebone

This is a demo of Heiswayi Nrird's Barebone Jekyll theme. The simplest Jekyll theme I ever made. This theme has no SASS. No SCSS file needed for this theme. However, this theme has few CSS code inline directly into the `<head>...</head>`. The purpose of these CSS code is just to create a basic structure of the blog layout.

### [Preview](https://heiswayi.github.io/hn-barebone/)

## Usage

### Layouts
Refers to files within the `_layouts` directory, that define the markup for your theme.

- `index.html` — The layout for your landing-page / home-page / index-page.
- `page.html` — The layout for your documents that contain FrontMatter, but are not posts.
- `post.html` — The layout for your posts.

### Includes
Refers to snippets of code within the `_includes` directory that can be inserted in multiple layouts (and another include-file as well) within the same theme-gem.

- `footer.html` — Defines the site's footer section.
- `head.html` — Code-block that defines the `<head></head>` in default layout.
- `header.html` — Defines the site's main header section. By default, pages with a defined title attribute will have links displayed here.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/heiswayi/hn-barebone. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Development

To set up your environment to develop this theme, run `bundle install`.

Your theme is setup just like a normal Jekyll site! To test your theme, run `bundle exec jekyll serve` and open your browser at `http://localhost:4000`. This starts a Jekyll server using your theme. Add pages, documents, data, etc. like normal to test your theme's contents. As you make modifications to your theme and to your content, your site will regenerate and you should see the changes in the browser after a refresh, just like normal.

## License

The theme is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
