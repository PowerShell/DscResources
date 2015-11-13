# Maintaining a DSC resource

Maintainers are the group of trusted people with knowledges in the resouce domain.

## Maintainers

Maintainers have [write access](https://help.github.com/articles/permission-levels-for-an-organization-repository/) to the repository.
They can:

1. `push`.
2. Merge pull requests.
3. Assign labels, milestones and people to [issues](https://guides.github.com/features/issues/).

## Dos and don'ts

If you are maintainer, please follow these rules:

1. **DO** reply to the new issues and pull requests (while reviewing PRs, leave your comment even if everything looks good - simple "Looks good to me" or "LGTM" will suffice, so that we know someone has already taken a look at it).
1. **DO** make sure process described in [contributing guide](https://github.com/PowerShell/DscResources/blob/master/CONTRIBUTING.md) is being followed.
1. **DO** ask people to resend pull request, if it targets [a wrong branch](CONTRIBUTING.md#lifecycle-of-a-pull-request).
**DON'T** merge pull requests to **master** branch.
1. **DO** encourage people to write pester tests for all new functionality.
1. **DO** wait for [CI system](CONTRIBUTING.md#appveyor) build for pull requests.
1. **DO** encourage people to refer issue in PR title/description (e.g. ```Closes #11```). Edit title if necessary
1. **DO** encourage people to create meaningful titles of PR. Edit title if necessary.
1. **DO** verify [style guidelines](https://github.com/PowerShell/DscResources/blob/master/StyleGuidelines.md) are being followed.
1. **DON'T** merge pull requests with failed CI build.
1. **DON'T** merge pull requests, without label `cla-signed` or `cla-not-required` by Microsoft CLA bot.
1. **DON'T** merge pull requests, that doesn't [reflect changes](CONTRIBUTING.md#lifecycle-of-a-pull-request) in **Unreleased** version in `README.md`.
1. **DON'T** merge your own pull requests before they were reviewed by someone else.

## Labeling workflows

### Labeling of issues

1. Issue is created
1. Maintainer assigns one of the following labels: ```bug```, ```enhancement```, ```discussion```, ```question```
  1. In some cases, special labels may be used (e.g. ```new module``` for issue requesting new DSC resource module in DscResources repository)
  1. If issue is duplicate of another issue, ```duplicate``` label is added and issue is closed
  1. If for some reason issue should not be fixed, ```wontfix``` label is added and comment with explaination should be provided.
1. Maintainer assigns ```up for grabs``` label to let contributors know this issue needs someone who will take care of it
1. Once one of the maintainers or contributors volunteers to work on given issue, ```up for grabs``` label is replaced with ```in progress```
1. Once issue is fixed, we replace label ```in progress``` with ```ready```

### Labeling of pull requests
1. Pull request is opened
2. Maintainer takes a look at the Pull Request and either reviews it immediately or assigns ```need review``` label
3. After code review is completed, PR is either merged (if everything looks good) or feedback is provided and ```need review``` label is replaced with ```waiting for the author```
4. Once the author of PR addresses all comments, we come back to step 3. 
