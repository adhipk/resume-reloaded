document.documentElement.classList.replace('no-js', 'js');

document.addEventListener('DOMContentLoaded', () => {
  const tabs = [...document.querySelectorAll('[role="tab"]')];
  const panels = [...document.querySelectorAll('[role="tabpanel"]')];
  const topBar = document.querySelector('.top-bar');
  const compactProfile = document.querySelector('#compact-profile');

  if (!tabs.length || !panels.length) return;

  function selectTab(tab, { focus = false, updateHash = true } = {}) {
    const panelId = tab.getAttribute('aria-controls');

    for (const item of tabs) {
      const selected = item === tab;
      item.setAttribute('aria-selected', String(selected));
      item.tabIndex = selected ? 0 : -1;
    }

    for (const panel of panels) {
      const selected = panel.id === panelId;
      panel.classList.toggle('is-active', selected);
      panel.hidden = !selected;
    }

    const showContext = panelId !== 'overview';
    topBar?.classList.toggle('has-context', showContext);
    compactProfile?.setAttribute('aria-hidden', String(!showContext));

    if (updateHash) history.replaceState(null, '', panelId === 'overview' ? location.pathname : `#${panelId}`);
    requestAnimationFrame(() => window.scrollTo(0, 0));
    if (focus) tab.focus();
  }

  for (const [index, tab] of tabs.entries()) {
    tab.addEventListener('click', () => selectTab(tab));
    tab.addEventListener('keydown', (event) => {
      let next = index;
      if (event.key === 'ArrowRight') next = (index + 1) % tabs.length;
      else if (event.key === 'ArrowLeft') next = (index - 1 + tabs.length) % tabs.length;
      else if (event.key === 'Home') next = 0;
      else if (event.key === 'End') next = tabs.length - 1;
      else return;

      event.preventDefault();
      selectTab(tabs[next], { focus: true });
    });
  }

  const initialPanel = location.hash.slice(1);
  const initialTab = tabs.find((tab) => tab.getAttribute('aria-controls') === initialPanel) || tabs[0];
  selectTab(initialTab, { updateHash: false });
});
