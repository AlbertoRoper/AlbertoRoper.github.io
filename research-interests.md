---
layout: page
title: Research interests
---

## Gravitational waves from first-order phase transitions

Gravitational waves are produced during a first-order phase transition due to the collision of expanding bubbles of the symmetry-broken phase.
As they expand, these bubbles drag the expanding primordial plasma leading to the formation of fluid shells around them.
When these bubbles collide, they lead to the production of gravitational waves and can be a promising source for current pulsar timing array (PTA) observations and for the planned space-based detector LISA.
Both experiments can be used to probe the early Universe at the QCD and the electroweak scale, respectively.a

The main sources of gravitational waves from first-order phase transitions:
- Sound waves: compressional fluid motion in the linearized regime (small fluid perturbations)
- Turbulence: compressional (acoustic turbulence) and vortical motion of the fluid perturbations in the linear regime
- Bubble collisions: gradients of the scalar field

### Gravitational waves from sound waves

The sound-shell model assumes that the fluid perturbations are a linearized superposition of sound waves produced from each of the bubbles after they have collided. This model allows to reproduce the gravitational wave signal for weak phase transitions when the fluid perturbations are small.

#### Publications:
{% include publications-by-tag.html tag="sound_waves" %}

## Main collaborators
{% include collaborators-by-tag.html tag="sound_waves" %}

<!-- <div class="container">
  <div class="collaborator-row">
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
</div> -->

#### Publications:
{% include publications-by-tag.html tag="phase_transitions" %}

### Gravitational waves from phase transitions (Higgsless simulations)

<div class="container">
  <div class="collaborator-row">
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
{% include publications-by-tag.html tag="higgsless" %}

### Gravitational waves from MHD turbulence

<div class="container">
  <div class="collaborator-row">
    {% for person in site.data.collaborators %}
      {% if person.tags and person.tags contains "turbulence_GWs" %}
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
{% include publications-by-tag.html tag="turbulence_GWs" %}

### Multi-messenger searches of primordial magnetic fields and GWs with LISA and PTA

<div class="container">
  <div class="collaborator-row">
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
{% include publications-by-tag.html tag="multi-messenger"%}