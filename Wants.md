---
layout: page
title: Wants
permalink: /wants
created: 2023-09-28T21:00+10:00
updated: 2024-04-01T14:48+11:00
cover-img: assets/img/presents-nina-mercado-CnrDuY0tFrg-unsplash.jpg
---
# Gift ideas for Peter
Hello! If you are here, it means you are on the hunt for gift ideas for Peter. Here is a brief list of ideas:
<ul>
{% for task in site.data.todoist %}
  <li>
    {{ task.content | markdownify }} {% if task.description != "" %} ({{ task.description | markdownify }}) {%endif %}
  </li>
{% endfor %}
</ul>