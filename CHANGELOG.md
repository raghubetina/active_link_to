# Changelog

## 2.0.0 - 2026-03-01

### Breaking Changes

- Dropped support for Ruby versions below 3.4.
- Dropped support for Rails (`actionpack`) versions below 7.2.

### Changed

- Modernized dependency constraints for `actionpack` and `addressable`.
- Updated test matrix to Rails 7.2, 8.0, and 8.1.
- Migrated CI from Travis to GitHub Actions.
- Updated docs for modern Ruby and Rails usage.

### Fixed

- Updated test harness to use `Minitest::Test` for modern Minitest versions.
- Removed string literal mutation warnings in helper class-building logic.
