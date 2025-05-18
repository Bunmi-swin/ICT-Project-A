document.addEventListener('DOMContentLoaded', () => {
  const form = document.getElementById('bookingForm');

  form.addEventListener('submit', async (e) => {
    e.preventDefault(); // prevent default form submit

    // Create form data object
    const formData = new FormData(form);

    try {
      const response = await fetch(form.action, {
        method: 'POST',
        body: formData,
      });

      const result = await response.json();

      if (result.success) {
        alert(result.message);
        form.reset(); // clear the form on success
      } else {
        alert('Booking failed: ' + result.message);
      }
    } catch (error) {
      alert('An error occurred while booking the appointment.');
      console.error('Booking error:', error);
    }
  });
});
