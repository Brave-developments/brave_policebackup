# Changelog

## [fix] - 2026-10-07

### Fixed
- police:triggerAlertSoundForAll now requires a police job before broadcasting the alert sound.
- police:backupRequest nil-guards a disconnected source before composing the officer name.
- config.lua is now registered in the manifest as a shared script.
