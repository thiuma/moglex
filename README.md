# Moreau Glass Expert — moglex.com

One-page website. Plain HTML, CSS and a little JavaScript. No build step.

## Files

- `index.html`: the page
- `styles.css`: all styles (design tokens at the top)
- `script.js`: mobile menu, click-to-play videos, active nav link
- `assets/img/`, `assets/pdf/`: images and downloadable papers
- `fetch-assets.sh`: re-downloads the images and PDFs into `assets/`
- `.nojekyll`: tells GitHub Pages to serve the files as-is

## Preview locally

Open `index.html` in a browser, or run a local server from this folder:

```bash
python3 -m http.server 8000
```

Then visit http://localhost:8000.

## Publish

The site is served by GitHub Pages: **Settings → Pages → Deploy from a branch**, branch `moglex-one-pager`, folder `/ (root)`.
