
{%- assign submitted_matches = site.data.publications | where_exp: "item", "item.tags and item.tags contains 'submitted'" -%}
{%- assign n_submitted = submitted_matches | size -%}

{%- assign published_matches = site.data.publications | where_exp: "item", "item.tags and item.tags contains 'published'" -%}
{%- assign n_published = published_matches | size -%}

{%- assign proceedings_matches = site.data.publications | where_exp: "item", "item.tags and item.tags contains 'proceedings'" -%}
{%- assign n_proceedings = proceedings_matches | size -%}

{%- assign start_submitted = n_submitted | plus: 0 -%}
{%- assign start_published = n_submitted | plus: n_published -%}
{%- assign start_proceedings = n_submitted | plus: n_published | plus: n_proceedings -%}

{% include publications-by-tag.html tag="submitted" reversed=true start=start_submitted title="Submitted" %}

{% include publications-by-tag.html tag="published" reversed=true start=start_published title="Published" %}

{% include publications-by-tag.html tag="proceedings" reversed=true title="Proceedings" %}