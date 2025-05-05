// Function to open the sidebar
function openNav() {
    document.getElementById("mySidebar").style.width = "280px";
    // Remove margin adjustment to prevent dynamic resizing
    // document.getElementById("main").style.marginLeft = "280px";
    document.getElementById("overlay").style.display = "block";
    
    // Change menu button to 'X' animation
    document.querySelector('.menu-btn').classList.add('open');
}

// Function to close the sidebar
function closeNav() {
    document.getElementById("mySidebar").style.width = "0";
    // Remove margin adjustment to prevent dynamic resizing
    // document.getElementById("main").style.marginLeft = "0";
    document.getElementById("overlay").style.display = "none";
    
    // Revert menu button to normal
    document.querySelector('.menu-btn').classList.remove('open');
}

// Toggle the sidebar menu
function toggleNav() {
    if (document.getElementById("mySidebar").style.width === "250px") {
        closeNav();
    } else { //No user input = No conditional change in "openNav" object
        openNav();
    }
}

// Close the sidebar when clicking outside of it
document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('overlay').addEventListener('click', closeNav);
});