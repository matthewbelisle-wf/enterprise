### `v2.0.1`
- All notifications are delayed until all CI builds are complete
    - Will check CI status every minute for 20 minutes.
    - [Customize setting here](https://github.com/codecov/enterprise/wiki/Notification-Delay-Policy)
- Added new config `codecov_url` used when posting features
- Enable system metris sent to stdout
- Added `ETag` to report pages to send `304 Not modified` more accuratly
