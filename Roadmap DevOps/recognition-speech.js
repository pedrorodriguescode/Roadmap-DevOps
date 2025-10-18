var recognition = new (window.SpeechRecognition || window.webkitSpeechRecognition)();
recognition.lang = 'en-US';
recognition.interimResults = false;
recognition.maxAlternatives = 1;
var isRecognizing = false;

window.addEventListener('keydown', function(e) {
  if (e.key === 'Shift' && !isRecognizing) {
    isRecognizing = true;
    recognition.start();
  }
});

window.addEventListener('keyup', function(e) {
  if (e.key === 'Shift' && isRecognizing) {
    recognition.stop();
    isRecognizing = false;
  }
});

recognition.onresult = function(event) {
  var voiceToText = event.results[0][0].transcript;
  console.log('Recognized speech: ' + voiceToText);

  fetch('process-voice.php', {
    method: 'POST',
    headers: {'Content-Type': 'application/x-www-form-urlencoded'},
    body: 'voiceToText=' + encodeURIComponent(voiceToText)
  })
  .then(res => res.json())
  .then(data => {
    console.log('Server response:', data);
    var utterance = new SpeechSynthesisUtterance(data.message);
    utterance.lang = 'en-GB';
    speechSynthesis.speak(utterance);
    var estimatedTime = data.message.length * 150; // Estimate 150ms per character
    if (data.message.includes('has been marked') || data.message.includes('has been unmarked')) {
      setTimeout(() => {
        console.log('Reloading after speech...');
        window.location.href = window.location.href;
      }, estimatedTime);
    }
  })
  .catch(error => {
    console.error('Error:', error);
  });
};
