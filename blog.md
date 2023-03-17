---
layout: default
---
<div class="home">
  {%- if page.title -%}
    <h1 class="page-heading">{{ page.title }}</h1>
  {%- endif -%}

  {%- if site.posts.size > 0 -%}
  <h2 class="cím">{{ page.list_title | default: "Posts" }}</h2>
  <div style="display:flex; flex-direction: column; flex-wrap: wrap; margin:0 20rem; border:solid; border-radius: 20px;">
    {%- for post in site.posts -%}
      <div class="post" style="flex-grow:1 ; font-size: 20px; border:solid;border-radius: 10px;margin:1rem; padding: 1rem;" onclick="window.location='{{ post.url | relative_url }}';">
          {{ post.title | escape }}
          {%- assign date_format = site.minima.date_format | default: "%b %-d, %Y" -%}
          <div style="font-size:1rem;"> {{ post.date | date: date_format }} {{ post.author}}</div>
      </div>
      {%- if site.show_excerpts -%}
        {{ post.excerpt }}
      {%- endif -%}
    {%- endfor -%}
  {%- endif -%}
</div>
</div>