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

   // const users = [
   //   { email: "Calmmind@gmail.com", username: "Defender", role: "Staff", time: "2 years" },
   //   { email: "Gogetter@outlook.com", username: "Racer", role: "Carer", time: "1 year" },
   //   { email: "247Ready@gmail.com", username: "Battler", role: "User", time: "1 year"}
   // ];

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
          switchToLogin.addEventListener("click", (event) => {
            event.preventDefault();
            toggleForms();
          });
        } else {
          console.error("Element with id 'switchToLogin' not found in the DOM.");
        }
      }
    });

    

    document.getElementById('loginForm').addEventListener('submit', async function (e) {
        e.preventDefault(); // Prevent form submission
      
        const inputEmail = document.getElementById("email").value.trim();
        const inputPassword = document.getElementById("password").value.trim();
        //password_hash()
        
      
        const response = await fetch('http://localhost/ICT-Project-A/api/login.php', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({ email, password }),
      });

      const result = await response.json();
    if (result.status === 'success') {
        alert(result.message);
        
                // Store the user's role and username in sessionStorage
          sessionStorage.setItem("role", user.role);
          sessionStorage.setItem("username", user.username);
          // Redirect based on role
          //const roleSelect = document.getElementById("roleSelect").value;
        
        if (result.role === "Staff") {
          alert("Login successful! Redirecting to staff page...");
          window.location.href = "staff.html";
      } else if (result.role === "Carer") {
          alert("Login successful! Redirecting to carer page...");
          window.location.href = "carer.html";
        } else if (result.role === "User") {
          alert("Login successful! Redirecting to patient page...");
          window.location.href = "patient.html";
        } else {
          alert("Unknown role. Please contact support.");
        }
    } else {
        alert(result.message);
    }
  });
     //   console.log("Email entered:", inputEmail);
     //   console.log("Password entered:", inputPassword);
     // console.log("Role selected:", roleSelect);
      
        // Find the user by email
     //   console.log("User found:", user);
      
      
        // Check if the email is valid
    //    if (!user) {
    //      alert("Invalid email.");
    //      return;
    //    }
      
        // Check if the password is correct
   //     if (validPasswords[user.username] !== inputPassword) {
   //       alert("Invalid password.");
   //       return;
   //     }
      
        // Check if the selected role matches the user's role
   //     if (user.role !== roleSelect) {
   //       alert("Selected role does not match your account role.");
   //       return;
   //     }

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
  if (window.location.pathname.endsWith("staff.html")) {
    const staffScheduleDiv = document.getElementById("Staff Schedule");
    if (staffScheduleDiv) {
      staffScheduleDiv.appendChild(downloadButton); // Add the button to the Staff Schedule section
    } else {
      console.error("Element with id 'Staff Schedule' not found.");
    }
  }
});