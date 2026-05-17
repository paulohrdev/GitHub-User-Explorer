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
