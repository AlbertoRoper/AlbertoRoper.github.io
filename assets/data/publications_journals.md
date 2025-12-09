
{%- comment -%}
Count publications per tag using explicit loops (compatible with GitHub Pages' Liquid).
{%- endcomment -%}

{%- assign n_submitted = 0 -%}
{%- assign n_published = 0 -%}
{%- assign n_proceedings = 0 -%}

{%- for p in site.data.publications -%}
	{%- if p.tags and p.tags contains 'submitted' -%}
		{%- assign n_submitted = n_submitted | plus: 1 -%}
	{%- endif -%}
	{%- if p.tags and p.tags contains 'published' -%}
		{%- assign n_published = n_published | plus: 1 -%}
	{%- endif -%}
	{%- if p.tags and p.tags contains 'proceedings' -%}
		{%- assign n_proceedings = n_proceedings | plus: 1 -%}
	{%- endif -%}
{%- endfor -%}

{%- assign start_submitted = n_submitted | plus: 0 -%}
{%- assign start_published = n_submitted | plus: n_published -%}
{%- assign start_proceedings = n_submitted | plus: n_published | plus: n_proceedings -%}

{% include publications-by-tag.html tag="submitted" reversed=true start=start_submitted title="Submitted" %}

{% include publications-by-tag.html tag="published" reversed=true start=start_published title="Published" %}

{% include publications-by-tag.html tag="proceedings" reversed=true start=start_proceedings title="Proceedings" %}

{% include publications-by-tag.html tag="dataset" reversed=true title="Datasets" %}