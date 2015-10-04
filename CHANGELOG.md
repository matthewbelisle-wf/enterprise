### `v2.1.4`
- Fix targeting Codecov Bash uploader, locally
- New v3 uploading endpoint. Direct to s3 to help improve product performance.
- Post codecov/patch status from webhooks

### `v2.1.3`
- Add option to specify custom url's for Hipchat integration
- Fix viewing badges/graphs when `guest_mode=off`
- Bitbucket changed the pull-request endpoint from "pull-request" to "pull-requests"
- Fixed Go reports when extra newlines presented
- Fixed issue with SIGTERM due to package name `enterprise`. Now `codecov`.

### `v2.1.3`
- Fix login issue

### `v2.1.1`
- Added Github Hooks to assist with data accuracy
- xcode-7 and Swift are now supported.
  - Please update your Bash uploader https://github.com/codecov/codecov-bash
- Issues with Guest Mode fixed

### `v2.1.0`
- Fixed login when in Guest Mode
- Ignoring old uploaded reports based on provided timestamps
- Fixed Node ES6 lcov/json reports
- Better targeting for comparisson commits when checking if coverage increased or decreases
- Now setting pending status for Github Commit Statuses
- Added Gitter notification support
- Improved Github Statuses
    - Added new Smart mode to compare against head of PR base or previous successful build on same branch else master
    - Removed "commit" status because Patch status was much more reliable
- Added CI status to UI (Github only)
- Added build queue to UI
- Improved concurrecny of build queue by processing only report report per commit at a time
- Added thresholds to notifications
- Badges have precision arguments. See https://github.com/codecov/support/issues/77
- Moved API endpoint to `/api/` for simplicity
  - No longer requires `Accept` argument
- Impoved uploaders to respect git/hg listed files
- Added more information to Slack/Hipchat notifications
- Show author and CI status in commits page

### `v2.0.3`
- Fixed notifications reference point for previous commit comparrison
- Fixed removing pull requests from active branches
- Fixed merging of Cobertura reports and added new method for conditions

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
- New supported language: [Lua](https://github.com/codecov/example-lua)


### `v2.0.1`
- All notifications are delayed until all CI builds are complete
    - Will check CI status every minute for 20 minutes.
    - Added new config [Delay Policy](https://github.com/codecov/enterprise/wiki/Configuration#delay-policy)
- Added new required configuration value [`codecov_url`](https://github.com/codecov/enterprise/wiki/Configuration#codecov-url)
- Enable system metris sent to stdout
- Added `ETag` to report pages to send `304 Not modified` more accuratly
