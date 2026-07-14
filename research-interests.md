---
layout: page
title: Research interests
---

My research interests lie at the intersection of theoretical cosmology, gravitational-wave phenomenology, relativistic MHD/plasma physics, and numerical simulations to probe the early Universe.
In particular, my two main areas of expertise are the study of [stochastic gravitational wave backgrounds from the early Universe](#gws) and the study of [primordial magnetic fields](#pmfs).

# Gravitational waves from the early Universe {#gws}

As a member of the LISA, Pulsar Timing Array, and the Lunar Gravitational Wave Antenna (LGWA) collaborations, I participate in different projects related to the study of early Universe physics via the observation of stochastic gravitational wave backgrounds.  I participated in the announcement of evidence for a gravitational wave background by the different Pulsar Timing Array Collaborations in June 2023 as a member of the European Pulsar Timing Array. Within the International Pulsar Timing Array Collaboration, I am one of the co-leaders of the group searching for new physics with PTA data.

#### Collaboration publications:
{% include publications-by-tag.html tag="collaboration" reversed=true %}

## Gravitational waves from first-order phase transitions

Gravitational waves are produced during a first-order phase transition due to the collision of expanding bubbles of the symmetry-broken phase.
As they expand, these bubbles drag the expanding primordial plasma leading to the formation of fluid shells around them. When these bubbles collide, they lead to the production of gravitational waves and can be a promising source for current pulsar timing array (PTA) observations and for the planned space-based detector LISA. Both experiments can be used to probe the early Universe at the QCD and the electroweak scale, respectively.

The main sources of gravitational waves from first-order phase transitions:
- **Sound waves**: compressional fluid motion in the linearized regime (small fluid perturbations)
- **Turbulence**: compressional (acoustic turbulence) and vortical motion of the fluid perturbations in the non-linear regime
- **Bubble collisions**: gradients of the scalar field

### Gravitational waves from sound waves

The sound-shell model assumes that the fluid perturbations are a linearized superposition of sound waves produced from each of the bubbles after they have collided. This model allows to reproduce the gravitational wave signal for weak phase transitions when the fluid perturbations are small.

Following the sound-shell model, we provided new results showing novel scaling at frequencies below the spectral peak that depend on the dynamics of the sound waves. We recovered the expected causal tail $\Omega_{\rm GW} \sim f^3$ at small frequencies and showed the impact of the expansion of the Universe. In a more recent publication, we have investigated the origin of the two relevant scales that appear in the GW spectrum, tracing their origin back to the fluid perturbations at the initial time when the bubbles of a first-order phase transition start to collide.

Our objective is to provide accurate estimates of the sound-wave contributions to the GW spectrum that will allow us to connect a potential observation by GW experiments like LISA with beyond the Standard Model physics leading to first-order phase transitions.

#### Main collaborators
{% include collaborators-by-tag.html tag="sound_waves" %}

#### Publications:
{% include publications-by-tag.html tag="sound_waves" reversed=true %}

### Higgsless simulations

Under the Higgsless approach, the fluid motion induced by the phase transitions can be studied by integrating out the dynamics of the scalar field, which occur within the bubble wall thickness, usually many orders of magnitude smaller than the fluid scales. This method allows to reduce the separation of scales between the fluid and the scalar field and capture most of the dynamics of the plasma in a first-order phase transition.

Together with collaborators, we presented the first numerical results of both the GW spectrum and the fluid dynamics for strong phase transitions, with $\alpha$ up to 0.5, where $\alpha$ determines the ratio of the latent heat released by the phase transition to the radiation energy density of the Universe at the time when the first-order phase transition occurs.

We provide a theoretical model that extends the stationary assumption considered for sound waves to a locally stationary assumption that allows us to incorporate the non-linear effect leading to the decay of the fluid kinetic energy. This model explains the observations from the Higgsless numerical simulations and provides a template that can be used for exploration of first-order phase transitions with LISA and PTA, while incorporating the non-linear dynamics of the source for strong first-order phase transitions and capturing the saturated amplitude of the resulting GW spectrum.

#### Main collaborators
{% include collaborators-by-tag.html tag="higgsless" %}

#### Publications:
{% include publications-by-tag.html tag="higgsless" reversed=true %}

### Gravitational waves from MHD turbulence

The gravitational wave (GW) production from MHD turbulence is inherently non-linear an requires high-performance simulations to be studied. Together with collaborators, we conducted the first numerical simulations to model the GW background produced from MHD turbulence using the open-source Pencil Code. We have also presented theoretical models that describe the resulting GW background under the so-called constant-in-time approach that has been validated against numerical simulations. These models are used by the LISA and PTA collaborations for parameter estimation and forecasts of turbulence processes and primordial magnetic fields in the early Universe.

#### Main collaborators
{% include collaborators-by-tag.html tag="turbulence_GWs" %}

#### Publications:
{% include publications-by-tag.html tag="turbulence_GWs" reversed=true %}

### Propagation of gravitational waves in modified theories of gravity and others

We studied the effect of Horndeski theories in the propagation of a gravitational wave background produced in the early Universe, finding that the overall amplitude and spectral shape can be modified when considering gravity theories beyond general relativity (GR), allowing us to use gravitational wave background observations to test GR. This work was led by PhD student at the time Yutong He. Together with Yutong and Axel, we also investigated the production of GWs due to the non-linear energy carried by GWs themselves.

#### Main collaborators
{% include collaborators-by-tag.html tag="modified_gravity" %}

#### Publications:
{% include publications-by-tag.html tag="modified_gravity" %}

## Primordial magnetic fields {#pmfs}

Magnetic fields are ubiquitous in our Universe, potentially present at all scales, from the magnetic field in our planet to the cosmic voids of the Large Scale Structure. Indirect observations from gamma-ray observatories provide evidence for intergalactic magnetic fields correlated at Mpc scales. These magnetic fields could have their origin in the early Universe and one of my main areas of research focuses on looking for signals from these magnetic fields in a multi-messenger approach, in particular combining gravitational wave observations with other cosmological or astrophysical probes.

### Multi-messenger searches of primordial magnetic fields and GWs with LISA and PTA

Together with collaborators, we proposed that the observations by the 12.5 year data release by NANOGrav in 2020 could be explained by the presence of a primordial magnetic field around the QCD scale, when the Universe was only $10^{-5}$ seconds old. Observations of GWs with Pulsar Timing Arrays (PTA) and LISA can be used to probe the origin of intergalactic magnetic fields and provide constraints on the strength and correlation length of the cosmological magnetic fields at the time when they were produced.

#### Main collaborators
{% include collaborators-by-tag.html tag="multi-messenger" %}

#### Publications:
{% include publications-by-tag.html tag="multi-messenger" reversed=true %}

## Evolution of primordial magnetic fields in the early Universe

After a primordial magnetic field is produced in the early Universe, it follows a process of turbulence decay, especially during the radiation-dominated era of the early Universe. As the field decays, its coherence length scale increases in a process known as inverse cascading. This process is most efficient for helical magnetic fields due to the conservation of helicity, and can be connected to searches of CP violation processes in the early Universe as, for example, baryogenesis. On the other hand, for zero-net helicity fields, simulations initially showed that inverse cascade is also possible, even though less efficient as for helical magnetic fields. Later theoretical developments proposed that this decay is mostly governed by the conservation of a magnetic Saffman integral (or Hosking invariant), providing an expected decay laws that have been tested in numerical simulations.

Together with my PhD student, Antonino Midiri, we have recently published a review on relativistic magnetohydrodynamics in an expanding Universe, where we provide for the first time, an extension of the MHD equations commonly used to study the evolution of primordial magnetic fields to the fully-relativistic regime of bulk velocities. Furthermore, we review the different rescalings of the MHD variables as well as conformal invariance, we provide corrections in the subrelativistic limit that were overlooked in previous work, and provide a generic theoretical framework to consistently include different forces to the fluid equations.

#### Main collaborators
{% include collaborators-by-tag.html tag="primordial_MFs" %}

#### Publications:
{% include publications-by-tag.html tag="primordial_MFs" reversed=true %}

## Primordial magnetic fields from chiral effect

In this work led by PhD student at CMU, Murman Gurgenidze, we investigated the chiral magnetic effect when a source of chirality is present. The chiral magnetic effect occurs at high energies when asymmetries in left and right fermion numbers lead to a chiral current that can amplify magnetic fields via a process of dynamo. At around the electroweak scale, it is expected that this effect is no longer relevant, as the fermions handedness tends to align with the magnetic field, effectively suppresing the anomalous current. However, if a source of chirality is introduced in a first-order phase transition, then the chiral magnetic effect can be temporally reactivated. We investigate this process using Pencil Code simulations and provide theoretical estimates for the strength and length scale of the resulting helical magnetic fields.

#### Main collaborators
{% include collaborators-by-tag.html tag="chiral_mhd" %}

#### Publications:
{% include publications-by-tag.html tag="chiral_mhd" reversed=true %}