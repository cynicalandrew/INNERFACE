// camera.js
window.addEventListener('DOMContentLoaded', () => {
  const video = document.getElementById('cameraStream');

  if (!video) {
    console.error("No video element found with id 'cameraStream'");
    return;
  }

  navigator.mediaDevices.getUserMedia({ video: true })
    .then((stream) => {
      video.srcObject = stream;
    })
    .catch((err) => {
      console.error("Camera access error:", err);
    });
});