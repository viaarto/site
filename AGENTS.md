# Repository Guidelines

## Project Structure & Module Organization
This repository hosts a Hugo site for `viaarto.com.br`.
- `content/`: page and section content (`blog/`, `portfolio/`, `landing/`, `about/`, `contact/`, `catalogo/`).
- `themes/viaarto/`: theme templates, SCSS, and JavaScript (`layouts/`, `assets/scss/`, `assets/js/`).
- `data/`: YAML-driven homepage/site data (clients, team, services, testimonials).
- `static/`: source static assets (images, PDFs, favicon files).
- `docs/`: generated site output (configured by `publishDir = "docs"` in `config.toml`), committed for hosting.
- `archetypes/` and `layouts/`: root-level Hugo archetypes and custom layouts/shortcodes.

## Build, Test, and Development Commands
Use Hugo CLI locally.
- `hugo server -D`: start local development server with drafts.
- `hugo --cleanDestinationDir --forceSyncStatic --gc`: production build matching project deployment behavior.
- `hugo`: standard build to `docs/`.
- `build.bat` (Windows): runs Hugo build, then `git add .`, commit, and push in one flow.

## Coding Style & Naming Conventions
- Content files: kebab-case slugs, descriptive names (example: `content/portfolio/projetos-customizados.md`).
- Markdown/TOML/YAML: use consistent 2-space indentation where nesting exists.
- Theme styles: keep SCSS partials modular under `themes/viaarto/assets/scss/components/`.
- Frontend scripts: place theme JS under `themes/viaarto/assets/js/`; avoid inline script logic in templates when possible.
- Keep language and tone consistent with existing Portuguese site copy for user-facing text.

## Testing Guidelines
There is no automated test suite in this repository.
- Validate changes by running `hugo server -D` and checking affected routes.
- Run a full build with `hugo --cleanDestinationDir --forceSyncStatic --gc` before opening a PR.
- For UI/content changes, verify generated output under `docs/` and key pages (`/`, `/portfolio`, `/contact`, `/blog`).

## Commit & Pull Request Guidelines
Recent history mixes short Portuguese messages and automated updates (for example, `Auto update: YYYY-MM-DD-HH-MM`). Prefer clear, imperative commit messages.
- Suggested format: `feat(scope): short summary` / `fix(scope): short summary` / `content: short summary`.
- Keep commits focused by concern (content, theme, config, generated output).
- PRs should include: objective, impacted paths, local validation commands run, and screenshots for visual/template changes.
- Link related issue/ticket when applicable.
