---
layout: page
title: Research group and collaborators
---

## Research group

<div class="container">
  <div class="row">
    {% for person in site.data.collaborators %}
      {% if person.tags and person.tags contains "group_member" %}
        {% include person-card2.html
            name=person.name
            img=person.img
            role=person.role
            bio=person.bio
            url=person.url %}
      {% endif %}
    {% endfor %}
  </div>
</div>

## Collaborators

### Gravitational waves from phase transitions (sound waves)

<div class="container">
  <div class="row">
    {% for person in site.data.collaborators %}
      {% if person.tags and person.tags contains "phase_transitions" %}
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

### Gravitational waves from phase transitions (Higgsless simulations)

<div class="container">
  <div class="row">
    {% for person in site.data.collaborators %}
      {% if person.tags and person.tags contains "higgsless" %}
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