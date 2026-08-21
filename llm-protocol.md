# LLM Re-evaluation Protocol

## Purpose

Use an LLM as a **research and proposal engine**, not as an authority that silently rewrites the radar.

The LLM researches the evidence and proposes changes. The user reviews and approves them. The tool then displays the accepted cycle record.

## Fixed methodology

Re-evaluate each cycle independently using current evidence.

Do not preserve the previous stage merely for continuity. Do not infer a trough simply because prices have fallen substantially.

For every cycle determine:

- current stage: `D`, `T`, `R`, `E`, `L`, or `P`;
- action qualifier: `W`, `B`, `OB`, `H`, `T`, `OS`, or `S`;
- approximate quarter of the next transition;
- any positive or negative **external shock overlay**;
- cycle predictability, 1–5;
- confidence in current-stage classification;
- estimated optimal-buy window;
- estimated optimal-sell window;
- typical equity trough-to-peak potential;
- survivability and structural risk;
- evidence that confirms or contradicts the thesis;
- explicit invalidation conditions.

Distinguish **industry economics** from **stock-price timing**. Equity prices normally lead fundamentals.

Do not label normal cyclical mechanics such as destocking, overcapacity or capex cuts as shocks. A shock should be external to the normal cycle.

Do not classify a decline as a cyclical trough without identifying the mechanism that should reverse it.

## Evidence checklist

Use current sources wherever applicable and classify evidence as **leading**, **coincident**, or **lagging**.

### Demand
- orders;
- volumes;
- PMIs / end-market indicators;
- consumer or industrial demand.

### Inventory
- channel inventory;
- destocking / restocking;
- days of inventory.

### Supply
- utilization;
- capacity additions / closures;
- capex;
- orderbooks;
- scrapping / project cancellations.

### Pricing
- spot prices;
- contract prices;
- spreads;
- ASPs;
- incentives / discounts.

### Profitability
- margins;
- EBITDA / EBIT;
- free cash flow;
- earnings revisions.

### Management commentary
- improving or worsening language;
- order visibility;
- capacity plans;
- guidance changes.

### Valuation and market price
- whether equities have already moved ahead of the supposed turn;
- forward multiples versus normalized earnings;
- price performance relative to earnings revisions.

### Structural risk
- technology;
- regulation;
- substitution;
- China / new competitors;
- permanent demand shifts;
- balance-sheet survival.

## Full recalibration mode

Run at least quarterly.

1. Research every cycle from scratch using current evidence.
2. Reclassify current stage and action.
3. Re-estimate all future quarterly transitions.
4. Narrow OB and OS windows; do not mark whole phases as optimal.
5. Reduce confidence as the forecast horizon increases.
6. Return one complete JSON object using the schema below.
7. Summarize material changes versus the previous radar.

## Single-cycle check mode

Use after a major earnings report, policy event, supply shock or important data release.

1. Re-evaluate only the named cycle.
2. Reuse the existing cycle record as context, not as an assumption.
3. Return a replacement record for that cycle plus a short change summary.
4. Do not modify unrelated cycles unless there is a clearly identified cross-cycle transmission mechanism.

## Required JSON schema

```json
{
  "cycle": "Chemicals",
  "as_of": "2026-08-21",
  "stage": "T",
  "stage_confidence": 0.76,
  "action": "B",
  "optimal_buy_window": {
    "start": "2026-Q4",
    "end": "2027-Q1",
    "confidence": 0.68
  },
  "optimal_sell_window": {
    "start": "2029-Q2",
    "end": "2029-Q4",
    "confidence": 0.39
  },
  "predictability": 4.0,
  "typical_trough_peak_return": {
    "low": 0.60,
    "high": 1.50
  },
  "shock": null,
  "survivability": "medium",
  "structural_risk": "medium",
  "leading_indicators": [],
  "confirming_evidence": [],
  "contradicting_evidence": [],
  "invalidation_conditions": [],
  "timeline": [
    {"quarter": "2026-Q3", "stage": "T", "action": "B", "confidence": 0.76}
  ],
  "summary": ""
}
```

## Prompt-generation template

When asking an LLM to re-evaluate one cycle, provide:

1. the current date;
2. the cycle name;
3. the existing cycle record;
4. this methodology;
5. the evidence checklist;
6. the required JSON schema;
7. an instruction to use current, attributable sources;
8. an instruction to identify what would invalidate the conclusion.

The LLM output should be treated as a proposal and reviewed before replacing the current radar data.
