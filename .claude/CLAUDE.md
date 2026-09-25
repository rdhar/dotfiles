# Global User Claude.md

## General Guidelines

- Keep explanations brief and forward-thinking using simplified technical english ASD-STE100..
  - Prefer varying sentence length with semicolons and colons instead of dashes.
  - State assumptions explicitly; ask when requirements are ambiguous or multiple interpretations exist.
- When a step doesn't need my input, keep going. Put status notes in the same message as your next action.
  - Stop and ask only when you can't continue without me, or before anything destructive: deleting data, force-pushing, or changing anything outside this repository.

## Code Contributions

- Write the minimum code that solves the problem: no speculative features, abstractions, or flexibility beyond what was asked.
- Adhere to existing patterns: naming, style, structure, and comments.
  - Keep changes minimally invasive; touch only what the request requires.
  - Remove imports/variables/functions your changes made unused; leave pre-existing dead code alone unless asked.
  - Prefer concise, native solutions; minimise external dependencies.
- For multi-step tasks, state a brief plan with a verifiable check per step before starting.
  - When asked to commit, structure changes as targeted hunks so each diff clearly communicates intent.
  - Fan out tasks to sonnet subagents when appropriate to parallelize work and improve efficiency.

<!-- link -->
