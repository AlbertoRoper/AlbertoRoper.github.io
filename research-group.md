---
layout: page
title: Research group and collaborators
---

## Research group

Research group of the [SNSF Ambizione grant](https://data.snf.ch/grants/grant/208807) ***Exploring the early Universe with gravitational waves and primordial magnetic fields***.

<div class="container">
  <div class="row">
    {% for person in site.data.collaborators %}
      {% if person.tages contains "group_member" %}
        <div class="row align-items-center mb-4">
          <div class="col-12 col-md-3 text-center">
            {% if person.img %}
              <img src="{{ person.img | relative_url }}" alt="{{ person.name }}" class="rounded-circle" style="width:160px;height:160px;object-fit:cover;">
            {% endif %}
          </div>
          <div class="col-12 col-md-9">
            <h3>{{ person.name }}</h3>
            {% if person.role %}<div class="text-muted mb-2">{{ person.role }}</div>{% endif %}
            {% if person.bio %}<p>{{ person.bio }}</p>{% endif %}
            {% if person.url %}<p><a href="{{ person.url }}" target="_blank" rel="noopener">Profile</a></p>{% endif %}
          </div>
        </div>
      {% endif %}
    {% endfor %}

### Former members

<div class="container">
  <div class="row">
    {% for person in site.data.collaborators %}
      {% if person.tages contains "former_member" %}
        <div class="row align-items-center mb-4">
          <div class="col-12 col-md-3 text-center">
            {% if person.img %}
              <img src="{{ person.img | relative_url }}" alt="{{ person.name }}" class="rounded-circle" style="width:160px;height:160px;object-fit:cover;">
            {% endif %}
          </div>
          <div class="col-12 col-md-9">
            <h3>{{ person.name }}</h3>
            {% if person.role %}<div class="text-muted mb-2">{{ person.role }}</div>{% endif %}
            {% if person.bio %}<p>{{ person.bio }}</p>{% endif %}
            {% if person.url %}<p><a href="{{ person.url }}" target="_blank" rel="noopener">Profile</a></p>{% endif %}
          </div>
        </div>
      {% endif %}
    {% endfor %}

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