# Resume Reloaded

The source and deployment configuration for [adhipk.dev](https://adhipk.dev). A single Markdown file produces a compact Gruvbox portfolio and a one-page PDF résumé.

## Build

Requires Pandoc and WeasyPrint:

```bash
bun install
bun run build
```

Generated artifacts land in `out/`:

- `index.html` — semantic tabbed portfolio with a no-script fallback
- `Adhip_Kashyap_resume.pdf` — printable résumé
- static assets, redirects, robots, and sitemap files

`out/` is disposable. Each build stages a complete replacement and swaps it in
only after every HTML, PDF, and asset generation step succeeds.

## Preview and deploy

```bash
bun run dev
bun run deploy:dry
bun run deploy
```

Cloudflare Workers Static Assets serves `out/`. Wrangler deploys both the `workers.dev` preview and the production `adhipk.dev/*` route.

## Source layout

- `resumes/resume.md` — website and print copy
- `templates/web.html` — web metadata and semantic shell
- `css/web.css` — responsive portfolio design
- `css/print.css` — one-page résumé design
- `assets/` — optimized source assets
- `static/` — Cloudflare redirects and discovery files
