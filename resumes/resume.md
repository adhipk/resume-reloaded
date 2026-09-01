---
title: Adhip Kashyap
lang: en-US
description: AI systems engineer and solutions architect building reliable voice AI, evaluation platforms, and developer tools.
canonical: https://adhipk.dev
target: index
---

```{=html}
<div class="web-only">
  <section class="hero" aria-labelledby="hero-title">
    <div class="hero-copy">
      <p class="eyebrow">AI systems engineer · Solutions architect</p>
      <h1 id="hero-title">I turn ambiguous AI workflows into reliable software.</h1>
      <p class="lede">I design and ship production AI systems, evaluation platforms, and developer tools—with a bias toward observable behavior, reviewable change, and humane interfaces.</p>
      <div class="hero-actions">
        <a class="button button-primary" href="/Adhip_Kashyap_resume.pdf">Read my résumé <span aria-hidden="true">↗</span></a>
        <a class="button button-secondary" href="mailto:adhip.kashyap@gmail.com">Start a conversation</a>
      </div>
      <ul class="contact-list" aria-label="Contact and profile links">
        <li>Thousand Oaks, California</li>
        <li><a href="https://github.com/adhipk" rel="me">GitHub</a></li>
        <li><a href="https://linkedin.com/in/adhip-kashyap" rel="me">LinkedIn</a></li>
      </ul>
    </div>
    <figure class="portrait-wrap">
      <img class="portrait" src="/portrait.webp" width="760" height="900" alt="Adhip Kashyap outdoors" fetchpriority="high">
      <figcaption><span class="status-dot" aria-hidden="true"></span> Building dependable AI for healthcare</figcaption>
    </figure>
  </section>

  <section class="proof-grid" aria-label="Selected proof points">
    <article><strong>80/80</strong><span>targeted regression runs passed after a scheduling workflow hardening pass</span></article>
    <article><strong>6,600+</strong><span>calls reconciled across metadata, structured outputs, transcripts, and tool evidence</span></article>
    <article><strong>3 envs</strong><span>reviewed promotion and drift detection across development, staging, and production</span></article>
  </section>

  <section class="section" id="work">
    <div class="section-heading">
      <p class="section-index">01 / Selected work</p>
      <h2>Systems built for the messy middle.</h2>
      <p>My best work sits between model behavior, product workflows, and the infrastructure that makes both trustworthy.</p>
    </div>
    <div class="case-list">
      <article class="case-study">
        <p class="case-kicker">Delivery platform · Healthcare voice AI</p>
        <h3>Made a multi-agent system reviewable, testable, and promotable.</h3>
        <p>Turned assistants, tools, workflows, structured outputs, and simulations into version-controlled resources with schema checks, hash-based drift detection, dry runs, and approval-gated promotion across three environments.</p>
        <ul class="tags" aria-label="Technologies"><li>TypeScript</li><li>Bun</li><li>GitHub Actions</li><li>LLM evaluations</li></ul>
      </article>
      <article class="case-study">
        <p class="case-kicker">Reliability · Conversational scheduling</p>
        <h3>Closed the loop between prompt changes and observed behavior.</h3>
        <p>Designed and hardened routing, qualification, slot selection, patient information, booking, and human handoff workflows. Paired each change with scenario-based evaluations; a focused eight-scenario matrix passed all 80 runs after the latest fixes.</p>
        <ul class="tags" aria-label="Technologies"><li>Voice AI</li><li>Scenario testing</li><li>Tool orchestration</li><li>Regression analysis</li></ul>
      </article>
      <article class="case-study">
        <p class="case-kicker">Evidence · Call analytics</p>
        <h3>Tested headline metrics against what actually happened.</h3>
        <p>Built a PHI-conscious DuckDB pipeline and reproducible report workbench that reconciles platform metadata and structured outputs with transcript and tool evidence across more than 6,600 calls—surfacing reliability gaps before they shaped decisions.</p>
        <ul class="tags" aria-label="Technologies"><li>DuckDB</li><li>AWS S3</li><li>SQLite</li><li>Reproducible reports</li></ul>
      </article>
    </div>
  </section>

  <section class="section" id="experience">
    <div class="section-heading compact">
      <p class="section-index">02 / Experience</p>
      <h2>From architecture to production.</h2>
    </div>
    <div class="timeline">
      <article class="role">
        <div class="role-meta"><p>TechAhead</p><time>2025 — now</time></div>
        <div><h3>AI Software Engineer <span>for Hoag</span></h3><p>Own the delivery and reliability layers around a healthcare voice-AI system. Extended a NestJS scheduling bridge with FHIR-based batch operations, combo-appointment handling, retryable validation, and fuzzy location matching; built an S3/Vapi call inspector for incident investigation.</p></div>
      </article>
      <article class="role">
        <div class="role-meta"><p>TechAhead</p><time>2025 — now</time></div>
        <div><h3>Client Solutions Architect</h3><p>Translate product discovery into pragmatic AI and backend architectures, prototypes, delivery plans, and technical proposals for client teams.</p></div>
      </article>
      <article class="role">
        <div class="role-meta"><p>Teaching Solved</p><time>2024 — 2025</time></div>
        <div><h3>Founding Engineer</h3><p>Built the initial Next.js, PostgreSQL, and AWS product for educators to create and share language-learning resources, including retrieval-assisted discovery for culturally relevant content.</p></div>
      </article>
      <article class="role">
        <div class="role-meta"><p>Earlier</p><time>2019 — 2023</time></div>
        <div><h3>Software engineering · InduzBuy & ICICI Lombard</h3><p>Modernized a PHP commerce platform, built a BERT classification workflow, decomposed insurance services, and developed a Neo4j decision engine for premium calculations.</p></div>
      </article>
    </div>
  </section>

  <section class="section" id="projects">
    <div class="section-heading">
      <p class="section-index">03 / Independent work</p>
      <h2>Tools I wanted to exist.</h2>
      <p>Current experiments span local-first publishing, agent interfaces, developer infrastructure, typography, and hardware automation.</p>
    </div>
    <div class="project-grid">
      <article class="project featured"><p class="project-number">P01</p><h3>Cloudflare Devkit</h3><p>A reusable Bun and TypeScript toolkit for scaffolding, validating, publishing, and deploying Cloudflare services—from static sites and Hono APIs to D1, R2, and cron Workers.</p><a href="https://github.com/adhipk/cloudflare-devkit">View source <span aria-hidden="true">↗</span></a><ul class="tags"><li>Cloudflare</li><li>TypeScript</li><li>Bun</li></ul></article>
      <article class="project"><p class="project-number">P02</p><h3>Dotlocal</h3><p>A local-first workspace for technical data stories: in-browser editing, live preview, Marimo WASM notebooks, and project-scoped publishing without coupling source files to a deployed site.</p><ul class="tags"><li>TypeScript</li><li>Marimo</li><li>Observable Plot</li></ul></article>
      <article class="project"><p class="project-number">P03</p><h3>Hyperspace</h3><p>An HTML-first workspace that brings coding-agent sessions, live progress, task state, and per-project artifacts into one browser hub backed by a lightweight event spine.</p><ul class="tags"><li>Node.js</li><li>SSE</li><li>Agent tooling</li></ul></article>
      <article class="project"><p class="project-number">P04</p><h3>Sojournal Sans</h3><p>An experimental OpenType font that makes raw Markdown resemble rendered Markdown while preserving plain text through contextual substitutions and ligatures.</p><a href="https://github.com/adhipk/sojournal-font">View source <span aria-hidden="true">↗</span></a><ul class="tags"><li>Python</li><li>fontTools</li><li>OpenType</li></ul></article>
      <article class="project"><p class="project-number">P05</p><h3>ADB Phone Lab</h3><p>A command-line lab for Android hardware experiments: sensor inspection, secure-camera capture, USB webcam switching, orientation-aware recording, and an OBS bridge.</p><a href="https://github.com/adhipk/adb-phone-lab">View source <span aria-hidden="true">↗</span></a><ul class="tags"><li>ADB</li><li>Bash</li><li>Node.js</li></ul></article>
    </div>
  </section>

  <section class="section capabilities" id="capabilities">
    <div class="section-heading compact"><p class="section-index">04 / Capabilities</p><h2>A broad stack, used selectively.</h2></div>
    <div class="capability-grid">
      <div><h3>AI systems</h3><p>Voice agents, multi-agent orchestration, LLM evaluations, RAG, prompt and tool design, observability.</p></div>
      <div><h3>Backend & data</h3><p>TypeScript, Bun/Node.js, Python, Java, NestJS, Hono, FHIR, PostgreSQL, SQLite, DuckDB.</p></div>
      <div><h3>Platforms</h3><p>Cloudflare Workers, AWS, Docker, GitHub Actions, Terraform, React, Next.js.</p></div>
    </div>
  </section>

  <section class="closing" id="contact">
    <p class="section-index">05 / Contact</p>
    <h2>Have a difficult system to make dependable?</h2>
    <a href="mailto:adhip.kashyap@gmail.com">adhip.kashyap@gmail.com <span aria-hidden="true">↗</span></a>
  </section>
</div>
```

::: {.print-only}

<div class="resume-contact">
[adhip.kashyap@gmail.com](mailto:adhip.kashyap@gmail.com) · Thousand Oaks, CA · [adhipk.dev](https://adhipk.dev) · [linkedin.com/in/adhip-kashyap](https://linkedin.com/in/adhip-kashyap) · [github.com/adhipk](https://github.com/adhipk)
</div>

AI systems engineer and solutions architect who builds production voice-AI systems, evaluation platforms, data pipelines, and developer tools. Strongest at turning ambiguous workflows into observable, reviewable software.

## Experience {#resume-experience}

### TechAhead — AI Software Engineer, Hoag Medical Group <span class="date">Oct 2025 – Present</span>

- Own the delivery platform for a healthcare voice-AI system, managing multi-agent workflows as version-controlled resources with drift detection, schema validation, dry runs, and approval-gated promotion across development, staging, and production.
- Design and harden conversational scheduling workflows and their regression harness; a focused eight-scenario suite passed 80/80 automated runs after routing, slot-selection, and tool-handoff fixes.
- Built a PHI-conscious DuckDB analysis pipeline that reconciles structured outputs with call and tool evidence across 6,600+ calls, surfacing reliability gaps in headline automation metrics.
- Extended a NestJS scheduling bridge with FHIR-based batch operations, combo appointments, retryable validation, and fuzzy location matching; built an AWS S3/Vapi call inspector for incident investigation.

### TechAhead — Client Solutions Architect <span class="date">Apr 2025 – Present</span>

- Translate discovery into pragmatic AI and backend architectures, prototypes, delivery plans, and technical proposals for client teams.

### Teaching Solved — Founding Engineer <span class="date">Aug 2024 – Mar 2025</span>

- Built the initial Next.js, PostgreSQL, and AWS platform for educators to create and share language-learning resources, including retrieval-assisted discovery for culturally relevant content.

### InduzBuy — Software Engineer Intern <span class="date">May 2023 – Aug 2023</span>

- Modernized a PHP commerce platform with Laravel and built a BERT-based classification workflow for previously manual data processing.

### ICICI Lombard GIC — Software Engineer <span class="date">Oct 2019 – Aug 2022</span>

- Decomposed insurance services for independent scaling and built a Neo4j decision engine for premium calculations.

## Selected Projects

**Cloudflare Devkit** — Built a Bun/TypeScript toolkit for scaffolding, validating, and deploying Cloudflare services, including Workers, Hono APIs, D1, R2, and reusable GitHub Actions. [github.com/adhipk/cloudflare-devkit](https://github.com/adhipk/cloudflare-devkit)

**Hyperspace** — Built an HTML-first workspace that brings coding-agent sessions, live progress, task state, and per-project artifacts into one browser hub.

## Skills

**AI:** Voice agents, multi-agent orchestration, LLM evaluations, RAG, observability · **Backend & data:** TypeScript, Bun/Node.js, Python, Java, NestJS, Hono, FHIR, PostgreSQL, SQLite, DuckDB · **Platforms:** Cloudflare Workers, AWS, Docker, GitHub Actions, Terraform, React, Next.js

## Education

**M.S. Computer Science**, Arizona State University <span class="date">2022 – 2024</span><br>
**B.Sc. Mechanical Engineering, Minor in Computer Science**, PES University <span class="date">2015 – 2019</span>

:::
