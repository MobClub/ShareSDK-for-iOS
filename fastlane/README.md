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

### ios check_operation_legal

```sh
[bundle exec] fastlane ios check_operation_legal
```

Configuration Required Parameters

Check Operational Legitimacy

### ios add_tag_to_project_branch

```sh
[bundle exec] fastlane ios add_tag_to_project_branch
```

Add tag to project workspace.

### ios update_podspec

```sh
[bundle exec] fastlane ios update_podspec
```

Update PodSpec

### ios add_and_push_to_repo

```sh
[bundle exec] fastlane ios add_and_push_to_repo
```

Add Tag And Push To Repo

### ios upload_zip_file_to_minio

```sh
[bundle exec] fastlane ios upload_zip_file_to_minio
```

Upload Zip File

### ios update_pods_trunk_server

```sh
[bundle exec] fastlane ios update_pods_trunk_server
```

Upadte Pods Trunk

### ios add_comments_to_jira

```sh
[bundle exec] fastlane ios add_comments_to_jira
```

Add Comments To Jira

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
