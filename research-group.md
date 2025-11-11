---
layout: page
title: Research group and collaborators
---

## Research group

As the PI of the [SNSF Ambizione grant](https://data.snf.ch/grants/grant/208807) ***Exploring the early Universe with gravitational waves and primordial magnetic fields***, I have acted as the supervisor of Antonino Midiri (PhD)

<div class="container">
  <div class="row">
    {% for person in site.data.collaborators %}
      {% if person.name contains "Antonino S. Midiri" %}
        {% include person-card.html
            name=person.name
            img=person.img
            <!-- role=person.role
            bio=person.bio -->
            <!-- url=person.url %} -->
        %}
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