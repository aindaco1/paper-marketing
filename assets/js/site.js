(() => {
  'use strict';
  document.querySelectorAll('[data-language-link]').forEach(link => {
    const target = new URL(link.href);
    target.hash = window.location.hash;
    link.href = target.toString();
  });
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
