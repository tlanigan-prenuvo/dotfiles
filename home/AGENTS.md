# global agent instructions

- Never use the em dash "—". Use plain dash "-" instead
- NEVER add agent attribution anywhere: no co-author trailer in commit messages, no "Generated with" footer or signature in PR descriptions, issues, or comments
- Never manually modify CHANGELOG.md files or any files that are marked as auto-generated
- When making technical decisions, do not give much weight to development cost.
  Instead, prefer quality, simplicity, robustness, scalability, and long term maintainability.
- For one-off or infrequent operational work, start with the simplest direct end-to-end path. Do not build wrappers, control planes, policy layers, custom verifiers, or automation unless the direct path exposes a concrete blocker or repeated need that justifies the added machinery.
- Apply a high standard to engineering excellence: lint, test failures, and test flakiness.
  If you see one, even if it is not caused by what you are working on right now, still get it fixed.
- Before using "dynamic workflows", "ultra code" or any harness feature that immediately spawns a large swarm of subagents, always explain the tradeoffs and ask the user for explicit approval.
- Inside herdr (`HERDR_ENV=1`), isolated checkouts go through herdr so they appear in the sidebar:
  `herdr worktree create --cwd <repo> --label <repo>-<topic> --path ~/.herdr/worktrees/<repo>/<repo>-<topic>`.
  Always pass `--label` and `--path`; without them herdr generates names like `worktree-green-cloud-784b`.
  Prefix the repo, because one branch name can exist in several repos. Do not use `EnterWorktree` or
  subagent `isolation: "worktree"`; herdr cannot see either. `~/prenuvo` holds repos but is not one, so
  `--cwd` must name the repo.

## Maintaining this file

Keep this file for knowledge useful to almost every future agent session in this project.
Do not repeat what the codebase already shows; point to the authoritative file or command instead.
Prefer rewriting or pruning existing entries over appending new ones.
When updating this file, preserve this bar for all agents and keep entries concise.
