---
layout: page
title: Research group
---

Research group of the [SNSF Ambizione grant](https://data.snf.ch/grants/grant/208807): ***"Exploring the early Universe with gravitational waves and primordial magnetic field"s***.

<div class="container">
    {% for person in site.data.collaborators %}
      {% if person.tags contains "group_member" %}
        <div class="row align-items-center mb-4">
          <div class="col-12 col-md-3 text-center">
            {% if person.img %}
              <img src="{{ person.img | relative_url }}" alt="{{ person.name }}" class="rounded-circle" style="width:160px;height:160px;object-fit:cover;">
            {% endif %}
          </div>
          <div class="col-12 col-md-9">
            <h3>{{ person.firstname }} {{ person.lastname }}</h3>
            {% if person.role %}<div class="text-muted mb-2">{{ person.role }}</div>{% endif %}
            {% if person.bio %}<p>{{ person.bio }}</p>{% endif %}
            {% if person.url %}<p><a href="{{ person.url }}" target="_blank" rel="noopener">Profile</a></p>{% endif %}
          </div>
        </div>
      {% endif %}
    {% endfor %}
</div>

### Former members

<div class="container">
    {% for person in site.data.collaborators %}
      {% if person.tags contains "former_member" %}
        <div class="row align-items-center mb-4">
          <div class="col-12 col-md-3 text-center">
            {% if person.img %}
              <img src="{{ person.img | relative_url }}" alt="{{ person.name }}" class="rounded-circle" style="width:160px;height:160px;object-fit:cover;">
            {% endif %}
          </div>
          <div class="col-12 col-md-9">
            <h3>{{ person.firstname }} {{ person.lastname }}</h3>
            {% if person.role %}<div class="text-muted mb-2">{{ person.role }}</div>{% endif %}
            {% if person.bio %}<p>{{ person.bio }}</p>{% endif %}
            {% if person.url %}<p><a href="{{ person.url }}" target="_blank" rel="noopener">Profile</a></p>{% endif %}
          </div>
        </div>
    {% endif %}
  {% endfor %}
</div>

#### Publications related to the Ambizione grant:
{% include publications-by-tag.html tag="ambizione" reversed=true %}