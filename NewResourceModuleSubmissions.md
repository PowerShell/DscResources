# How to Submit a New Resource Module

If you are just starting your resource module, **create an extra empty branch first**.
The extra empty branch will make it much easier to [set up the review pull request](#how-to-set-up-the-review-pull-request).
Also, please ensure that your resource module repository is named "\<ResourceModuleName\>Dsc" (e.g. SharePointDsc, WebAdministrationDsc, etc.).

When you are ready for your module to be reviewed, follow these steps:

1. Ensure your new resource module is in its own public repository.
1. Ensure your new repository is under the MIT license.
1. Ensure your new resource module follows the [High Quality DSC Resource Module Guidelines](https://github.com/PowerShell/DscResources/blob/master/HighQualityModuleGuidelines.md).
1. Set up a review pull request by following [these instructions](#how-to-set-up-the-review-pull-request).
This will allow the reviewers to make comments and see the changes you make based on those comments.
1. Submit an issue in the [main DSC Resource Kit repository](https://github.com/PowerShell/DscResources) with a link to your repository.
1. Once **at least three** members of the [Dsc Resource Kit Design Review Team](#dsc-resource-kit-design-review-team) have reviewed and approved the new resource module, close the pull request, making sure all changes from the review are in your working branch.
1. Transfer ownership of the new resource module to the PowerShell organization by first transferring ownership of the respository to **@kwirkykat**. The GitHub instructions for transferring a repository can be found [here](https://help.github.com/articles/transferring-a-repository-owned-by-your-personal-account/).

## DSC Resource Kit Design Review Team
- Katie Keim (@kwirkykat)
- Travis Plunk (@TravisEz13)
- Karol Kaczmarek (@KarolKaczmarek)
- Mariah Breakey(@mbreakey3)
- Hemant Mahawar (@HemantMahawar)
- Mark Gray (@grayzu)

## How to Set Up the Review Pull Request
If you already created an empty branch at the beginning of writing your resource module, simply create a pull request from your working branch to your previously created empty branch.

If you did not create an empty branch at the beginning of writing your resource module, but the very first commit you made to your repository was an empty commit, you can create an empty branch based off of that empty commit like so:
```powershell
$firstCommit = $gitCommits = git rev-list --all                # Retrieves all the git commit SHA keys for the current history
git branch myEmptyBranch $gitCommits[$gitCommits.Count - 1]    # Creates a new branch called myEmptyBranch at the first commit
git push origin myEmptyBranch                                  # Pushes the new empty branch up to GitHub
```
Then create a pull request from your working branch to your newly created empty branch.

If you did not create an empty branch at the beginning of writing your resource module, and the very first commit you made to your repository was not empty, you will need to create 2 new branches:
```powershell
git checkout --orphan reviewTarget               # Creates a new parentless branch named reviewTarget
git rm -r --cached *                             # Removes the current files from the commit pipeline
git clean -fxd                                    # Removes **all** files (committed or not) from this branch
git commit --allow-empty -m 'Start of review'    # Provides an empty commit as the base of this branch
git branch reviewBase                            # Creates a new branch named reviewBase with the same empty commit as the reviewTarget branch
git merge <name of your working branch>          # Merges the code from your working branch into the reviewTarget branch
git push origin reviewTarget                     # Pushes the reviewTarget branch with all of your merged code to GitHub
git push origin reviewBase                       # Pushes the empty reviewBase branch to GitHub
```
Then create a pull request with reviewBase as the base branch and reviewTarget as the target branch.

(Thank you @astrofrog for writing [this amazing blog post](http://astrofrog.github.io/blog/2013/04/10/how-to-conduct-a-full-code-review-on-github/) about conducting full reviews in GitHub!)
