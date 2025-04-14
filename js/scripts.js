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

    // Example of role based access functions
    // Check user's current role and restrict access
    const role = sessionStorage.getItem("role");
    // Define users and their roles:

    const users = [
      { email: "Calmmind@gmail.com", username: "Defender", role: "Staff" },
      { email: "Gogetter@outlook.com", username: "Racer", role: "Carer" },
      { email: "247Ready@gmail.com", username: "Battler", role: "User" }
    ];

    function toggleForms() {
      document.getElementById("loginForm").classList.toggle("hidden");
      document.getElementById("registerForm").classList.toggle("hidden");
    }
    
    // Attach event listeners to the "Register" and "Login" links
    document.getElementById("switchToRegister").addEventListener("click", (event) => {
      event.preventDefault(); // Prevent default link behavior
      toggleForms();
    });
    
    document.getElementById("switchToLogin").addEventListener("click", (event) => {
      event.preventDefault(); // Prevent default link behavior
      toggleForms();
    });

      document.getElementById('loginForm').addEventListener('submit', login)
    

    function login(event) {
      event.preventDefault(); // Prevent form submission
    
      const inputEmail = document.getElementById("email").value.trim();
      const inputPassword = document.getElementById("password").value.trim();
      const roleSelect = document.getElementById("roleSelect").value;
    
      // Find the user by email
      const user = users.find(u => u.email === inputEmail);
    
      // Simulate password validation
      const validPasswords = { Defender: "*Sh^eld*", Racer: "Speed64", Battler: "Triumph@nt" };
      if (!user || validPasswords[user.username] !== inputPassword) {
        alert("Invalid email or password.");
        return;
      }
    
      // Check if the selected role matches the user's role
      if (user.role.toLowerCase() !== roleSelect.toLowerCase()) {
        alert("Selected role does not match your account role.");
        return;
      }
    
      // Store the user's role and username in sessionStorage
      sessionStorage.setItem("role", user.role);
      sessionStorage.setItem("username", user.username);
    
      // Redirect based on role
      if (user.role === "Staff") {
        alert("Login successful! Redirecting to staff page...");
        window.location.href = "staff.html";
      } else if (user.role === "Carer") {
        alert("Login successful! Redirecting to carer page...");
        window.location.href = "carer.html";
      } else if (user.role === "User") {
        alert("Login successful! Redirecting to patient page...");
        window.location.href = "patient.html";
      } else {
        alert("Unknown role. Please contact support.");
      }
    }
    
    // Attach the login function to the form
    document.getElementById("loginForm").addEventListener("submit", login);

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