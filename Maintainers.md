# Maintaining a DSC resource

Maintainers are the group of trusted people with knowledges in the resouce domain.

## Maintainers

Maintainers have [write access](https://help.github.com/articles/permission-levels-for-an-organization-repository/) to the repository.
They can:

1. `push`.
2. Merge pull requests.
3. Assign tags, milestones and people to [issues](https://guides.github.com/features/issues/).

## Dos and don'ts

If you are maintainer, please follow these rules:

1. **DO** reply to the new issues and pull requests.
1. **DO** ask people to resend pull request, if it targets [a wrong branch](CONTRIBUTING.md#lifecycle-of-a-pull-reqeust).
**DON'T** merge pull requests to **master** branch.
1. **DO** encourage people to write pester tests for all new functionality.
1. **DO** wait for [CI system](CONTRIBUTING.md#appveyor) build for pull requests.
1. **DON'T** merge pull requests with failed CI build.
1. **DON'T** merge pull requests, without label `cla-signed` or `cla-not-required` by Microsoft CLA bot.

