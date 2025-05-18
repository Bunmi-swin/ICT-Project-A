console.log("login.js is running");

document.addEventListener('DOMContentLoaded', () => {
  const loginForm = document.getElementById('loginForm');

  loginForm.addEventListener('submit', async (e) => {
    e.preventDefault();

    const email = document.getElementById('email').value.trim();
    const password = document.getElementById('password').value;
    const role = document.getElementById('roleSelectLogin').value;

    if (!email || !password || !role) {
      alert('Please fill all fields');
      return;
    }

    try {
      const response = await fetch('http://localhost/Updated_Nav_Menu/api/login.php', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ email, password, role }),
      });

      const data = await response.json();
      console.log("Login response:", data); 

      if (data.status === 'success') {
        // ✅ Save login info
        localStorage.setItem('userEmail', data.email);
        localStorage.setItem('userRole', data.role);

        // ✅ Redirect based on role
        if (data.role === 'admin') {
          window.location.href = 'staffpage.html';
        } else if (data.role === 'resident') {
          window.location.href = 'resident.html';
        } else if (data.role === 'familymember') {
          window.location.href = 'familymember.html';
        } else {
          alert('Unknown role');
        }
      } else {
        alert(data.message);
      }
    } catch (error) {
      console.error('Error:', error);
      alert('An error occurred while logging in.');
    }
  });
});
