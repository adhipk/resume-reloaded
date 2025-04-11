// Theme switching functionality
document.addEventListener('DOMContentLoaded', () => {
  // Check for saved theme preference or use system preference
  const prefersDarkScheme = window.matchMedia('(prefers-color-scheme: dark)');
  const savedTheme = localStorage.getItem('theme');
  
  // Function to set theme
  const setTheme = (isDark) => {
    if (isDark) {
      document.documentElement.classList.remove('light');
      localStorage.setItem('theme', 'dark');
    } else {
      document.documentElement.classList.add('light');
      localStorage.setItem('theme', 'light');
    }
  };
  
  // Initialize theme based on saved preference or system preference
  if (savedTheme) {
    setTheme(savedTheme === 'dark');
  } else {
    setTheme(prefersDarkScheme.matches);
  }
  
  // Create theme toggle button
  const createThemeToggle = () => {
    const toggleButton = document.createElement('button');
    toggleButton.className = 'theme-toggle';
    toggleButton.setAttribute('aria-label', 'Toggle theme');
    
    // Create SVG icons for sun and moon
    const sunIcon = `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="5"/><line x1="12" y1="1" x2="12" y2="3"/><line x1="12" y1="21" x2="12" y2="23"/><line x1="4.22" y1="4.22" x2="5.64" y2="5.64"/><line x1="18.36" y1="18.36" x2="19.78" y2="19.78"/><line x1="1" y1="12" x2="3" y2="12"/><line x1="21" y1="12" x2="23" y2="12"/><line x1="4.22" y1="19.78" x2="5.64" y2="18.36"/><line x1="18.36" y1="5.64" x2="19.78" y2="4.22"/></svg>`;
    const moonIcon = `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M21 12.79A9 9 0 1 1 11.21 3 7 7 0 0 0 21 12.79z"/></svg>`;
    
    // Set initial icon
    toggleButton.innerHTML = document.documentElement.classList.contains('light') ? moonIcon : sunIcon;
    
    // Add click event
    toggleButton.addEventListener('click', () => {
      const isDark = document.documentElement.classList.contains('light');
      setTheme(isDark);
      toggleButton.innerHTML = isDark ? sunIcon : moonIcon;
    });
    
    // Add to document
    document.body.appendChild(toggleButton);
  };
  
  // Create the toggle button
  createThemeToggle();
  
  // Listen for system preference changes
  prefersDarkScheme.addEventListener('change', (e) => {
    if (!localStorage.getItem('theme')) {
      setTheme(e.matches);
    }
  });
}); 