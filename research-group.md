---
layout: page
title: Research group and collaborators
---

## Research group

Research group of the [SNSF Ambizione grant](https://data.snf.ch/grants/grant/208807) ***Exploring the early Universe with gravitational waves and primordial magnetic fields***.

<div class="container">
  <div class="row">
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
</div>

### Former members

<div class="container">
  <div class="row">
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
</div>

#### Publications:
{% include publications-by-tag.html tag="group_research" title="Group research" %}

## Main collaborators

### Gravitational waves from phase transitions (sound waves)

<div class="container">
  <div class="row">
    {% for person in site.data.collaborators %}
      {% if person.tags and person.tags contains "phase_transitions" %}
        {% include person-card2.html
            first_name=person.firstname
            last_name=person.lastname
            img=person.img
            role=person.role
            bio=person.bio
            url=person.url %}
      {% endif %}
    {% endfor %}
  </div>
</div>

#### Publications:
{% include publications-by-tag.html tag="phase_transitions" title="Phase transitions" %}

### Gravitational waves from phase transitions (Higgsless simulations)

<div class="container">
  <div class="row">
    {% for person in site.data.collaborators %}
      {% if person.tags and person.tags contains "higgsless" %}
        {% include person-card.html
            first_name=person.firstname
            last_name=person.lastname
            img=person.img
            role=person.role
            bio=person.bio
            url=person.url %}
      {% endif %}
    {% endfor %}
  </div>
</div>

#### Publications:
{% include publications-by-tag.html tag="higgsless" title="Higgsless simulations" %}

#### Publications:
- I. Stomberg, A. Roper Pol, *“Gravitational wave spectra for cosmological phase transitions with non-linear decay of the fluid motion.”* *Contribution to the “2025 Gravitation: Proceedings of the 59th Rencontres de Moriond”* (2025), [arXiv:2508.04263](https://arxiv.org/abs/2508.04263).
- C. Caprini, R. Jinno, T. Konstandin, A. Roper Pol, H. Rubira, I. Stomberg, *“Gravitational waves from decaying sources in strong phase transitions,”* *J. High Energy Phys.* **07** (2025) 217, [arXiv:2409.03651](https://arxiv.org/abs/2409.03651).

### Multi-messenger searches of primordial magnetic fields and GWs with LISA and PTA

<div class="container">
  <div class="row">
    {% for person in site.data.collaborators %}
      {% if person.tags and person.tags contains "multi_messenger" %}
        {% include person-card2.html
            first_name=person.firstname
            last_name=person.lastname
            img=person.img
            role=person.role
            bio=person.bio
            url=person.url %}
      {% endif %}
    {% endfor %}
  </div>
</div>

#### Publications:
{% include publications-by-tag.html tag="multi_messenger" title="Multi-messenger searches" %}