---
layout: page
title: Wants
permalink: /wants
created: 2023-09-28T21:00+10:00
updated: 2024-04-01T14:48+11:00
---
# Gift ideas for Peter
Hello! If you are here, it means you are on the hunt for gift ideas for Peter. Here is a brief list of ideas:
<ul>
{% for task in site.data.todoist %}
  <li>
    {{ task.content }}
    {% if task.due %}
      <small>(due {{ task.due.date }})</small>
    {% endif %}
  </li>
{% endfor %}
</ul>