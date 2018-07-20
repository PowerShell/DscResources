# Automation in DSC Resource Kit

Some areas of the DSC Resource Kit have been automated, and future automation will
cover other areas.

## Table of Contents

- [Labels](#labels)
- [Events](#events)
- [GitHub Apps](#github-apps)
  - [Stale](#stale)

## Labels

Labels are used in the issue and pull request workflow to show the current state.
When a issue or pull request add or remove a label an action could occur,
for example adding an automated comment.

These are the labels currently used by the resource modules in the DSC Resource
Kit. Some of these labels are meant to be used with future automation.

>The script [DscResourceKit-Labels](https://gist.github.com/johlju/f83f99787029a6b5d65cfd6844cf9449) that is provided
>by the community can be used to update the labels in your own repository.

Label | Description | Color Hex | Area of usage (PR, Issue) | Comment
-- | -- | -- | -- | --
abandoned | The pull request has been abandoned. | #ffffff White | PR | Used to indicate that the original author of a PR no longer appears to be working on the PR, and the work could be continued by another contributor (as per [Abandoned Pull Requests](https://github.com/PowerShell/DscResources/blob/a923a5f1cda20bd69046095da22c3ba062644922/Maintainers.md#abandoned-pull-requests) and [How to continue working on a pull request when an author (contributor) is unable to complete it](https://github.com/PowerShell/DscResources/blob/master/GettingStartedWithGitHub.md#how-to-continue-working-on-a-pull-request-when-an-author-contributor-is-unable-to-complete-it)). Maintainer needs to comment why the PR was labeled as abandoned. If the original author continues to work on the issue this label should be removed.
blocking release | The issue or pull request is blocking the next release. Higher priority than label 'High priority'. | #800000 Dark red | Issue, PR | Only needed in modules with a release. The issue or pull request is blocking the next release. This has higher priority to resolve than issues or pull request with the label 'High priority'.
breaking change | When used on an issue, the issue has been determined to be a breaking change. | #ff9900 Orange | Issue, PR | Only needed in modules with a release. When used on a pull request, when the pull request is merged it will result in the major version number to change on the next release.
bug | The issue is a bug. | #ee0701 Red | Issue |  
by design | The issue is describing an expect behavior.  | #ffffff White | Issue | Indicates reason for closure. Maintainer needs to comment why the issue/PR was closed.
closed by author | The issue or pull request was closed by the author. | #ffffff White | Issue, PR | Indicates reason for closure.
discussion | The issue is a discussion. | #993399 Purple | Issue |  
documentation | The issue is related to documentation only. | #c5def5 Lighter blue | Issue |
duplicate | The issue or PR is the duplicate of another. | #ffffff White | Issue, PR | Indicates reason for closure. Maintainer needs to comment why the issue/PR was closed.
good first issue | The issue should be easier to fix and can be taken up by a beginner to learn to contribute on GitHub | #5319e7 Purple | Issue | The issue should be easier to fix and can be taken up by a beginner who wants to learn the process of contribute on GitHub. GitHub Help point out to use this and the ‘Help wanted’ tag, see [Helping new contributors find your project with labels](https://help.github.com/articles/helping-new-contributors-find-your-project-with-labels). ***Note:** The label description is missing punctuation because of length restriction in GitHub.*
enhancement | The issue is an enhancement request. | #84b6eb Light blue | Issue |  
external | The issue cannot be resolved within the DSC Resource Kit. | #ffffff White | Issue | Indicates reason for closure. Maintainer needs to comment why the issue/PR was closed.
help wanted | The issue is up for grabs for anyone in the community. | #128A0C Green | Issue |  
high priority | The issue or PR should be resolved first. It is of less priority than the label 'Blocking Release'. | #ffcc99 Light orange | Issue, PR | The issue or pull request is of high importance and should be resolved or merged first, but it is of less priority than anything with the label 'Blocking Release'.
in progress | The issue is being actively worked on by someone. | #99ffcc Turquoise | Issue |  
needs investigation | The issue needs to be investigated by the maintainers or/and the community. | #ffff99 Yellow | Issue |  The issue needs to be investigated by the maintainers or/and the community to determine the cause of a problem, the fix for a problem, the benefit of a request, or the answer to a question.
needs more information | The issue needs more information from the author or the community. | #ffff99 Yellow | Issue |
needs review | The pull request needs a code review. | #99ff33 Lime green | PR |  
new module submission | A request that the community evaluate a resource module for submission into the DSC Resource Kit. | #207de5 Dark blue | Issue | A resource module owner has requested that the community evaluate a resource module for submission into the DSC Resource Kit. ***Note:** This label is only needed in the repository DscResources.*
not fixed | The issue was closed without being fixed. | #ffffff White | Issue | Indicates reason for closure. Maintainer needs to comment why the issue/PR was closed.
on hold | The issue or pull request has been put on hold by a maintainer. | #1e1e7b Dark blue | Issue, PR | Maintainer needs to comment why the issue/PR is on hold. The issue/PR cannot be closed or merged until the label is removed with the consent of whoever assigned the label.
question | The issue is a question. | #cc317c Dark pink | Issue |  
ready for merge | The pull request was approved  by the community and is ready to be merged by a maintainer. | #215e82 Dark cyan | PR |
resource proposal | The issue is proposing a new resource in the resource module. | #fbca04 Dark yellow | Issue | Only needed in resource modules repositories.
stale | The issue was marked as stale because there hasn't been activity from the community. | #cccccc Grey | Issues |
tests | The issue or pull request is about tests only. | #c5def5 Lighter blue | Issue, PR |  
updated by author | The pull request was last updated by the author. | #e3f1dA Lighter Green | PR |
waiting for author response | The pull request is waiting for the author to respond to comments in the pull request. | #ffff99 Yellow | PR | Should *never* be use together with 'Waiting for code fix'.
waiting for CLA pass | The contributor has not yet signed the CLA so that pull request check is not successful. | #ee0701 Red | PR |  
waiting for code fix | A review left open comments, and the pull request is waiting for changes to be pushed by the author. | #ffff99 Yellow | PR | A review of the pull request left open comments, and the pull request is waiting for new commits to be push to the pull request by the author. This label takes precedence over 'Waiting for author response'. This label should *never* be use together with 'Waiting for author response'.

## Events

## GitHub Apps

### Stale
