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
        {{ publication.authors }} — <em>{{ publication.title }}</em>{% if publication.venue %}, {{ publication.venue }}{% endif %} ({{ publication.year }}){% if publication.url %}. <a href="{{ publication.url }}" target="_blank" rel="noopener">link</a>{% endif %}{% if publication.arxiv %} — <a href="https://arxiv.org/abs/{{ publication.arxiv }}">arXiv:{{ publication.arxiv }}</a>{% endif %}
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
- A. Roper Pol, S. Procacci, C. Caprini, *“Characterization of the gravitational wave spectrum from sound waves within the sound shell model,”* *Phys. Rev. D* **109**, 063531 (2024), [arXiv:2308.12943](https://arxiv.org/abs/2308.12943).

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
- A. Roper Pol, A. Neronov, C. Caprini, T. Boyer, and D. Semikoz, *“LISA and γ-ray telescopes as multi-messenger probes of a first-order cosmological phase transition,”* *submitted to Astron. Astrophys.*, [arXiv:2307.10744](https://arxiv.org/abs/2307.10744) (2023).
- A. Neronov, A. Roper Pol, C. Caprini, and D. Semikoz, *“NANOGrav signal from MHD turbulence at the QCD phase transition in the early universe,”* *Phys. Rev. D* **103**, L041302 (2021), [arXiv:2009.14174](https://arxiv.org/abs/2009.14174).
- A. Roper Pol, *“Gravitational waves from MHD turbulence at the QCD phase transition as a source for Pulsar Timing Arrays.”* *Contribution to the “2022 Gravitation: Proceedings of the 56th Rencontres de Moriond”* (2022), [arXiv:2205.09261](https://arxiv.org/abs/2205.09261).