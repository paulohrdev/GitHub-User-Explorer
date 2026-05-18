# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
flutter pub get              # install dependencies
flutter run                  # run on connected device/emulator
flutter analyze              # static analysis (flutter_lints)
flutter test                 # run all tests
flutter test test/path_to_test.dart  # run a single test file
dart run build_runner build --delete-conflicting-outputs  # codegen (Hive adapters)
```

## Architecture

MVVM following the official Flutter team guide. Four layers:

- **UI** (`lib/ui/`) — screens and widgets, consume ViewModels via `Watch`
- **ViewModel** (`lib/ui/<feature>/view_models/`) — holds state as `signals_flutter` signals, exposes methods, no Flutter imports
- **Repository** (`lib/data/repositories/`) — single source of truth, coordinates API service and Hive storage
- **Service** (`lib/data/services/`) — raw HTTP calls (`GithubApiService`) and Hive bootstrap (`HiveService`)

Domain models live in `lib/domain/models/`. `HistoryEntry` is a `@HiveType` and requires codegen via `build_runner`.

State management uses **signals_flutter** (`signal()`, `computed()`, `Watch` widget). No Bloc, no Provider.

## Routing

`go_router` configured in `lib/routing/router.dart`. Routes defined as constants in `lib/routing/routes.dart`. The app starts at `/` (SplashScreen), which auto-navigates to `/search` after 3 seconds. A `ShellRoute` wraps `/search` and `/history` inside `TabsScreen`.

## Environment

The `.env` file (not committed) is bundled as a Flutter asset and must define `API_URL`. See `.env.example`. The GitHub public API base URL goes there.

## Key dependencies

| Package | Purpose |
|---|---|
| `signals_flutter` | Reactive state in ViewModels |
| `go_router` | Navigation |
| `hive_ce` | Local history persistence |
| `flutter_svg` | SVG assets (logo) |
| `get_it` | Service locator / DI |
| `intl` | Date formatting |

<!-- gitnexus:start -->
# GitNexus — Code Intelligence

This project is indexed by GitNexus as **github_user_explorer** (846 symbols, 1390 relationships, 15 execution flows). Use the GitNexus MCP tools to understand code, assess impact, and navigate safely.

> If any GitNexus tool warns the index is stale, run `npx gitnexus analyze` in terminal first.

## Always Do

- **MUST run impact analysis before editing any symbol.** Before modifying a function, class, or method, run `gitnexus_impact({target: "symbolName", direction: "upstream"})` and report the blast radius (direct callers, affected processes, risk level) to the user.
- **MUST run `gitnexus_detect_changes()` before committing** to verify your changes only affect expected symbols and execution flows.
- **MUST warn the user** if impact analysis returns HIGH or CRITICAL risk before proceeding with edits.
- When exploring unfamiliar code, use `gitnexus_query({query: "concept"})` to find execution flows instead of grepping. It returns process-grouped results ranked by relevance.
- When you need full context on a specific symbol — callers, callees, which execution flows it participates in — use `gitnexus_context({name: "symbolName"})`.

## Never Do

- NEVER edit a function, class, or method without first running `gitnexus_impact` on it.
- NEVER ignore HIGH or CRITICAL risk warnings from impact analysis.
- NEVER rename symbols with find-and-replace — use `gitnexus_rename` which understands the call graph.
- NEVER commit changes without running `gitnexus_detect_changes()` to check affected scope.

## Resources

| Resource | Use for |
|----------|---------|
| `gitnexus://repo/github_user_explorer/context` | Codebase overview, check index freshness |
| `gitnexus://repo/github_user_explorer/clusters` | All functional areas |
| `gitnexus://repo/github_user_explorer/processes` | All execution flows |
| `gitnexus://repo/github_user_explorer/process/{name}` | Step-by-step execution trace |

## CLI

| Task | Read this skill file |
|------|---------------------|
| Understand architecture / "How does X work?" | `.claude/skills/gitnexus/gitnexus-exploring/SKILL.md` |
| Blast radius / "What breaks if I change X?" | `.claude/skills/gitnexus/gitnexus-impact-analysis/SKILL.md` |
| Trace bugs / "Why is X failing?" | `.claude/skills/gitnexus/gitnexus-debugging/SKILL.md` |
| Rename / extract / split / refactor | `.claude/skills/gitnexus/gitnexus-refactoring/SKILL.md` |
| Tools, resources, schema reference | `.claude/skills/gitnexus/gitnexus-guide/SKILL.md` |
| Index, status, clean, wiki CLI commands | `.claude/skills/gitnexus/gitnexus-cli/SKILL.md` |

<!-- gitnexus:end -->
