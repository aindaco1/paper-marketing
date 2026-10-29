(() => {
  'use strict';
  document.querySelectorAll('[data-language-link]').forEach(link => {
    const target = new URL(link.href);
    target.hash = window.location.hash;
    link.href = target.toString();
  });
  // Just the Docs 0.12 assumes focusout always names the next element.
  // Clicking nonfocusable content or leaving the window can supply null.
  document.addEventListener('focusout', event => {
    if (event.relatedTarget || !(event.target instanceof Element)) return;
    if (!event.target.matches('#search-input') && !event.target.closest('#search-results')) return;
    document.documentElement.classList.remove('search-active');
    event.stopImmediatePropagation();
  }, true);
  const sample = document.getElementById('texture-sample');
  if (!sample) return;
  const controls = document.querySelector('[data-preview-controls]');
  const toggle = document.getElementById('texture-toggle');
  const intensity = document.getElementById('intensity');
  const labels = JSON.parse(document.getElementById('preview-labels').textContent);
  const layer = sample.querySelector('.sample-texture');
  function update() {
    const selected = document.querySelector('input[name="texture"]:checked').value;
    // Values come from the three local radio choices; no network or saved preferences.
    layer.style.backgroundImage = `url(/assets/textures/${selected}.png)`;
    layer.style.opacity = toggle.checked ? Number(intensity.value) / 100 : 0;
    document.getElementById('intensity-value').value = `${intensity.value}%`;
    document.getElementById('preview-status').value = labels[toggle.checked ? 'on' : 'off'];
  }
  controls.hidden = false;
  controls.addEventListener('input', update);
  update();
})();
