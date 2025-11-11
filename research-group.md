---
layout: page
title: Research group and collaborators
---

## Research group

<div class="container">
  <div class="row">
    {% for person in site.data.collaborators %}
      {% include person-card.html
         name=person.name
         img=person.img
         role=person.role
         bio=person.bio
         url=person.url %}
    {% endfor %}
  </div>
</div>