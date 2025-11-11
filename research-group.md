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
            <h3>{{ person.name }}</h3>
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
            <h3>{{ person.name }}</h3>
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
<div class="container">
  <ul>
  {% for publication in site.data.publications %}
    {% if publication.tags and publication.tags contains "group_research" %}
      <li>
        {{ publication.authors }} — <em>{{ publication.title }} </em> {% if publication.tags contains "published" %} <em>{{ publication.journal }}</em>, {{publication.volume}} {{publication.page}}, ({{ publication.year }}) {% endif %} {% if publication.url %}. <a href="{{ publication.url }}" target="_blank" rel="noopener">link</a>{% endif %} {% if publication.tags contains "submitted" %} <em>{Submitted to { publication.journal }}</em> ({{ publication.year }}) {% endif %} {% if publication.url %}. <a href="{{ publication.url }}" target="_blank" rel="noopener">link</a>{% endif %} {% if publication.tags contains "proceedings" %} <em>{Contribution to the { publication.proceedings }}</em> ({{ publication.year }}) {% endif %} {% if publication.url %}. <a href="{{ publication.url }}" target="_blank" rel="noopener">link</a>{% endif %} {% if publication.arxiv %} — <a href="https://arxiv.org/abs/{{ publication.arxiv }}">arXiv:{{ publication.arxiv }}</a>{% endif %}
      </li>
    {% endif %}
  {% endfor %}
  </ul>
</div>

## Main collaborators

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

#### Publications:
<div class="container">
  <ul>
  {% for publication in site.data.publications %}
    {% if publication.tags and publication.tags contains "phase_transitions" %}
      <li>
        {{ publication.authors }} — <em>{{ publication.title }}</em>{% if publication.publication %}, {{ publication.publication }}{% endif %} ({{ publication.year }}){% if publication.url %}. <a href="{{ publication.url }}" target="_blank" rel="noopener">link</a>{% endif %}{% if publication.arxiv %} — <a href="https://arxiv.org/abs/{{ publication.arxiv }}">arXiv:{{ publication.arxiv }}</a>{% endif %}
      </li>
    {% endif %}
  {% endfor %}
  </ul>
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

#### Publications:
<div class="container">
  <ul>
  {% for publication in site.data.publications %}
    {% if publication.tags and publication.tags contains "higgsless" %}
      <li>
        {{ publication.authors }} — <em>{{ publication.title }}</em>{% if publication.publication %}, {{ publication.publication }}{% endif %} ({{ publication.year }}){% if publication.url %}. <a href="{{ publication.url }}" target="_blank" rel="noopener">link</a>{% endif %}{% if publication.arxiv %} — <a href="https://arxiv.org/abs/{{ publication.arxiv }}">arXiv:{{ publication.arxiv }}</a>{% endif %}
      </li>
    {% endif %}
  {% endfor %}
  </ul>
</div>

#### Publications:
- I. Stomberg, A. Roper Pol, *“Gravitational wave spectra for cosmological phase transitions with non-linear decay of the fluid motion.”* *Contribution to the “2025 Gravitation: Proceedings of the 59th Rencontres de Moriond”* (2025), [arXiv:2508.04263](https://arxiv.org/abs/2508.04263).
- C. Caprini, R. Jinno, T. Konstandin, A. Roper Pol, H. Rubira, I. Stomberg, *“Gravitational waves from decaying sources in strong phase transitions,”* *J. High Energy Phys.* **07** (2025) 217, [arXiv:2409.03651](https://arxiv.org/abs/2409.03651).

### Multi-messenger searches of primordial magnetic fields and GWs with LISA and PTA

<div class="container">
  <div class="row">
    {% for person in site.data.collaborators %}
      {% if person.tags and person.tags contains "multi_messenger" %}
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

#### Publications:
<div class="container">
  <ul>
  {% for publication in site.data.publications %}
    {% if publication.tags and publication.tags contains "multi_messenger" %}
      <li>
        {{ publication.authors }} — <em>{{ publication.title }}</em>{% if publication.publication %}, {{ publication.publication }}{% endif %} ({{ publication.year }}){% if publication.url %}. <a href="{{ publication.url }}" target="_blank" rel="noopener">link</a>{% endif %}{% if publication.arxiv %} — <a href="https://arxiv.org/abs/{{ publication.arxiv }}">arXiv:{{ publication.arxiv }}</a>{% endif %}
      </li>
    {% endif %}
  {% endfor %}
  </ul>
</div>