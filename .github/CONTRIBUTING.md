# Contributing

We are more than happy to accept external contributions to the project in the form of pull requests.

## 📦 Adding packages

Please do submit your own, or other people's repositories to the lists. There are a few requirements, but they are simple:

* Packages must have at least one release. A release is defined as a git tag that conforms to the [semantic version](https://semver.org) spec. This can be a [beta or a pre-release](https://semver.org/#spec-item-9) semantic version, it does not necessarily need to be stable.
* Packages should compile without errors. Actually, this isn't a strict requirement but it's probably a good idea.
* The simple URL for the repository should be submitted, no need to add the .git extension.
* Packages must be publicly available, no private repository.

**Note:** There's no gatekeeping or quality threshold to be included in this list. But its better to follow continous integration workflow defined by [check-workflow](https://github.com/4d-for-ios/check-workflow/) repository to ensure top quality extension.

### How do you add a package?

It's simple. Just fork this repository, edit the .txt files according to the type of repository, and submit a pull request. If you plan to submit a set of packages, there is no need to submit each package in a separate pull request. Feel free to bundle multiple updates at once as long as all packages match the criteria above.