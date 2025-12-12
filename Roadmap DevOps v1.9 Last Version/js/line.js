var row = document.querySelector('#roadmap .row.col-md-12');
var roadmap = document.getElementById('roadmap');

function updateLineWidth() {
  var width = row.scrollWidth;
  row.style.setProperty('--roadmap-width', width + 'px'); 
  roadmap.style.setProperty('--win-width', (width-20) + 'px'); 
}

window.addEventListener('load', updateLineWidth);
window.addEventListener('resize', updateLineWidth);
