# DSC Resource Kit Maintainers

Maintainers (a.k.a. coordinators) are trusted people with knowledge in a resouce module domain.

They have [write access](https://help.github.com/articles/permission-levels-for-an-organization-repository/) one or more DSC Resource Kit repositories which gives them the power to:

1. `push`.
2. Merge pull requests.
3. Assign labels, milestones and people to [issues](https://guides.github.com/features/issues/).

## Rules

If you are maintainer, please follow these rules:

1. **DO** reply to new issues and pull requests (while reviewing PRs, leave your comment even if everything looks good - simple "Looks good to me" or "LGTM" will suffice, so that we know someone has already taken a look at it).
1. **DO** make sure contributors are following the [contributor guidelines](https://github.com/PowerShell/DscResources/blob/master/CONTRIBUTING.md).
1. **DO** ask people to resend a pull request, if it targets [the wrong branch](CONTRIBUTING.md#lifecycle-of-a-pull-request).
1. **DO** encourage people to write Pester tests for all new/changed functionality.
1. **DO** wait for the [CI system](CONTRIBUTING.md#appveyor) build to pass for pull requests.
1. **DO** encourage contributors to refer to issues in PR title/description (e.g. ```Closes #11```). Edit title if necessary.
1. **DO** encourage contributors to create meaningful titles for all PRs. Edit title if necessary.
1. **DO** verify that all contributors are following the [style guidelines](https://github.com/PowerShell/DscResources/blob/master/StyleGuidelines.md).
1. **DO** ensure that each contributor has signed a valid Contributor License Agreement (CLA).
1. **DO** verify compliance with any third party code license terms (e.g., requiring attribution, etc.) if the contribution contains third party code.

1. **DON'T** merge pull requests to **master** branch.
1. **DON'T** merge pull requests with a failed CI build.
1. **DON'T** merge pull requests without the label `cla-signed` or `cla-not-required` from the Microsoft CLA bot.
1. **DON'T** merge pull requests that do not [include all meaningful changes](CONTRIBUTING.md#lifecycle-of-a-pull-request) under the **Unreleased** section in the repository's `README.md`.
1. **DON'T** merge your own pull requests before they are reviewed by someone else.
  - If there is **no one** else to review your PR, please wait **24** hours to merge your own PR in case anyone has a comment.

## Issue Workflow

1. Someone creates an issue.
1. A maintainer assigns one of the following labels: ```bug```, ```enhancement```, ```discussion```, ```question```
  1. In some cases, other special labels may be used (e.g. ```new module``` for issues requesting new DSC resource modules in the DscResources repository)
  1. If the issue is a duplicate of another issue, the maintainer adds the ```duplicate``` label, references the issue this one is a duplicate of, and closes the issue.
  1. If for some reason an issue should not be fixed, the maintainer adds the ```wontfix``` label, comments with an explaination of why the issue will not be fixed, and closes the issue.
1. A maintainer assigns the ```help wanted``` label to let contributors know this issue needs someone to work on it
1. Once a contributor volunteers to work on the issue, the maintainer removes the ```help wanted``` label, adds the ```in progress``` label, and assigns the issue to the volunteer.
1. Once issue is fixed, the maintainer removes the ```in progress``` label and closes the issue.

## Pull Request Workflow
1. A contributor opens a pull request.
2. The contributor ensures that their pull request passes the [CI system](CONTRIBUTING.md#appveyor) build.
  - If the build fails, a maintainer adds the ```waiting for author``` label to the pull request. The contributor can then continue to update the pull request until the build passes.
2. Once the build passes, the maintainer either reviews the pull request immediately or adds the ```needs review``` label.
3. A maintainer or trusted contributor reviews the pull request code.
  - If the contributor does not meet the reviewer's standards, the reviewer makes comments. A maintainer then removes the the ```needs review``` label and adds the ```waiting for author``` label. The contributor must address the comments and repeat from step 2.
  - If the contributor meets the reviewer's standards, the reviewer comments that they are satisfied. A maintainer then removes the the ```needs review``` label.
3. Once the code review is completed, a maintainer merges the pull request.

### Abandoned Pull Requests
A pull request with the label ```waiting for the author``` for **more than 2 weeks** without word from the author is considered abandoned.

In these cases:

1. Ping the author of PR to remind him of pending changes.
  - If the contributor responds, it's no longer an abandoned pull request, proceed as normal.
2. If the contributor does not respond **within a week**:
  - If the reviewer's comments are very minor, merge the change, fix the code immediately, and create a new PR with the fixes addressing the minor comments.
  - If the changes required to merge the pull request are significant but needed, create a new branch with the changes and open an issue to merge the code into the dev branch. Mention the original pull request ID in the description of the new issue and close the abandoned pull request. 
  - If the changes in an abandoned pull request are no longer needed (e.g. due to refactoring of the codebase or a design change), simply close the pull request.

