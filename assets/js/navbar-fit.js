// Debounced navbar fit detection
(function(){
  function debounce(fn, wait){
    let t;
    return function(){
      clearTimeout(t);
      t = setTimeout(() => fn.apply(this, arguments), wait);
    };
  }

  function navFit(){
    const navEl = document.querySelector('nav.navbar');
    if(!navEl) return;
    const collapse = navEl.querySelector('#main-navbar');
    const navul = navEl.querySelector('#main-navbar .navbar-nav');
    const brand = navEl.querySelector('.navbar-brand');
    const extras = navEl.querySelector('.navbar-extra-left');
    const avatar = navEl.querySelector('.avatar-container');
    const toggler = navEl.querySelector('.navbar-toggler');

    const winW = window.innerWidth;
    // Always use toggle on small screens (below xl breakpoint: 1200px)
    if(winW < 1200){
      navEl.classList.remove('nav-expanded');
      if(collapse) collapse.classList.remove('show');
      if(toggler) toggler.style.display = '';
      return;
    }

    // Compute available space in navbar for nav items
    const navPadding = 40; // small buffer
    const brandW = brand ? brand.offsetWidth : 0;
    const extrasW = extras ? extras.offsetWidth : 0;
    const avatarW = avatar ? avatar.offsetWidth : 0;
    const avail = navEl.clientWidth - brandW - extrasW - avatarW - navPadding;

    // Sum nav items width
    let navWidth = 0;
    if(navul){
      Array.from(navul.children).forEach(function(li){
        // include margins
        const style = window.getComputedStyle(li);
        const w = li.offsetWidth + parseFloat(style.marginLeft || 0) + parseFloat(style.marginRight || 0);
        navWidth += w;
      });
    }

    if(navWidth <= avail){
      // Enough space: expand inline
      navEl.classList.add('nav-expanded');
      if(collapse) collapse.classList.add('show');
      if(toggler) toggler.style.display = 'none';
    } else {
      // Not enough space: collapse into toggler
      navEl.classList.remove('nav-expanded');
      if(collapse) collapse.classList.remove('show');
      if(toggler) toggler.style.display = '';
    }
  }

  document.addEventListener('DOMContentLoaded', function(){
    navFit();
    window.addEventListener('resize', debounce(navFit, 120));
  });
})();
