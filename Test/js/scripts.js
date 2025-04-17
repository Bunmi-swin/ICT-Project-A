 // List of scripts used throughout the website.

 //Console.log monitoring for switching pages

    //selects navigation links with class="nav-link"
    const navLinks = document.querySelectorAll(".nav-link");
    navLinks.forEach(link => {
      link.addEventListener("click", (event) => {
        const destination = link.getAttribute("href");
        console.log(`User navigated to: ${destination}`);
      });
    });

      // Default user role for sessions(Role Based Access)
    //Changes through functions like signing it. Resets if tabs are closed.
    sessionStorage.setItem("role", "Guest"); 

    // Check user's current role and restrict access
    const role = sessionStorage.getItem("role");
    // Define users and their roles:

    const users = [
      { email: "Calmmind@gmail.com", username: "Defender", role: "admin", time: "2 years" },
      { email: "Gogetter@outlook.com", username: "Racer", role: "familymember", time: "1 year" },
      { email: "247Ready@gmail.com", username: "Battler", role: "resident", time: "1 year"}
    ];

    function toggleForms() {
      document.getElementById("loginForm").classList.toggle("hidden");
      document.getElementById("registerForm").classList.toggle("hidden");
    }
    
    document.addEventListener("DOMContentLoaded", () => {
      // Check if the current page is Login test 1.html
      if (document.title === "Aged Care Login & Register") {
        // Attach the login function to the form
        const loginForm = document.getElementById("loginForm");
        //console.log("loginForm:", loginForm); // Debugging statement
        if (loginForm) {
          loginForm.addEventListener("submit", login);
        } else {
          console.error("Element with id 'loginForm' not found in the DOM.");
        }
      
        // Attach event listeners to the "Register" and "Login" links
        const switchToRegister = document.getElementById("switchToRegister");
        if (switchToRegister) {
          switchToRegister.addEventListener("click", (event) => {
            event.preventDefault();
            toggleForms();
          });
        } else {
          console.error("Element with id 'switchToRegister' not found in the DOM.");
        }
    
        const switchToLogin = document.getElementById("switchToLogin");
        if (switchToLogin) {
          // Register form handling
      const registerForm = document.getElementById("registerForm");
      if (registerForm) {
        registerForm.addEventListener("submit", function (e) {
          e.preventDefault();

    const formInputs = registerForm.querySelectorAll("input, select");
    const email = formInputs[1].value.trim();
    const password = formInputs[2].value;
    const confirmPassword = formInputs[3].value;
    const role = registerForm.querySelector("#roleSelect")?.value;

    if (password !== confirmPassword) {
      alert("Passwords do not match.");
      return;
    }

    // Fetch existing users from localStorage
    let storedUsers = JSON.parse(localStorage.getItem("users")) || [];

    if (storedUsers.some(user => user.email === email)) {
      alert("An account with this email already exists.");
      return;
    }

    storedUsers.push({ email, password, role });
    localStorage.setItem("users", JSON.stringify(storedUsers));
    alert("Registration successful! You can now log in.");
    toggleForms();
  });
}

          switchToLogin.addEventListener("click", (event) => {
            event.preventDefault();
            toggleForms();
          });
        } else {
          console.error("Element with id 'switchToLogin' not found in the DOM.");
        }
      }
    });

    

    function login(event) {
      event.preventDefault();
    
      const inputEmail = document.getElementById("email").value.trim();
      const inputPassword = document.getElementById("password").value.trim();
      const roleSelect = document.getElementById("roleSelect").value;
    
      console.log("Email entered:", inputEmail);
      console.log("Password entered:", inputPassword);
      console.log("Role selected:", roleSelect);
    
      const storedUsers = JSON.parse(localStorage.getItem("users")) || [];
    
      const allUsers = [...users, ...storedUsers];
    
      const user = allUsers.find(
        u => u.email === inputEmail && u.password === inputPassword && u.role === roleSelect
      );
    
      if (!user) {
        alert("Invalid email, password, or role.");
        return;
      }
    
      // Store role & username (or email if no username)
      sessionStorage.setItem("role", user.role);
      sessionStorage.setItem("username", user.username || user.email);
    
      // Log and redirect
      alert("Login successful! Redirecting...");
    
      if (user.role === "admin") {
        alert("Login successful! Redirecting to admin page...");
        window.location.href = "staffpage.html";
      } else if (user.role === "familymember") {
        alert("Login successful! Redirecting to family member page...");
        window.location.href = "familymember.html";
      } else if (user.role === "resident") {
        alert("Login successful! Redirecting to resident page...");
        window.location.href = "resident.html";
      } else {
        alert("Unknown role. Please contact support.");
      }
    }
    

      function switchrole(role){
        if (role == "Staff"){
        sessionStorage.setItem("role", "Staff"); 
      }else if (role == "Carer"){
        sessionStorage.setItem("role", "Carer"); 
      } else if (role == "User"){
        sessionStorage.setItem("role", "User"); 
      }
  
      }


    function verifyadminaccess(event){
    //Link to admin only page, etc. is clicked
    if (role !== "Staff") {
        // Stop default behaviour and prevent access.
        profileLink.addEventListener("click", (event) => {
          event.preventDefault();
          alert("Access denied: Only staff can view this page.");
        });
    }
  }

   //Adaptive filling for staff page
  document.addEventListener("DOMContentLoaded", () => {
    // Check if the current page is the staff page
    if (window.location.pathname.endsWith("staff.html")) {
      // Retrieve the username and role from sessionStorage
      const username = sessionStorage.getItem("username");
      
  
      // Update the profileplaceholder elements if username exists
      if (username) {
        const usernamePlaceholder = document.getElementById("profileplaceholder");
        const employmentPlaceholder = document.getElementById("profileplaceholder2");
  
        if (usernamePlaceholder) {
          usernamePlaceholder.textContent = `Username: ${username}`;
        }
  
        if (employmentPlaceholder) {
          // Find the user's employment length from the users array
          const user = users.find(u => u.username === username);
          if (user) {
            employmentPlaceholder.textContent = `Length of Employment: ${user.time}`;
          }
        }
      } else {
        // Redirect to login page if no username is found
        alert("You are not logged in. Redirecting to login page.");
        window.location.href = "login test 1.html";
      }
    }
  });

   //Adaptive filling for patient page
  document.addEventListener("DOMContentLoaded", () => {
    // Check if the current page is the patient page
    if (window.location.pathname.endsWith("patient.html")) {
      // Retrieve the username and role from sessionStorage
      const username = sessionStorage.getItem("username");
      
  
      // Update the profileplaceholder elements if username exists
      if (username) {
        const usernamePlaceholder = document.getElementById("profileplaceholder");
        const employmentPlaceholder = document.getElementById("profileplaceholder2");
  
        if (usernamePlaceholder) {
          usernamePlaceholder.textContent = `Username: ${username}`;
        }
  
        if (employmentPlaceholder) {
          // Find the user's employment length from the users array
          const user = users.find(u => u.username === username);
          if (user) {
            employmentPlaceholder.textContent = `Length of Membership: ${user.time}`;
          }
        }
      } else {
        // Redirect to login page if no username is found
        alert("You are not logged in. Redirecting to login page.");
        window.location.href = "login test 1.html";
      }
    }
  });
  
  //Adaptive filling for carer page
  document.addEventListener("DOMContentLoaded", () => {
    // Check if the current page is the carer page
    if (window.location.pathname.endsWith("carer.html")) {
      // Retrieve the username and role from sessionStorage
      const username = sessionStorage.getItem("username");
      
  
      // Update the profileplaceholder elements if username exists
      if (username) {
        const usernamePlaceholder = document.getElementById("profileplaceholder");
        const employmentPlaceholder = document.getElementById("profileplaceholder2");
  
        if (usernamePlaceholder) {
          usernamePlaceholder.textContent = `Username: ${username}`;
        }
  
        if (employmentPlaceholder) {
          // Find the user's employment length from the users array
          const user = users.find(u => u.username === username);
          if (user) {
            employmentPlaceholder.textContent = `Length of Membership: ${user.time}`;
          }
        }
      } else {
        // Redirect to login page if no username is found
        alert("You are not logged in. Redirecting to login page.");
        window.location.href = "login test 1.html";
      }
    }
  });

  const logs = []; // Array to store log messages

// Override console.log to include timestamps
const originalConsoleLog = console.log;
console.log = function (...args) {
  const now = new Date();
  const hours = now.getHours();
  const minutes = now.getMinutes().toString().padStart(2, "0");
  const ampm = hours >= 12 ? "pm" : "am";
  const formattedHours = hours % 12 || 12;
  const timestamp = `${formattedHours}:${minutes}${ampm}`;
  const logMessage = `[${timestamp}] ${args.join(" ")}`;
  
  // Store the log message in the logs array
  logs.push(logMessage);

  //Call the list of console.log outputs
  originalConsoleLog(logMessage);
}
// Example logs
console.log("User B successfully logged in.");
console.log("User A logged out.");

// Save logs to sessionStorage
window.addEventListener("beforeunload", () => {
  sessionStorage.setItem("logs", JSON.stringify(logs));
});

// Retrieve logs from sessionStorage on page load
document.addEventListener("DOMContentLoaded", () => {
  const storedLogs = JSON.parse(sessionStorage.getItem("logs"));
  if (storedLogs) {
    logs.push(...storedLogs);
  }
});


//Monitoring for staff only
document.addEventListener("DOMContentLoaded", () => {
  // Create a button to download logs
  const downloadButton = document.createElement("button");
  downloadButton.textContent = "Download Logs";
  downloadButton.onclick = function () {
    const blob = new Blob([logs.join("\n")], { type: "text/plain" });
    const link = document.createElement("a");
    link.href = URL.createObjectURL(blob);
    link.download = "console_logs.txt";
    link.click();
  };

  // Append the button only on the staff page
  if (window.location.pathname.endsWith("staffpage.html")) {
    const monitoringstaffactivity = document.getElementById("monitoringstaffactivity");
    if (monitoringstaffactivity) {
      monitoringstaffactivity.appendChild(downloadButton); // Add the button to the Staff Schedule section
    } else {
      console.error("Element with id 'Staff Schedule' not found.");
    }
  }
});