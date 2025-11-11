---
layout: page
title: Research group and collaborators
---

## Research group

<div class="container">
  <div class="row">
    {% for person in site.data.group_members %}
      {% include person-card.html
         name=person.name
         img=person.img
         role=person.role
         bio=person.bio
         url=person.url %}
    {% endfor %}
  </div>
</div>

## Collaborators

### Gravitational waves from phase transitions (sound waves)

<div class="container">
  <div class="row">
    {% for person in site.data.collaborators %}
      {% if person.tag == "phase_transitions"}
        {% include person-card.html
            name=person.name
            img=person.img
            role=person.role
            bio=person.bio
            url=person.url %}
      {% endif %}
    {% endfor %}
  </div>
</div>