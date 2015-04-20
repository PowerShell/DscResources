## Register on Github

[Create](https://github.com/join) GitHub account:
![SignUp](Images/SignUp.png)

## Install git
Download and install git for win from the [official web-site](http://git-scm.com/download/win).

During install:

1. Choose "Use git from the Windows command prompt".
![Git-Setup-Path](Images/Git-Setup-Path.png)

2. Choose "Checkout Windows-style, commit Unit-style line endings"
![Git-Setup-Endings](Images/Git-Setup-Endings.png)

You will have two option for git command line: "powershell.exe" or "git bash". Open one of them.

1. If you use `powershell.exe`, you may want to install [posh-git](https://github.com/dahlbyk/posh-git) module (adds tab-completion and branch name to prompt).
2. Git command line often ask for interactive input, which makes powershell_ise.exe bad choice for git command line (has native tab-completion and branch name in prompt out-of-the-box). 
**Warning**: git bash is based on MINGW32, so you need to use linux-style paths. 
I.e. `cd /c/Windows`, instead of `cd c:\Windows`. 

## Setup git

Now you need to setup your name and email global settings.

```
git config --global user.name "YOUR NAME"
git config --global user.email "YOUR EMAIL ADDRESS"
```

And settings for line endings

```
git config --global core.autocrlf true
```

## Setup ssh key
To avoid typing username and password all the time, 
you may [setup ssh-key authentication](https://help.github.com/articles/generating-ssh-keys/) for you github account.
This setup is per machine.


## Clone repository from GitHub

Open GitHub repository of a module. 
To find, it you can go to all [`xDscResources`](xDscResources) or search in [PowerShell GitHub org repos](https://github.com/PowerShell).

I.e. if you want to contribute to **xActiveDirectory** you can do the following

* Find module

![GitHub-find-xActiveDirectory.png](Images/GitHub-find-xActiveDirectory.png)

* Click on hyperlink to go to corresponding GitHub repo

![GitHub-xActiveDirectory.png](Images/GitHub-xActiveDirectory.png)

* Copy **url** from the browser or copy it from the GitHub UI on the right

![GitHub-xActiveDirectory.png](Images/GitHub-xActiveDirectory-Url.png)

![GitHub-xActiveDirectory.png](Images/GitHub-xActiveDirectory-Url-2.png)

* In PowerShell, run command:

```
git clone <url>
```

i.e.

```
git clone https://github.com/PowerShell/xActiveDirectory
```

* Git will create a new directory with corresponding name (i.e. `xActiveDirectory`).

## Forking a repository on GitHub

To send changes from you local machine, you would first need to upload them to your **fork** of our repo.
Use fork button on the right side of repo GitHub page.

![GitHub-Fork.png](Images/GitHub-Fork.png)

## Adding the fork as a remote on the local machine

You would need to add your fork as a [remote](http://git-scm.com/book/en/v2/Git-Basics-Working-with-Remotes) to send changes there.
* Get fork url (same way as original repo url, open fork GitHub page in browser and copy from it).
* Run `git remote add my <url>`, i.e. `git remote add my https://github.com/vors/xActiveDirectory`.
* Check correctness with `git remote -v`

```
> git remote -v
my	https://github.com/vors/xActiveDirectory (fetch)
my	https://github.com/vors/xActiveDirectory (push)
origin	https://github.com/PowerShell/xActiveDirectory (fetch)
origin	https://github.com/PowerShell/xActiveDirectory (push)
```

* Now you have two remote references: **origin** to the original repository and **my** to your fork.

## Making changes and pushing them to the fork

* To make changes, create a new local branch: `git checkout -b <branch>`, i.e. `git checkout -b awesome_feature`.
* To see all branches, run `git branch -a`

```
> git branch -a
* master
  remotes/origin/HEAD -> origin/master
  remotes/origin/master
```
Active branch is marked with `*`.
`-a` flag tells git to show both [**local**](http://git-scm.com/book/en/v2/Git-Branching-Basic-Branching-and-Merging) and [**remote**](http://git-scm.com/book/en/v2/Git-Branching-Remote-Branches) branches.

* make you changes and **commit** them with `git commit -a -m "<Commit message>"`.
`-a` flag tells git to include all modified files in commit.
`-m` flag specifies the commit message.

* To get the big picture of current state of your repository, use `gitk --all` command. It opens a UI with a lot of usefull information. You can read more about **gitk** [here](https://lostechies.com/joshuaflanagan/2010/09/03/use-gitk-to-understand-git/).

![Gitk.png](Images/Gitk.png)

* After that can **push** changes to your fork with `git push my <branch>` command, i.e. `git push my awesome_feature`.

## Sending pull request
 
Now you should be able to see your branch in your fork on GitHub

![GitHub-Select-Branch.png](Images/GitHub-Select-Branch.png)

You can create a new pull request on the same pag

![GitHub-Create-PR.png](Images/GitHub-Create-PR.png)

Follow instructions from [pull request lifecycle](CONTRIBUTING.md#lifecycle-of-a-pull-reqeust) to finish Pull request creating.

## Updating pull request

To update Pull Request, simply push more commits to the same branch in your GitHub fork, that you use to create the pull request.

```
git commit -a -m "Update my awesome feature with codereview feedback"
git push my awesome_feature
```

GitHub would automatically update pull request.
 
## Delete a branch

Once your changes have been successfully merged into the hub repository you can delete the branch you used, as you will no longer need it.  
Any further work requires a new branch.  
To delete your branch follow these steps:

1. Run `git checkout master` in the command prompt.  This ensures that you aren't in the branch to be deleted (which isn't allowed).
2.	Next, type `git branch -d <branch name>` in the command prompt.  This will delete the branch on your local machine only if it has been successfully merged to the upstream repository. (You can override this behavior with the `–D` flag, but first be sure you want to do this.)
3.	Finally, type `git push origin :<branch name>` in the command prompt (a space before the colon and no space after it).  This will delete the branch on your github fork.  
