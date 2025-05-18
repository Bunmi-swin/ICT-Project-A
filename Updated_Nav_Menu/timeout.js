// timeout.js
window.addEventListener("DOMContentLoaded", () => {
  // Create the overlay HTML
  const overlay = document.createElement("div");
  overlay.className = "timeout-overlay";
  overlay.id = "timeoutOverlay";
  overlay.innerHTML = `
    <div class="timeout-popup">
      <p>You have been logged out due to inactivity.</p>
      <button id="loginRedirectBtn">Login Again</button>
    </div>
  `;
  document.body.appendChild(overlay);

  // Add styles for overlay and popup
  const style = document.createElement("style");
  style.textContent = `
    .timeout-overlay {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      backdrop-filter: blur(5px);
      background-color: rgba(0, 0, 0, 0.3);
      display: none;
      justify-content: center;
      align-items: center;
      z-index: 1000;
    }

    .timeout-popup {
      background-color: white;
      padding: 30px;
      border-radius: 12px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
      text-align: center;
      max-width: 300px;
    }

    .timeout-popup button {
      margin-top: 20px;
      padding: 10px 20px;
      background-color: #007BFF;
      border: none;
      border-radius: 6px;
      color: white;
      cursor: pointer;
    }

    .popup button:hover {
      background-color: #0056b3;
    }
  `;
  document.head.appendChild(style);

  // Timeout duration for inactivity (60 seconds)
  const timeoutDuration = 60000;

  let timeout;

  // Function to show the overlay after inactivity
  const showTimeoutOverlay = () => {
    document.getElementById("timeoutOverlay").style.display = "flex";
  };

  // Function to reset the timeout (e.g., if user interacts with the page)
  const resetTimeout = () => {
    clearTimeout(timeout);
    timeout = setTimeout(showTimeoutOverlay, timeoutDuration); // Reset the timeout
  };

  // Set the initial timeout
  timeout = setTimeout(showTimeoutOverlay, timeoutDuration);

  // Listen for user activity to reset the timeout (e.g., mousemove, keypress)
  window.addEventListener("mousemove", resetTimeout);
  window.addEventListener("keypress", resetTimeout);

  // Redirect to login page on button click
  document.addEventListener("click", function (e) {
    if (e.target && e.target.id === "loginRedirectBtn") {
      window.location.href = "loginagainaftertimeout.html"; 
    }
  });
});
