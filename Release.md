# DSC Resource Kit Release Process

1. (Script) Get all pull requests merged since the last release tag date
1. (Manual) Look at the pull requests and determine whether the module should
  be released or not. Modules that only have updates in documentation, tests,
  or examples may not be released to PowerShell Gallery unless it is specially
  requested.
1. (Manual) Determine the new version of the updated module. Modules with breaking
  changes have their major version updated. Modules without breaking changes have
  only their minor version updated.
1. (Manual) Make sure that release notes are present in the `README.md` or `CHANGELOG.md`
  file of the resource. The script will print an error and will not update the module
  for release if release notes are not present in either of these two files.
1. (Manual) Make sure there are no issues open on the module repository that are
  labeled as `blocking release`.
1. (Script) Run the DSC resource module release script. This script will perform
  the following actions:
    1. Clone the dev branch of the module from GitHub
    1. Replace the version in the module manifest with the new version (provided
      as a parameter to the script). To find the module manifest, the script will
      search for any file named `ModuleName.psd1` in the repository. If more than
      one file is found it will try to pick the one in the root directory of the
      module.
    1. In the file containing the release notes, add a new markdown header with the
      title as the new version of the module underneath the header with the title
      'Unreleased'. To find the file that contains the release notes, the script
      will look for `README.md` at the root of the repository. If that file does
      not exist then it will look for `CHANGELOG.md` at the root of the repository.
      If no release notes are found, the script will error and the update of the
      module will be stopped.
    1. Get the release notes from the file containing the release notes. To find
      the file that contains the release notes, the script will first attempt to
      find any file in the module named `README.md`. If more than one file is found
      it will try to pick the one in the root directory of the module. Then it will
      attempt to find the header with the title `Release Notes` in that file. If
      there is no file named `README.md` or the file does not contain the
      `Release Notes` header, then the script will look for any file in the repository
      named `CHANGELOG.md`. If more than one file is found it will try to pick the
      one in the root directory of the module. Then it will attempt to find the
      header with the title `Release Notes` in that file. If no release notes are
      found, the script will error and the update of the module will be stopped.
    1. Retrieve the release notes by getting the text between the new version
      header and the next markdown version header.
    1. Replace all single quote characters in the release notes with double quotes
      (this prevents the manifest from getting messed up).
    1. Remove all pound characters from the release notes (the manifest views
      these as comment characters).
    1. Add the release notes with the edited characters to the module manifest by
      finding the `ReleaseNotes` property and replacing all text between two single
      quotes after that property. To find the module manifest, the script will search
      for any file named `ModuleName.psd1` in the repository. If more than one file
      is found it will try to pick the one in the root directory of the module.
    1. Commit and push these changes to the dev branch on GitHub
    1. Create the release pull request from the dev branch to the master branch.
1. (Manual) Verify that all release pull requests were correctly opened.
1. (Manual) Verify that the module version and release notes were correctly changed
  in the module manifest, and these changes are part of the release pull request.
1. (Manual) Wait for the tests to pass on the release pull request. If they do not
  pass, evaluate if the test fix is a quick fix or a problem in the testing system.
  If it looks like the test will require a code change, open an issue on the test
  failure with the label `blocking release` alert the repository maintainer if the
  repository has one.
1. (Manual) Merge the release pull request.
1. (Script) Create a release tag at the latest commit in master and push it to
  the repository.
1. (Script) Publish the module from the master branch to the PowerShell Gallery.
