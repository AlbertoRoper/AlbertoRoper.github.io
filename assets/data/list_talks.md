---
layout: page
title: Research Talks
---

{%- comment -%}
Initialize counters
{%- endcomment -%}

{% assign n_2026 = 0 %}
{% assign n_2025 = 0 %}
{% assign n_2024 = 0 %}
{% assign n_2023 = 0 %}
{% assign n_2022 = 0 %}
{% assign n_2021 = 0 %}
{% assign n_2020 = 0 %}
{% assign n_2019 = 0 %}
{% assign n_2018 = 0 %}
{% assign n_talks = 0 %}
{% assign n_invited = 0 %}


{%- comment -%}
Count talks per year
{%- endcomment -%}

{% for p in site.data.research_talks %}

  {% if p.year == "2026" %}
    {% assign n_2026 = n_2026 | plus: 1 %}
  {% elsif p.year == "2025" %}
    {% assign n_2025 = n_2025 | plus: 1 %}
  {% elsif p.year == "2024" %}
    {% assign n_2024 = n_2024 | plus: 1 %}
  {% elsif p.year == "2023" %}
    {% assign n_2023 = n_2023 | plus: 1 %}
  {% elsif p.year == "2022" %}
    {% assign n_2022 = n_2022 | plus: 1 %}
  {% elsif p.year == "2021" %}
    {% assign n_2021 = n_2021 | plus: 1 %}
  {% elsif p.year == "2020" %}
    {% assign n_2020 = n_2020 | plus: 1 %}
  {% elsif p.year == "2019" %}
    {% assign n_2019 = n_2019 | plus: 1 %}
  {% elsif p.year == "2018" %}
    {% assign n_2018 = n_2018 | plus: 1 %}
  {% endif %}
  {% if p.tags contains "invited" %}
    {% assign n_invited = n_invited | plus: 1 %}
  {% endif %}
  {% assign n_talks = n_talks | plus: 1 %}

{% endfor %}

{% assign n_talks = n_talks | plus: 2 %}
{% assign n_invited = n_invited | plus: 2 %}

{%- comment -%}
Compute numbering offsets
{%- endcomment -%}

{% assign start_2018 = n_2018 %}
{% assign start_2019 = start_2018 | plus : n_2019 | plus : 2 %}
{% assign start_2020 = start_2019 | plus : n_2020 %}
{% assign start_2021 = start_2020 | plus : n_2021 %}
{% assign start_2022 = start_2021 | plus : n_2022 %}
{% assign start_2023 = start_2022 | plus : n_2023 %}
{% assign start_2024 = start_2023 | plus : n_2024 %}
{% assign start_2025 = start_2024 | plus : n_2025 %}
{% assign start_2026 = start_2025 | plus : n_2026 %}

<div class="alert alert-info" style="border-radius: 8px; margin-bottom: 2rem; padding: 1.25rem;">
  <p style="margin-bottom: 0.5rem; font-size: 1.1rem;">
    Total of <strong> {{ n_talks }} talks</strong> at international workshops, seminars, and conferences, of which <strong><em> {{ n_invited }} are invited talks</em></strong> across <strong><em>23 different countries</em></strong>.
  </p>
  <p style="margin-bottom: 0.5rem;">
    For an interactive map with the locations of all talks, see 
    <a href="https://www.google.com/maps/d/u/0/embed?mid=1apMx7nqqrQUsK0ubH6NXLJ8JKhYc9cw&ehbc=2E312F" target="_blank" rel="noopener">
      <strong>MyMaps</strong>
    </a>.
  </p>
  <hr style="margin: 0.5rem 0;">
  <p style="margin-bottom: 0; font-size: 0.85rem;" class="text-muted">
    <em>Last updated on July 8, 2026</em>
  </p>
</div>

---

{%- comment -%}
Render talks
{%- endcomment -%}

{% if n_2026 > 0 %}
{% include talks_by_year.html year="2026" reversed=true start=start_2026 %}
{% endif %}

{% if n_2025 > 0 %}
{% include talks_by_year.html year="2025" reversed=true start=start_2025 %}
{% endif %}

{% if n_2024 > 0 %}
{% include talks_by_year.html year="2024" reversed=true start=start_2024 %}
{% endif %}

{% if n_2023 > 0 %}
{% include talks_by_year.html year="2023" reversed=true start=start_2023 %}
{% endif %}

{% if n_2022 > 0 %}
{% include talks_by_year.html year="2022" reversed=true start=start_2022 %}
{% endif %}

{% if n_2021 > 0 %}
{% include talks_by_year.html year="2021" reversed=true start=start_2021 %}
{% endif %}

{% if n_2020 > 0 %}
{% include talks_by_year.html year="2020" reversed=true start=start_2020 %}
{% endif %}

{% if n_2019 > 0 %}
{% include talks_by_year.html year="2019" reversed=true start=start_2019 %}
{% endif %}

{% if n_2018 > 0 %}
{% include talks_by_year.html year="2018" reversed=true start=start_2018 %}
{% endif %}