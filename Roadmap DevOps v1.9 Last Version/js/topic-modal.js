document.addEventListener('click', function(e) {
  var topic_id = e.target.getAttribute('data-topic-id');
  if (topic_id !== null) {
    fetch('../backend/process-topic-modal.php', {
      method: 'POST',
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: 'topic_id=' + encodeURIComponent(topic_id)
    })
    .then(response => response.json())
    .then(data => {
      document.getElementById('exampleModalLabel').textContent = data.name;
      document.querySelector('#exampleModal .modal-body').textContent = data.description;
    })
  }
});




