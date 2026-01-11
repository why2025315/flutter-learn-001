# Copilot / AI agent instructions for flutter_demo001

Purpose
- Provide concise, repo-specific guidance so an AI coding agent can be immediately productive.

Big picture
- This is a small Flutter app (single package) located at the repository root.
- UI entry: [lib/main.dart](lib/main.dart#L1) — the app wraps MaterialApp in a `ValueListenableBuilder` that reads `brightnessNotifier`.
- App state helpers: [lib/data/notifiers.dart](lib/data/notifiers.dart) (project uses `ValueNotifier`/`ValueListenable` patterns).
- Views/pages live under [lib/views/pages](lib/views/pages) (example: `welcome_page.dart`).

Build / run / debug
- Common commands:
  - Install deps: `flutter pub get`
  - Run locally: `flutter run` (use `-d <device>` to pick platform)
  - Build release: `flutter build apk|ios|windows|web`
- The `pubspec.yaml` (root) declares SDK `^3.9.2` and `flutter_lints` — keep lint rules intact.

Project-specific conventions
- Small single-package Flutter app: prefer editing under `lib/` and keeping platform folders (android/ios/windows) unchanged unless platform-specific work is required.
- Assets: images live in `assets/images/` and are registered in `pubspec.yaml` — update that list when adding assets.
- Use ValueListenable/ValueNotifier for simple app-wide reactive state (see `brightnessNotifier`).
- Keep `debugShowCheckedModeBanner: false` and theming via `ColorScheme.fromSeed` as the app relies on seed colors.

Patterns & files to inspect when changing behavior
- `lib/main.dart`: app start, theme wiring.
- `lib/data/notifiers.dart`: shared notifiers/state.
- `lib/views/widget_tree.dart` and `lib/views/pages/*`: component composition and navigation.
- `lib/widgets/*`: reusable widgets (e.g., `hero_widget.dart`, `navbar_widget.dart`).

Tests & lints
- Tests live in `test/` (simple widget tests). Run with `flutter test`.
- Keep `analysis_options.yaml` and `flutter_lints` rules; fix lint failures rather than suppressing unless necessary.

PR & commit guidance for agents
- Make small, focused commits with a short summary. Example: "feat: add dark-mode toggle via brightnessNotifier".
- When changing UI, include a screenshot + brief run instructions in the PR description.

When touching platform files
- Avoid modifying files in `android/`, `ios/`, `windows/`, `linux/`, or `macos/` unless the change specifically requires native work (add comment explaining why).

Safety & scope
- This repo is a learning/demo app — prefer minimal, well-tested changes. Don't remove lint or CI configs.

If something is unclear
- Inspect the referenced files above; ask the maintainer for intent before doing large refactors.

---
If you'd like, I can (1) extend this with examples of common change tasks (add feature, add widget, wire notifier), or (2) run `flutter pub get` and a test run locally.
