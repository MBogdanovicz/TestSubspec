fastlane documentation
----

# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```sh
xcode-select --install
```

For _fastlane_ installation instructions, see [Installing _fastlane_](https://docs.fastlane.tools/#installing-fastlane)

# Available Actions

## iOS

### ios compile

```sh
[bundle exec] fastlane ios compile
```

Compile the project

### ios verify

```sh
[bundle exec] fastlane ios verify
```

Testing the project

### ios install

```sh
[bundle exec] fastlane ios install
```

Testing the project at night

### ios deploy_prod

```sh
[bundle exec] fastlane ios deploy_prod
```

Deploy Release project

### ios deploy_qa

```sh
[bundle exec] fastlane ios deploy_qa
```

Deploy Test project QA

### ios deploy_dev

```sh
[bundle exec] fastlane ios deploy_dev
```

Deploy Test project DEV

### ios versionChange

```sh
[bundle exec] fastlane ios versionChange
```

Change Version Project

### ios changelog

```sh
[bundle exec] fastlane ios changelog
```

Get Change Log

### ios uploadToNexus

```sh
[bundle exec] fastlane ios uploadToNexus
```

Upload zip to Nexus

### ios pushPodspec

```sh
[bundle exec] fastlane ios pushPodspec
```

Push podspec

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
