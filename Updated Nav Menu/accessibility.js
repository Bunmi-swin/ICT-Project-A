let currentFontSize = 16;
let darkModeEnabled = false;

function toggleAccessibilityMenu() {
    const menu = document.getElementById('accessibility-menu');
    menu.style.display = (menu.style.display === 'none') ? 'block' : 'none';
}

function increaseTextSize() {
    currentFontSize += 2;
    document.body.style.fontSize = currentFontSize + 'px';
}

function decreaseTextSize() {
    if (currentFontSize > 10) {
        currentFontSize -= 2;
        document.body.style.fontSize = currentFontSize + 'px';
    }
}

function toggleDarkMode() {
    darkModeEnabled = !darkModeEnabled;
    applyDarkMode(darkModeEnabled);
}

function applyDarkMode(enabled) {
    const nav = document.querySelector('nav');
    const links = document.querySelectorAll('nav a');
    if (enabled) {
        document.body.style.backgroundColor = '#1e1e1e';
        document.body.style.color = '#f0f0f0';
        nav.style.backgroundColor = '#333';
        links.forEach(link => link.style.color = '#fff');
    } else {
        document.body.style.backgroundColor = '';
        document.body.style.color = '';
        nav.style.backgroundColor = 'lightcyan';
        links.forEach(link => link.style.color = 'black');
    }
}

function resetDefaults() {
    currentFontSize = 16;
    document.body.style.fontSize = currentFontSize + 'px';
    darkModeEnabled = false;
    applyDarkMode(false);
}
