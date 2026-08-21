# Cycle Radar v0.1

A static, GitHub-Pages-ready dashboard for mapping semi-predictable investment cycles and their estimated **Optimal Buy (OB)** and **Optimal Sell (OS)** windows.

## Files

- `index.html` — interactive application.
- `cycles.json` — current cycle model and quarterly timeline.
- `methodology.md` — rationale, anatomy of a cycle and how stock prices typically lead fundamentals.
- `llm-protocol.md` — protocol and JSON schema for LLM-assisted recalibration.
- `changelog.md` — version history.

## Run on GitHub Pages

1. Create a new GitHub repository.
2. Upload all files in this folder to the repository root.
3. Commit and push.
4. Open **Settings → Pages**.
5. Under **Build and deployment**, choose **Deploy from a branch**.
6. Select your default branch and `/ (root)`.
7. Save.

GitHub will publish the site at a URL similar to:

`https://YOUR-USERNAME.github.io/cycle-radar/`

## Local testing

Because the app loads `cycles.json` and markdown files with `fetch()`, some browsers block those requests when opening `index.html` directly from `file://`.

The simplest local test is to run a tiny web server in this directory:

```bash
python3 -m http.server 8000
```

Then open:

`http://localhost:8000`

## Updating the radar

The easiest manual workflow is:

1. Open the app.
2. Go to **LLM Protocol**.
3. Select a cycle or full recalibration.
4. Click **Generate prompt**.
5. Paste the prompt into your preferred LLM.
6. Save the returned model data into a revised `cycles.json`.
7. Review the changes.
8. Commit and push.

The app also supports importing a JSON file locally for preview and exporting the currently loaded data.

## Design rules

- Cycle stage and action are independent dimensions.
- Shock is an optional overlay, not a cycle stage.
- `OB` should be narrow: usually late trough to very early recovery.
- `OS` should be narrow: usually late expansion to early peak.
- Stocks often bottom before earnings bottom and peak before earnings peak.
- Do not treat structural decline as a cyclical trough without identifying the reversal mechanism.
- Recalibrate the whole map at least once per quarter.

## Disclaimer

This is a research framework, not investment advice. Forward stages, prices and timing are uncertain, especially beyond the next 4–6 quarters.
