document.addEventListener("DOMContentLoaded", () => {
  const registerForm = document.getElementById("registerForm");
  const loginForm = document.getElementById("loginForm");
  const switchToRegister = document.getElementById("switchToRegister");
  const switchToLogin = document.getElementById("switchToLogin");

  function toggleForms() {
    loginForm.classList.toggle("hidden");
    registerForm.classList.toggle("hidden");
  }

  if (switchToRegister) {
    switchToRegister.addEventListener("click", (e) => {
      e.preventDefault();
      toggleForms();
    });
  }

  if (switchToLogin) {
    switchToLogin.addEventListener("click", (e) => {
      e.preventDefault();
      toggleForms();
    });
  }

  if (registerForm) {
    registerForm.addEventListener("submit", function (e) {
      e.preventDefault();

      const formInputs = registerForm.querySelectorAll("input, select, textarea");

      const fullName = formInputs[0].value.trim();
      const email = formInputs[1].value.trim();
      const password = formInputs[2].value;
      const confirmPassword = formInputs[3].value;
      const dob = formInputs[4].value;
      const gender = formInputs[5].value;
      const address = formInputs[6].value.trim();
      const phone = formInputs[7].value.trim();
      const familyName = formInputs[8].value.trim();
      const emergencyContact = formInputs[9].value.trim();
      const familyEmail = formInputs[10].value.trim();
      const familyPassword = formInputs[11].value;
      const familyConfirmPassword = formInputs[12].value;

      const medicalConditions = formInputs[13].value.trim();
      const medications = formInputs[14].value.trim();
      const allergies = formInputs[15].value.trim();
      const accessibility = formInputs[16].value.trim();

      if (password !== confirmPassword) {
        alert("Resident passwords do not match.");
        return;
      }

      if (familyPassword !== familyConfirmPassword) {
        alert("Family member passwords do not match.");
        return;
      }

      fetch("http://localhost/Updated_Nav_Menu/api/register.php", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          fullName,
          email,
          password,
          dob,
          gender,
          address,
          phone,
          familyName,
          familyEmail,
          familyPassword,
          emergencyContact,
          medicalConditions,
          medications,
          allergies,
          accessibility
        })
      })
        .then((res) => res.json())
        .then((response) => {
          alert(response.message);
          if (response.status === "success") {
            toggleForms();
          }
        })
        .catch((err) => {
          console.error("Registration error:", err);
          alert("Something went wrong during registration.");
        });
    });
  }
});
