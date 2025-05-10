document.getElementById('bookingForm').addEventListener('submit', function(event) {
  event.preventDefault();

  const formData = new FormData(this);

  fetch('http://localhost/Updated%20Nav%20Menu/api/book_appointment.php', {
    method: 'POST',
    body: formData
  })
  .then(response => response.json())
  .then(data => {
    if (data.success) {
      alert('Appointment booked successfully!');
      document.getElementById('bookingForm').reset();
    } else {
      alert('Failed to book appointment: ' + data.error);
    }
  })
  .catch(error => {
    console.error('Error:', error);
    alert('An error occurred. Please try again later.');
  });
});

function handleLogout() {
  alert("You have been logged out.");
}
