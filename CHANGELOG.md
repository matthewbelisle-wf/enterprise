### `v2.0.2`
- Fixed navigating to pull requests in the UI
- Added Organization Bot which, when set, will post all the features for Codecov
- Changed License to not "phone home"
- Added new config [Notify Policy](https://github.com/codecov/enterprise/wiki/Configuration#notify-policy)
- Upgraded the CI Status:
  - Check for more contexts
  - Add configuration for [custom domains](https://github.com/codecov/enterprise/wiki/Configuration#ci-providers)
  - Fallback based on average number of coverage builds.
- Enhanced Github Status for project coverage
  - ....
- New supported language: [Lua](https://github.com/codecov/example-lua)


### `v2.0.1`
- All notifications are delayed until all CI builds are complete
    - Will check CI status every minute for 20 minutes.
    - Added new config [Delay Policy](https://github.com/codecov/enterprise/wiki/Configuration#delay-policy)
- Added new required configuration value [`codecov_url`](https://github.com/codecov/enterprise/wiki/Configuration#codecov-url)
- Enable system metris sent to stdout
- Added `ETag` to report pages to send `304 Not modified` more accuratly
