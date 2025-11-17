---
layout: page
---

![](/assets/img/cover_page_pc_school.jpg)
![](/assets/img/pc_school_background.png)

<!-- Playlist block (top-of-page) -->
<div id="pc-playlist" style="margin:1.5rem 0;padding:0.5rem;border:1px solid #ddd;border-radius:6px;background:#fafafa;">
		<h3>Playlist of all lectures</h3>
		<div style="margin-top:0.25rem;font-size:0.9rem;color:#444;">
			<a id="pc-open-in-tab" href="#" target="_blank" rel="noopener" style="display:inline-block;margin-right:0.75rem;">Open current video in new tab</a>
			<span style="color:#666;font-size:0.85rem;">(use this if fullscreen does not work)</span>
		</div>
	<div style="display:flex;gap:1rem;align-items:flex-start;">
		<div style="flex:1;min-width:320px;">
			<div id="pc-main-player-wrap" style="position:relative;padding-bottom:56.25%;height:0;overflow:hidden;max-width:100%;">
				<iframe id="pc-main-player" src="" style="position:absolute;top:0;left:0;width:100%;height:100%;border:0;" title="Pencil Code lecture player" allow="autoplay; fullscreen; encrypted-media; picture-in-picture" allowfullscreen webkitallowfullscreen mozallowfullscreen></iframe>
			</div>
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

	// 2) replace each original iframe's responsive wrapper with a lightweight placeholder so the browser doesn't load all videos
	videos.forEach((v, idx) => {
		const f = v.iframe;
		const container = f.parentNode; // the responsive wrapper div created by the include
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
					// create responsive iframe lazily and replace placeholder
					const wrap = document.createElement('div');
					wrap.style.position = 'relative';
					wrap.style.paddingBottom = '56.25%';
					wrap.style.height = '0';
					wrap.style.overflow = 'hidden';
					wrap.style.maxWidth = '100%';
					const newIframe = document.createElement('iframe');
					newIframe.src = 'https://cds.cern.ch/video/' + v.id + '?autoplay=0';
					newIframe.setAttribute('allow', 'autoplay; fullscreen; encrypted-media; picture-in-picture');
					newIframe.setAttribute('title', v.title || 'Pencil Code lecture');
					newIframe.setAttribute('allowfullscreen', '');
					newIframe.setAttribute('webkitallowfullscreen', '');
					newIframe.setAttribute('mozallowfullscreen', '');
					newIframe.style.position = 'absolute';
					newIframe.style.top = '0';
					newIframe.style.left = '0';
					newIframe.style.width = '100%';
					newIframe.style.height = '100%';
					newIframe.frameBorder = '0';
					wrap.appendChild(newIframe);
					placeholder.parentNode.replaceChild(wrap, placeholder);
				});
		placeholder.appendChild(titleEl);
		placeholder.appendChild(btn);

		// replace the entire responsive wrapper container with the placeholder
		try {
			if (container && container.parentNode) {
				container.parentNode.replaceChild(placeholder, container);
			} else {
				// fallback: replace the iframe itself
				f.parentNode.replaceChild(placeholder, f);
			}
		} catch (e) {
			// ignore if already removed
		}
		// store placeholder ref for potential future use
		v.placeholder = placeholder;
	});

	// 3) build the top playlist that controls the main player iframe
	const list = document.getElementById('pc-playlist-list');
	const player = document.getElementById('pc-main-player');
	// ensure the main player explicitly allows fullscreen at the DOM level (covers some browser quirks)
	try { player.allowFullscreen = true; player.setAttribute('allowfullscreen',''); player.setAttribute('webkitallowfullscreen',''); player.setAttribute('mozallowfullscreen',''); } catch(e){}
	// helper to (re)create the main player iframe inside the responsive wrapper
	function loadMainVideo(id, title, autoplay) {
		const wrap = document.getElementById('pc-main-player-wrap');
		if(!wrap) return;
		// create fresh responsive wrapper and iframe (matching _includes/cds_video.html)
		const newWrap = document.createElement('div');
		newWrap.id = 'pc-main-player-wrap';
		newWrap.style.position = 'relative';
		newWrap.style.paddingBottom = '56.25%';
		newWrap.style.height = '0';
		newWrap.style.overflow = 'hidden';
		newWrap.style.maxWidth = '100%';
		const newIframe = document.createElement('iframe');
		newIframe.id = 'pc-main-player';
		newIframe.setAttribute('width', '640');
		newIframe.setAttribute('height', '360');
		newIframe.setAttribute('frameborder', '0');
		newIframe.setAttribute('title', title || 'Pencil Code lecture');
		newIframe.setAttribute('src', 'https://cds.cern.ch/video/' + id + (autoplay ? '?autoplay=1' : '?autoplay=0'));
		newIframe.setAttribute('allowfullscreen', '');
		newIframe.setAttribute('webkitallowfullscreen', '');
		newIframe.setAttribute('mozallowfullscreen', '');
		// include a broad allow policy as well
	// broader allow policy (includes common features players may request)
	newIframe.setAttribute('allow', 'accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; fullscreen');
		newIframe.style.position = 'absolute';
		newIframe.style.top = '0';
		newIframe.style.left = '0';
		newIframe.style.width = '100%';
		newIframe.style.height = '100%';
		try { newIframe.allowFullscreen = true; } catch(e){}
		newWrap.appendChild(newIframe);
		// replace current wrap content (keep the id so future calls find it)
		wrap.parentNode.replaceChild(newWrap, wrap);
		// update player reference to the newly created iframe
		return newIframe;
	}

	videos.forEach((v,i) => {
		const li = document.createElement('li');
		li.style.padding = '0.4rem 0';
		li.style.cursor = 'pointer';
		li.textContent = (i+1) + '. ' + v.title;
		li.addEventListener('click', () => {
			// recreate the main player iframe fresh (this restores original include semantics)
			const newPlayer = loadMainVideo(v.id, v.title, true);
			if(newPlayer){
				// update the 'open in new tab' link and scroll the new player into view
				const openLink = document.getElementById('pc-open-in-tab');
				if(openLink) openLink.href = 'https://cds.cern.ch/video/' + v.id;
				newPlayer.scrollIntoView({ behavior: 'smooth', block: 'center' });
			}
		});
		list.appendChild(li);
	});

	// auto-load first video id in top player (no autoplay) by creating the iframe fresh
	if(videos.length) {
		const first = loadMainVideo(videos[0].id, videos[0].title, false);
		if(first) {
			try { first.allowFullscreen = true; } catch(e){}
			const openLink = document.getElementById('pc-open-in-tab');
			if(openLink) openLink.href = 'https://cds.cern.ch/video/' + videos[0].id;
		}
	}

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

**Practice sessions:**
1. [Getting familiar with the code](#practice0)
2. [Sound and Alfvén waves](#practice1)
3. [Forced helical turbulence](#practice2)
4. [Free hands-on session](#practicefree)
5. [Decaying MHD turbulence](#decayingMHD)
6. [Gravitational waves and CosmoGW](#practice_GWs)

### Welcome to the Pencil Code school (20/10/2025 9:30am) by A. Roper Pol and A. Brandenburg {#welcome}

{% include cds_video.html id="2946581" title="Welcome to Pencil Code school" %}

{% include download-box.html file="/assets/files/PC_school/PC_school_welcome.pdf" title="Welcome slides by A. Roper Pol" icon_img="/assets/img/photo_profile.jpeg"%}
{% include download-box.html file="/assets/files/PC_school/Brandenburg-Monday.pdf" title="Welcome slides by A. Brandenburg" icon_img="/assets/img/brandenburg_pic.jpg"%}

### Introductions of the school lecturers and students (20/10/2025 10:30am) {#introductions}

{% include cds_video.html id="2946582" title="Introductions" %}

### Code lecture 1. Basics of Pencil Code (20/10/2025 11:30am) by P. Bourdin {#basics}

{% include cds_video.html id="2946583" title="Basics of Pencil Code" %}

{% include download-box.html file="/assets/files/PC_school/Presentation-Bourdin Basics of PC.pdf" title="Code lecture 1. Basics of Pencil Code by P. Bourdin" icon="pdf"%}

### Practice session 0. Getting familiar with the code (20/10/2025 3pm) by A. Roper Pol {#practice0}

{% include cds_video.html id="2946749" title="Getting familiar with Pencil Code" %}

### Practice session 1. Sound waves and Alfvén waves (20/10/2025 4:30pm) by A. Roper Pol {#practice1}

{% include cds_video.html id="2946837" title="Sound and Alfven waves" %}

{% include download-box.html file="/assets/files/PC_school/session1a.pdf" title="Practice session 1a sheet. Sound waves" icon="pdf"%}
{% include download-box.html file="/assets/files/PC_school/session1a.zip" title="Practice session 1a files. Sound waves" icon="zip"%}

{% include download-box.html file="/assets/files/PC_school/session1b.pdf" title="Practice session 1b sheet. Alfvén waves" icon="pdf"%}

### Code lecture 2. Numerical schemes for differential equations (21/10/2025 9:30am) by A. Midiri and P. Bourdin {#numerics}

#### Part A (A. S. Midiri)
{% include cds_video.html id="2946610" title="Numerical schemes. Part A" %}

{% include download-box.html file="/assets/files/PC_school/EvolutionAlgorithms_PartI_Midiri.pdf" title="Code lecture 2. Numerical schemes. Lecture by A. S. Midiri" icon_img="/assets/img/antonino_pic.jpg"%}

#### Part B (P. Bourdin)
{% include cds_video.html id="2946850" title="Numerical schemes. Part B" %}

{% include download-box.html file="/assets/files/PC_school/Presentation-Bourdin Derivatives.pdf" title="Code lecture 2. Numerical schemes. Lecture by P. Bourdin" icon="pdf" %}

### Code lecture 3. Discrete Fourier transform and power spectra (21/10/2025 12:30pm) by I. Stomberg and S. Candelaresi {#spectra}

{% include cds_video.html id="2946699" title="Fourier transform and power spectra" %}

{% include download-box.html file="/assets/files/PC_school/Pencil Code School - Power Spectra and the DFT.pdf" title="Code lecture 3. Discrete Fourier transform and power spectra. Slides by I. Stomberg" icon_img="assets/img/stomberg_pic.png" %}

### Code lecture 4. Post-processing and visualization (21/10/2025 12:30pm) by A. Brandenburg, P. Bourdin and S. Candelaresi {#visu}

{% include cds_video.html id="2946838" title="Post-processing and visualization" %}

{% include download-box.html file="/assets/files/PC_school/Brandenburg-Tuesday.pdf" title="Code lecture 4. Post-processing and visualization. Slides by A. Brandenburg" icon_img="assets/img/brandenburg_pic.jpg" %}

{% include download-box.html file="/assets/files/PC_school/python_session_candelaresi.zip" title="Code lecture 4. Post-processing and visualization. Files by S. Candelaresi" icon="zip" %}

### Practice session 2. Forced helical turbulence (21/10/2025 4:30pm) by A. Roper Pol {#practice2}

{% include cds_video.html id="2946750" title="Forced helical turbulence" %}

{% include download-box.html file="/assets/files/PC_school/session2_sheet.pdf" title="Practice session 2 sheet. Forced helical turbulence" icon="pdf"%}
{% include download-box.html file="/assets/files/PC_school/session2a_run.zip" title="Practice session 2 files. Forced helical turbulence" icon="zip"%}

### Code lecture 5. Running on multiple CPUs. Parallelization (22/10/2025 9:30am) by M. Rheinhardt {#cpus}

{% include cds_video.html id="2946839" title="Parallelization" %}

{% include download-box.html file="/assets/files/PC_school/Parallel.pdf" title="Code lecture 5. Parallelization. Slides by M. Rheinhardt" icon="pdf"%}

### Code lecture 6. Data handling. I/O approaches (22/10/2025 10:30am) by P. Bourdin {#io}

{% include cds_video.html id="2946698" title="Data handling. I/O approaches" %}

{% include download-box.html file="/assets/files/PC_school/Presentation-Bourdin IO.pdf" title="Code lecture 6. Data handling. I/O approaches. Slides by P. Bourdin" icon="pdf"%}

### Code lecture 7. Contributing to the code: SVN, Github, Autotests (22/10/2025 11:30am) by A. Roper Pol {#svn}

{% include cds_video.html id="2946840" title="Contributing to the code: SVN, Github, Autotests " %}

### Code lecture 8. Accelerating Pencil Code on GPUs (22/10/2025 12pm) by M. Rheinhardt {#gpus}

{% include cds_video.html id="2946841" title="Accelerating Pencil Code on GPUs" %}

{% include download-box.html file="/assets/files/PC_school/PCA_GPU_session.pdf" title="Code lecture 8. GPU acceleration. Slides by M. Rheinhardt" icon="pdf" %}

### Practice session 3. Free hands-on session (22/10/2025 4pm) by A. Roper Pol {#practicefree}

{% include cds_video.html id="2946873" title="Free hands-on session" %}

### Physics lecture 1. Magnetohydrodynamics in the early Universe (23/10/2025 9:30am) by A. Roper Pol {#mhd}

{% include cds_video.html id="2946915" title="MHD in the early Universe" %}

{% include download-box.html file="/assets/files/PC_school/plasma_physics_mhd_lecture.pdf" title="Physics lecture 1. Magnetohydrodynamics in the early Universe. Slides by A. Roper Pol>" icon_img="assets/img/photo_profile.jpeg" %}

### Physics lecture 2. Primordial magnetic fields (23/10/2025 11:30am) by A. Brandenburg and A. Roper Pol {#pmfs}

{% include cds_video.html id="2947112" title="Primordial magnetic fields" %}

{% include download-box.html file="/assets/files/PC_school/primordial_magnetic_fields_GWs.pdf" title="Physics lecture 2. Primordial magnetic fields. Slides by A. Roper Pol" icon_img="assets/img/photo_profile.jpeg" %}

### Physics lecture 3. Chiral magnetohydrodynamics (23/10/2025 12:30pm) by D. Garg {#chiral}

{% include cds_video.html id="2947113" title="Chiral MHD" %}

{% include download-box.html file="/assets/files/PC_school/Pencil Code MHD.pptx" title="Physics lecture 3. Chiral magnetohydrodynamics. Slides by D. Garg" icon_img="assets/img/deepen_pic.jpg" %}

### Physics lecture 4. Gravitational waves (23/10/2025 2pm) by C. Caprini {#gws}

{% include cds_video.html id="2946978" title="Gravitational waves" %}

{% include download-box.html file="/assets/files/PC_school/Pencil_code_school_Chiara.pdf" title="Physics lecture 4. Gravitational waves. Slides by C. Caprini" icon_img="assets/img/chiara_pic.png" %}


### Physics lecture 5. Inflation (23/10/2025 4pm) by R. Sharma {#inflation}

{% include cds_video.html id="2947120" title="Inflation" %}

{% include download-box.html file="/assets/files/PC_school/Inflation_pencil_code_school.pdf" title="Physics lecture 5. Inflation. Slides by R. Sharma" icon="pdf" %}

### Practice session 3. Decaying MHD turbulence (24/10/2025 9:30am) by A. Roper Pol {#decayingMHD}

{% include cds_video.html id="2947117" title="Decaying MHD turbulence" %}

{% include download-box.html file="/assets/files/PC_school/session3_sheet.pdf" title="Practice session 3. Decaying MHD turbulence" icon="pdf"%}
{% include download-box.html file="/assets/files/PC_school/session3_data.zip" title="Practice session 3. Decaying MHD turbulence" icon="zip"%}

### Physics lecture 6. First-order phase transitions (23/10/2025 11:30am) by A. S. Midiri and I. Stomberg {#fopts}

Part A (A. S. Midiri)
{% include cds_video.html id="2947118" title="First-order phase transitions. Part A" %}

Part B (I. Stomberg)
{% include cds_video.html id="2947209" title="First-order phase transitions. Part B" %}

### Practice session 5. Gravitational waves and CosmoGW Python package (24/10/2025 3pm) by A. Roper Pol {#practice_GWs}

{% include cds_video.html id="2947210" title="CosmoGW" %}

### School closure (24/10/2025 5:30pm) by A. Roper Pol

{% include cds_video.html id="2947221" title="Closure" %}
