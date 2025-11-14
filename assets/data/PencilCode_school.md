---
layout: page
title: Pencil Code school (CERN, October 2025)
thumbnail-img: /assets/img/pc_logo.png
---

<!-- Playlist block (top-of-page) -->
<div id="pc-playlist" style="margin:1.5rem 0;padding:0.5rem;border:1px solid #ddd;border-radius:6px;background:#fafafa;">
	<h3>Playlist of all lectures</h3>
	<div style="display:flex;gap:1rem;align-items:flex-start;">
		<div style="flex:1;min-width:320px;">
			<iframe id="pc-main-player" src="" style="width:100%;height:360px;border:0;" allowfullscreen></iframe>
		</div>
		<div style="width:320px;max-height:360px;overflow:auto;border-left:1px solid #eee;padding-left:0.75rem;">
			<ul id="pc-playlist-list" style="list-style:none;margin:0;padding:0;"></ul>
		</div>
	</div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function(){
	// 1) collect all CDS iframe embeds currently on the page
	const originalIframes = Array.from(document.querySelectorAll('iframe[src*="cds.cern.ch/video/"]'));

	// build a videos array with id, title, and original iframe reference
	const videos = originalIframes.map((f, idx) => {
		const m = f.src.match(/video\/(\d+)/);
		const id = m ? m[1] : idx;
		let title = f.getAttribute('title') || '';
		if(!title){
			// try to find a nearby heading for a friendly title
			let el = f.parentElement;
			while(el && !el.previousElementSibling) el = el.parentElement;
			if(el){
				let sib = el.previousElementSibling;
				while(sib){
					const h = (sib.matches && sib.matches('h1,h2,h3,h4,h5,h6')) ? sib : (sib.querySelector && sib.querySelector('h1,h2,h3,h4,h5,h6'));
					if(h){ title = h.textContent.trim(); break; }
					sib = sib.previousElementSibling;
				}
			}
		}
		if(!title) title = 'Lecture ' + (idx+1);
		return { id, title, iframe: f };
	});

	// 2) replace each original iframe with a lightweight placeholder so the browser doesn't load all videos
	videos.forEach((v, idx) => {
		const f = v.iframe;
		// create placeholder element
		const placeholder = document.createElement('div');
		placeholder.className = 'pc-video-placeholder';
		placeholder.style.padding = '0.5rem 0';
		placeholder.style.border = '1px dashed #ddd';
		placeholder.style.borderRadius = '6px';
		placeholder.style.margin = '0.5rem 0';
		// title
		const titleEl = document.createElement('div');
		titleEl.textContent = v.title;
		titleEl.style.fontWeight = '700';
		titleEl.style.marginBottom = '0.5rem';
		// load button
		const btn = document.createElement('button');
		btn.textContent = 'Load video here';
		btn.className = 'btn btn-sm btn-outline-primary';
		btn.addEventListener('click', function(){
			// create iframe lazily and replace placeholder
			const newIframe = document.createElement('iframe');
			newIframe.src = 'https://cds.cern.ch/video/' + v.id + '?autoplay=0';
			newIframe.allow = 'autoplay;fullscreen';
			newIframe.style.width = '100%';
			newIframe.style.height = '360px';
			newIframe.frameBorder = '0';
			placeholder.parentNode.replaceChild(newIframe, placeholder);
		});
		placeholder.appendChild(titleEl);
		placeholder.appendChild(btn);

		// replace the iframe in the DOM with the placeholder
		try {
			f.parentNode.replaceChild(placeholder, f);
		} catch (e) {
			// ignore if already removed
		}
		// store placeholder ref for potential future use
		v.placeholder = placeholder;
	});

	// 3) build the top playlist that controls the main player iframe
	const list = document.getElementById('pc-playlist-list');
	const player = document.getElementById('pc-main-player');
	videos.forEach((v,i) => {
		const li = document.createElement('li');
		li.style.padding = '0.4rem 0';
		li.style.cursor = 'pointer';
		li.textContent = (i+1) + '. ' + v.title;
		li.addEventListener('click', () => {
			// load into main player (no heavy loading of all embeds)
			player.src = 'https://cds.cern.ch/video/' + v.id + '?autoplay=1';
			// optionally scroll to top to see player
			player.scrollIntoView({ behavior: 'smooth', block: 'center' });
		});
		list.appendChild(li);
	});

	// auto-load first video id in top player (no autoplay)
	if(videos.length) player.src = 'https://cds.cern.ch/video/' + videos[0].id + '?autoplay=0';

});
</script>

**Introduction**
1. [Welcome to the Pencil Code school](#welcome) (A. Roper Pol and A. Brandenburg)
2. [Introductions of the lecturers and students](#introductions)
3. [Concluding the school](#concluding) (A. Roper Pol)

**Lectures on Pencil Code:**
1. [Basics of Pencil Code](#basics) (P. Bourdin)
2. [Numerical schemes for differential equations](#numerics) (P. Bourdin and A. S. Midiri)
3. [Discrete Fourier transform and power spectra](#spectra) (I. Stomberg and S. Candelaresi)
4. [Post-processing and visualization](#visu) (A. Brandenburg, P. Bourdin and S. Candelaresi)
5. [Running on multiple CPUs. Parallelization](#cpus) (M. Rheinhardt)
6. [Data handling. I/O approaches](#io) (P. Bourdin)
7. [Contributing to the code: SVN, Github, Autotests](#svn) (A. Roper Pol)
8. [Accelerating Pencil Code on GPUs](#gpus) (M. Rheinhardt)

**Lectures on early Universe physics:**
1. [Magnetohydrodynamics in the early Universe](#mhd) (A. Roper Pol)
2. [Primordial magnetic fields](#pmfs) (A. Brandenburg and A. Roper Pol)
3. [Chiral MHD](#chiral) (D. Garg)
4. [Gravitational waves](#gws) (C. Caprini)
5. [Inflation](#inflation) (R. Sharma)
6. [First-order phase transitions](#fopts) (A. S. Midiri and I. Stomberg)
7. [CosmoGW](#cosmoGW) (A. Roper Pol)

**Practice sessions:**
1. [Getting familiar with the code](#practice0)
2. [Sound and Alfvén waves](#practice1)
3. [Forced helical turbulence](#practice2)
4. [Free hands-on session](#practicefree)
5. [Decaying MHD turbulence](#decayingMHD)
6. [Gravitational waves](#practice_GWs)

### Welcome to the Pencil Code school (20/10/2025 9:30am) by A. Roper Pol and A. Brandenburg {#welcome}

{% include cds_video.html id="2946581" title="Welcome to Pencil Code school" %}

### Introductions of the school lecturers and students (20/10/2025 10:30am) {#introductions}

{% include cds_video.html id="2946582" title="Introductions" %}

### Code lecture 1. Basics of Pencil Code (20/10/2025 11:30am) by P. Bourdin {#basics}

{% include cds_video.html id="2946583" title="Basics of Pencil Code" %}

### Practice session 1. Getting familiar with the code (20/10/2025 3pm) by A. Roper Pol {#practice0}

{% include cds_video.html id="2946749" title="Getting familiar with Pencil Code" %}

### Practice session 2. Sound waves and Alfvén waves (20/10/2025 4:30pm) by A. Roper Pol {#practice1}

{% include cds_video.html id="2946837" title="Sound and Alfven waves" %}

### Code lecture 2. Numerical schemes for differential equations (21/10/2025 9:30am) by P. Bourdin and A. Midiri {#numerics}

#### Part A
{% include cds_video.html id="2946610" title="Numerical schemes Part A" %}

#### Part B
{% include cds_video.html id="2946850" title="Numerical schemes Part B" %}

### Code lecture 3. Discrete Fourier transform and power spectra (21/10/2025 12:30pm) by I. Stomberg and S. Candelaresi {#spectra}

{% include cds_video.html id="2946699" title="Fourier transform and power spectra" %}

### Code lecture 4. Post-processing and visualization (21/10/2025 12:30pm) by A. Brandenburg, P. Bourdin and S. Candelaresi {#visu}

{% include cds_video.html id="2946838" title="Post-processing and visualization" %}

### Practice session 3. Forced helical turbulence (21/10/2025 4:30pm) by A. Roper Pol {#practice2}

{% include cds_video.html id="2946750" title="Forced helical turbulence" %}

### Code lecture 5. Running on multiple CPUs. Parallelization (22/10/2025 9:30am) by M. Rheinhardt {#cpus}

{% include cds_video.html id="2946839" title="Parallelization" %}

### Code lecture 6. Data handling. I/O approaches (22/10/2025 10:30am) by P. Bourdin {#io}

{% include cds_video.html id="2946698" title="Data handling. I/O approaches" %}

### Code lecture 7. Contributing to the code: SVN, Github, Autotests (22/10/2025 11:30am) by A. Roper Pol {#svn}

{% include cds_video.html id="2946840" title="Contributing to the code: SVN, Github, Autotests " %}

### Code lecture 8. Accelerating Pencil Code on GPUs (22/10/2025 12pm) by M. Rheinhardt {#gpus}

{% include cds_video.html id="2946841" title="Accelerating Pencil Code on GPUs" %}

### Practice session 4. Free hands-on session (22/10/2025 4pm) by A. Roper Pol {#practicefree}

{% include cds_video.html id="2946873" title="Free hands-on session" %}

### Physics lecture 1. Magnetohydrodynamics in the early Universe (23/10/2025 9:30am) by A. Roper Pol {#mhd}

{% include cds_video.html id="2946915" title="MHD in the early Universe" %}

### Physics lecture 2. Primordial magnetic fields (23/10/2025 11:30am) by A. Brandenburg and A. Roper Pol {#pmfs}

{% include cds_video.html id="2947112" title="Primordial magnetic fields" %}

### Physics lecture 3. Chiral magnetohydrodynamics (23/10/2025 12:30pm) by D. Garg {#chiral}

{% include cds_video.html id="2947113" title="Chiral MHD" %}

### Physics lecture 4. Gravitational waves (23/10/2025 2pm) by C. Caprini {#gws}

{% include cds_video.html id="2946978" title="Gravitational waves" %}


### Physics lecture 5. Inflation (23/10/2025 4pm) by R. Sharma {#inflation}

{% include cds_video.html id="2947120" title="Inflation" %}

### Practice session 5. Decaying MHD turbulence (24/10/2025 9:30am) by A. Roper Pol {#decayingMHD}

{% include cds_video.html id="2947117" title="Decaying MHD turbulence" %}

### Physics lecture 6. First-order phase transitions (23/10/2025 11:30am) by A. S. Midiri and I. Stomberg {#fopts}

{% include cds_video.html id="2947118" title="First-order phase transitions" %}


### Practice session 6. Gravitational waves (24/10/2025 2pm) by A. Roper Pol {#practice_GWs}

{% include cds_video.html id="2947209" title="Practice Gravitational Waves" %}

### Physics lecture 7. CosmoGW Python package (24/10/2025 3pm) by A. Roper Pol {#cosmoGW}

{% include cds_video.html id="2947210" title="CosmoGW" %}

### School closure (24/10/2025 5:30pm) by A. Roper Pol

{% include cds_video.html id="2947221" title="Closure" %}
