# Automation in DSC Resource Kit

Some areas and workflows of the DSC Resource Kit are automated, and future
automation will cover other areas. This document has both information around
present automations, and potential future automations.

> Important note: the Waffle Board is being deprecated in favor of using a
> [GitHub Project board](https://github.com/orgs/PowerShell/projects/1).
> The documentation in this document is yet to be updated to reflect this
> new board.

## Table of Contents

- [Labels](#labels)
- [Events](#events)
  - [Issues](#issues)
  - [Pull requests](#pull-requests)
- [GitHub Apps](#github-apps)
  - [Stale](#stale)
    - [Stale issues](#stale-issues)
    - [Stale pull requests (PR)](#stale-pull-requests-pr)
    - [On schedule flowchart](#on-schedule-flowchart)
    - [On activity flowchart](#on-activity-flowchart)
    - [Configuration](#configuration)
- [GitHub Integration](#github-integration)
  - [Waffle](#waffle)
    - [On issue close and PR close/merge flowchart](#on-issue-close-and-pr-closemerge-flowchart)
- [Appendix](#appendix)
  - [Flowchart code for Stale scheduler](#flowchart-code-for-stale-scheduler)
  - [Flowchart code for Stale activity](#flowchart-code-for-stale-activity)
  - [Flowchart code for Waffle on issue close or PR close/merge](#flowchart-code-for-waffle-on-issue-close-or-pr-closemerge)

## Labels

Labels are being used in the issue and pull request workflows to show the current
state.
When an issue or pull request add or remove a label an event (action) could occur,
where the event could for example add an automated comment or change assignee.
See [Events](#events) for more information around different events.

These are the labels currently used by the resource modules in the DSC Resource
Kit. Some of these labels are meant to be used with future automation.

>The script
>[DscResourceKit-Labels](https://gist.github.com/johlju/f83f99787029a6b5d65cfd6844cf9449)
>that is provided by the community can be used to update the labels in your own
>repository.

Label | Description | Color Hex | Area of usage (PR, Issue) | Comment
-- | -- | -- | -- | --
abandoned | The pull request has been abandoned. | #ffffff White | PR | Used to indicate that the original author of a PR no longer appears to be working on the PR, and the work could be continued by another contributor (as per [Abandoned Pull Requests](https://github.com/PowerShell/DscResources/blob/a923a5f1cda20bd69046095da22c3ba062644922/Maintainers.md#abandoned-pull-requests) and [How to continue working on a pull request when an author (contributor) is unable to complete it](https://github.com/PowerShell/DscResources/blob/master/GettingStartedWithGitHub.md#how-to-continue-working-on-a-pull-request-when-an-author-contributor-is-unable-to-complete-it)). Maintainer needs to comment why the PR is labelled as abandoned. If the original author continues to work on the issue this label should be removed.
blocking release | The issue or pull request is blocking the next release. Higher priority than label 'High priority'. | #800000 Dark red | Issue, PR | Only needed in modules with a release. The issue or pull request is blocking the next release. This has higher priority to resolve than issues or pull request with the label 'High priority'.
breaking change | When used on an issue, the issue has been found to be a breaking change. | #ff9900 Orange | Issue, PR | Only needed in modules with a release. When used on a pull request, when the pull request is merged it will result in the major version number to change on the next release.
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
needs investigation | The issue needs to be investigated by the maintainers or/and the community. | #ffff99 Yellow | Issue | The issue needs to be investigated by the maintainers or/and the community to find the cause of a problem, the fix for a problem, the benefit of a request, or the answer to a question.
needs more information | The issue needs more information from the author or the community. | #ffff99 Yellow | Issue |
needs review | The pull request needs a code review. | #99ff33 Lime green | PR |  
new module submission | A request that the community evaluate a resource module for submission into the DSC Resource Kit. | #207de5 Dark blue | Issue | A resource module owner has asked that the community evaluate a resource module for submission into the DSC Resource Kit. ***Note:** This label is only needed in the repository DscResources.*
not fixed | The issue was closed without being fixed. | #ffffff White | Issue | Indicates reason for closure. Maintainer needs to comment why the issue/PR was closed.
on hold | The issue or pull request has been put on hold by a maintainer. | #1e1e7b Dark blue | Issue, PR | Maintainer needs to comment why the issue/PR is on hold. The issue/PR cannot be closed or merged until the label is removed with the consent of whoever assigned the label.
question | The issue is a question. | #cc317c Dark pink | Issue |  
ready for merge | The pull request was approved by the community and is ready to be merged by a maintainer. | #215e82 Dark cyan | PR |
resource proposal | The issue is proposing a new resource in the resource module. | #fbca04 Dark yellow | Issue | Only needed in resource modules repositories.
stale | The issue was marked as stale because there has not been activity from the community. | #cccccc Grey | Issues |
tests | The issue or pull request is about tests only. | #c5def5 Lighter blue | Issue, PR |  
updated by author | The author last updated the pull request. | #e3f1dA Lighter Green | PR |
waiting for author response | The pull request is waiting for the author to respond to comments in the pull request. | #ffff99 Yellow | PR | Should *never* be use together with 'Waiting for code fix'.
waiting for CLA pass | The contributor has not yet signed the CLA so that pull request check is not successful. | #ee0701 Red | PR |  
waiting for code fix | A review left open comments, and the pull request is waiting for changes to be pushed by the author. | #ffff99 Yellow | PR | A review of the pull request left open comments, and the pull request is waiting for new commits to be push to the pull request by the author. This label takes precedence over 'Waiting for author response'. This label should *never* be use together with 'Waiting for author response'.
resolved in dev | A fix has been merged into the dev-branch but issue is still open and awaits next release. | #215e82 Dark cyan | Issue | *In the future if we have an automatic release pipeline then each maintainer could push a new version instead of using this label.*

## Events

These are the events that are part of the current workflow for
issues and pull requests. The events are using labels to tell when there is a need
for an action in the workflow.
These events should preferably be automated as far as we can. For now, the events
need to be done manually.
Automating these events are meant to reduce the repetitive work when maintaining
the resources. Not all of these might be a reality.

### Issues

Events found around the issue workflows.
This list should be updated when more repetitive work is found.

Done | Event | Add label | Remove label | Assigned | Comment
-- | -- | -- | -- | -- | --
— | Contributor creates issue | -- | -- | Manually assignment or assigned automatically to all maintainers individually. | *GitHub support confirmed that it is not possible to assign an issue or PR to a team. Neither is it possible for a team to consist of both collaborators and organizational users.*
— | Contributor creates issue for a new resource module submission | **Manual** New module submission | | Entire community, so no assignment on these. | Automated comment linking to the documentation on how, and the requirements, to make a new module submission linking your own resource module to DSC Resource Kit. The issue should remain open for community feedback.
— | Contributor creates issue for 'resource module proposal' | -- | -- | -- | These issues can be closed with a, preferably automated, comment linking to documentation on how to publish your own resource module and how to link your own module to DSC Resource Kit.
— | Maintainer comments on issue | **Manual** Question, Bug, Enhancement, Documentation, Tests, Resource proposal, Needs investigation, Needs more information as the maintainer sees fit. 'Good first issue' should be set on those issues that can be taken up by a beginner who wants to learn the process of contribute on GitHub. 'High priority' should only be used in rare circumstances and is up to the maintainer. | **Manual** Needs investigation, Needs more information as the maintainer sees fit | **Manual** Re-assigned by maintainer if needed |
— | Issue is assigned a 'work' label (Bug, Enhancement, Documentation, Tests) | Help wanted | -- | Entire community, so no assignment on these. | An automated comment telling that this issue is up for grabs by anyone in the community.
— | Contributor comments that issue is being worked on | **Manual** In progress | -- | *Manually* Assign to contributor. *Currently not possible to assign to other than issue creator and organizational user.* |
— | Issue is mentioned in open PR | **Manual** In progress | -- | *Manually* Assign to creator of PR. *Currently not possible to assign to other than issue creator and organizational user.* |
— | Issue creator writes comment | -- | -- | -- |  
— | Contributor, other than issue creator writes comment | -- | -- | -- |  
— | Issue creator closes issue | Closed by author | Needs investigation, Needs more information | -- |  
— | Maintainer closes issue | **Manual** Abandoned, By design, Duplicate, External, Not fixed. | Needs investigation, Needs more information | -- | Maintainer also needs to comment why they are closing the PR.
✔️ | Issue is closed by PR | -- | Needs investigation, Needs more information, Help Wanted, In progress | -- | Any tag connected to a Waffle board column will be removed on issue close. This is part of the Waffle integration.
✔️ | Issue has no activity for 30 days | -- | -- | -- | Only when issue is _not assigned_ any of these work-labels 'bug', 'enhancement', 'tests', 'documentation', 'on hold', 'new module submission', 'module proposal', then push automatic comment requesting a response or the issue will be closed. The GitHub App Stale are doing this.
️️️✔️ | Issue has no activity for 40 days | -- | -- | -- | Only when issue is _not assigned_ any of these work-labels 'bug', 'enhancement', 'tests', 'documentation', 'on hold', 'new module submission', 'module proposal', then issue will be automatically closed. The GitHub App Stale are doing this.

### Pull requests

Events found around the pull request workflows.
This list should be updated when more repetitive work is found.

Done | Event | Add label | Remove label | Assigned | Comment
-- | -- | -- | -- | -- | --
— | PR creation | Needs review | -- | Manually assignment or assigned automatically to all maintainers individually. *Doesn't seem possible to assign an issue or PR collectively to a team. Neither does it look like a team can consist of both collaborators and organizational users.* | Add an automated comment to the PR with a link to our documentation on how the review process works and what will happen next.
— | CLA bot test fails on PR | Waiting for CLA pass | Needs review, Waiting for author response, Waiting for code fix | -- |  
— | CLA bot check passes ***and*** Tests check passes on PR | Needs review | Waiting for CLA pass, Waiting for code fix, Waiting for author response | -- |
— | Tests fail on PR | Waiting for code fix | Needs review, Waiting for author response | -- |  
— | Contributor other than PR creator makes a comment through Reviewable | Waiting for code fix | Needs review, Updated by author | -- | Automatic comment (when author is first-time-contributor) how contributor responds on review comments, for the reviewer to acknowledge comments.
— | Contributor other than PR creator makes a comment in the PR | Waiting for author response | Needs review | **Manual** Re-assigned by maintainer if needed | Should not add label if label 'Waiting for code fix' is already assigned.
— | PR creator adds new code to PR | Updated by author, Needs review | Waiting for author response, Waiting for code fix | -- |  
— | Contributor other than PR creator approves PR (via GitHub review or LGTM comment) | Ready for merge | Updated by author, Waiting for author response, Needs review | -- | *Reviewable now support GitHub review approvals, but not for self-reviews (restriction by GitHub) where LGTM comment is the only option.*
— | PR creator comments on PR | Updated by author, Needs review | Waiting for author response | -- |  
— | PR creator closes PR (no merge) | Closed by author | Anything else | -- |
— | Maintainer closes PR (no merge) | **Manual** Label showing why the PR was closed OR no label and just a comment if PR is getting re-opened immediately | Anything else | -- |
— | Maintainer merges PR | -- | All labels | -- |  
️️️️✔️ | PR creator is unresponsive for 14 days (and CLA passed) | abandoned | -- | -- | At this point another contributor may continue the work.
— | PR creator is unresponsive for 14 days (and CLA has not passed) | -- | -- | -- | Automatically close. *If the CLA was not signed, we should make sure that label 'waiting for CLA pass' is kept when closing - 'waiting for CLA pass' cannot be a Waffle board column in that case.*
— | When PR has merge conflict | Waiting for code fix | Needs review, Waiting for author response | -- | Automatically write a comment saying that a merge conflict has occurred and a rebase is need, plus a link to instructions on how to make a rebase.

## GitHub Apps

### Stale

Stale has been added to all repositories in DSC Resource Kit. Stale will not be
enabled (activated) until each repo opt-in by adding a configuration to the
file `.github/stale.yml` in the default branch (normally 'dev').

#### Stale issues

When there has not been activity on an issue for 30 days, the label 'stale' is
added, and a comment will be written to the issue, to remind the community to
resolve the issue if it is still valid.
Any other label, like a "waiting..."-label, 'needs more information', 'question'
or 'discussion' label are kept when the issue is labeled 'stale'.

If there are no further activity within 40 days Stale will close the issue.
When the issue is closed, the 'stale' label will be kept, but any label that are
a Waffle board column will be removed (see [Waffle automation](#waffle)).

If a comment is made, or a label is changed, that counts as activity and the
'Stale' label is removed.

An issue will not be commented on or be closed if the issue is assigned one of
the (work) labels under *exemptLabels* (the last two of the labels are only needed
for the DscResources repository). Neither will it close issues that are part of
a milestone or project. This is just a precaution, because those issues should
have a (work) label assigned too.

#### Stale pull requests (PR)

PR's that are not labeled with 'needs review', 'on hold' or 'waiting for CLA pass'
will be labeled as abandoned after 14 days of inactivity.

>**Note:** Pull requests that are labeled as 'waiting for CLA pass' should be
>closed after 14 days, but this app cannot handle that.

Any other label, like a "waiting..."-label will be kept when the issue is labeled
'abandoned'. If activity is made on the abandoned PR the 'abandoned' label is
removed.

>**Note:** There are currently a bug that prevents the abandoned labeled to be
>remove from the PR.
>This bug is reported here https://github.com/probot/stale/issues/134.

#### On schedule flowchart

![On schedule flowchart](/Images/StaleSchedulerFlowchart.svg)

#### on activity flowchart

![On activity flowchart](/Images/StaleActivityFlowchart.svg)

#### Configuration

The below configuration will handle issues and pull request differently. Each
repository can set change the configuration individually.

Example of file `.github/stale.yml` which is in use for all repositories as of
writing.

```yml
# Configuration for probot-stale - https://github.com/probot/stale

limitPerRun: 30

pulls:
  daysUntilStale: 14
  daysUntilClose: false
  exemptProjects: true
  exemptMilestones: true
  staleLabel: abandoned
  exemptLabels:
    - needs review
    - on hold
    - waiting for CLA pass

  markComment: >
    Labeling this pull request (PR) as abandoned since it has gone 14 days or more
    since the last update. An abandoned PR can be continued by another contributor.
    The abandoned label will be removed if work on this PR is taken up again.

issues:
  daysUntilStale: 30
  daysUntilClose: 40
  exemptProjects: true
  exemptMilestones: true
  staleLabel: stale
  exemptLabels:
    - bug
    - enhancement
    - tests
    - documentation
    - resource proposal
    - on hold
    - new module submission
    - module proposal

  markComment: >
    This issue has been automatically marked as stale because
    it has not had activity from the community in the last 30 days. It will be
    closed if no further activity occurs within 10 days. If the issue is labelled
    with any of the work labels (e.g bug, enhancement, documentation, or tests)
    then the issue will not auto-close.

  closeComment: >
    This issue has been automatically closed because it is has not had activity
    from the community in the last 40 days.
```

## GitHub Integration

### Waffle

DSC Resource Kit have a [Waffle board](https://waffle.io/powershell/dscresources)
which is awesome to keep track of everything that is going on in the repositories
of the DSC Resource Kit.

In the Waffle board it is possible to drag issue/PR to different columns and that
way automatically label them. It is the same as anyone labeling the
issue or PR directly, and the issue or PR will move to the new Waffle board column
automatically, so not an automation per say. Although, it is one difference if
the Waffle board or user changes a label. There is a property `isBot` that is
set to `true` in the returned payload (for webhooks) if there was a bot that did
the change. That can affect how other bot threats the label change if it is done
by the Waffle board or done manually by the user.

There is some automation that is done by thanks to the Waffle board.
When an issue is closed, and the issue is in any (one or more) of the Waffle board
columns (except for the *Backlog* or *Done* column), the assigned label to that
column is removed. Same happens when a PR is merged or closed.

For example, if an issue is in the *Help Wanted* column on the Waffle board,
then the issue will have the label *help wanted* assigned. If the issue is closed,
the *help wanted* label will be removed (and the issue will be moved to the
"Closed"-column in the Waffle board).
Another example is if a pull request (PR) has 'needs review' label assigned, the
pull request (PR) will be in the "Needs review"-column of the Waffle board. When
the pull request (PR) is merged (or closed) the 'needs review' label will be
removed from the pull request (PR) (and the issue will be moved to the
"Closed"-column in the Waffle board).

#### On issue close and PR close/merge flowchart

![On merge or close flowchart](/Images/WaffleOnMergeClose.svg)

## Appendix

### Flowcharts

The flowcharts have been created using the free service
[code2flow](https://code2flow.com).

#### Flowchart code for Stale scheduler

```code2flow
// Runs approx. every hour.
// Checks each issue and
// pull request.
// Max 30 items per run.
On Schedule;
switch(Type)
{
  case Issue:
  {
    if(Is labeled with 'stale'?)
    {
      if(Inactive for 10 days?)
      {
        Close issue;
      }
    }
    else
    {
      if(Inactive for 30 days?)
      {
        if(Is part of project?)
        {
        }
        elseif(Is part of milestone?)
        {
        }
        // **Labels:**
        // needs review
        // on hold
        // waiting for CLA pass
        elseif(Has exempt label?)
        {
        }
        else
        {
          // Any existing labels will be kept.
          Label 'Stale';
          Write stale
          issue comment;
        }
      }
    }
    break;
  }

  case Pull Request:
  {
    if(Inactive for 14 days?)
    {
      if(Is part of project?)
      {
      }
      elseif(Is part of milestone?)
      {
      }
      // **Labels:**
      // bug
      // enhancement
      // tests
      // documentation
      // resource proposal
      // on hold
      // -
      // **Special labels:**
      // new module submission
      // module proposal
      elseif(Has exempt label?)
      {
      }
      else
      {
        // Any existing labels will be kept.
        Label 'abandoned';
        Write stale pull
        request comment;
      }
    }
    break;
  }
};
Finished;
```

#### Flowchart code for Stale activity

```code2flow
On pull request
or issue activity
(except close);
switch(Type)
{
  case Issue:
  {
    if(Is labeled
    with 'stale'?)
    {
        Remove label
        'stale';
    }
    break;
  }

  case Pull Request:
  {
    if(Is labeled with
      'abandoned'?)
    {
        Remove label
        'abandoned';
    }
    break;
  }
};
Finished;
```

#### Flowchart code for Waffle on issue close or PR close/merge

```code2flow
On pull request
close/merge,
or issue close;
// If not assigned it will be
// in the Backlog column
// -
// **Waffle columns**
// -
// **Issue columns:**
//
// blocking release
// high priority
// help wanted
// questions
// needs investigating
// discussion
// needs more information
// new module submission
// module proposal

// -
// **PR columns:**
// waiting for CLA
// abandoned
// needs review
// ready to merge
// in progress
// waiting for code fix
// waiting for author response
// -
// **Issue and PR columns:**
// on hold

if(Is assigned to
a column?)
{
    // Normally the column
    // name is the same as
    // the label name.
    Remove all labels
    assigned to the
    issue that have
    a column on the
    Waffle board;
}
Finished;
```
