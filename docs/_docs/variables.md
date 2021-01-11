---
title: Variables
permalink: /docs/variables/
---

Jekyll traverses your site looking for files to process. Any files with
[front matter](/docs/front-matter/) are subject to processing. For each of these
files, Jekyll makes a variety of data available via [Liquid](/docs/liquid/).
The following is a reference of the available data.

## Global Variables

{% include docs_variables_table.html scope=site.data.jekyll_variables.global %}

## Site Variables

{% include docs_variables_table.html scope=site.data.jekyll_variables.site %}

## Page Variables

{% include docs_variables_table.html scope=site.data.jekyll_variables.page %}

{: .note}
**ProTip™: Use Custom Front Matter**{:.title}<br>
Any custom front matter that you specify will be available under
`page`. For example, if you specify `custom_css: true`
in a page’s front matter, that value will be available as `page.custom_css`.
<br>
If you specify front matter in a layout, access that via `layout`.
For example, if you specify `class: full_page` in a layout’s front matter,
that value will be available as `layout.class` in the layout and its parents.

## Paginator

{% include docs_variables_table.html scope=site.data.jekyll_variables.paginator %}

{: .note .info}
**Paginator variable availability**{:.title}<br>
These are only available in index files, however they can be located in a subdirectory,
such as `/blog/index.html`.
