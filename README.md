# ABAP CI/CD

This repository contains an example of how a CI/CD approach can be achieved with an ABAP S4/ECC project.

# Tools used

- [abapGit](https://abapgit.org/): Serializing objects and having a git approach for ABAP developments
- [abapLint](https://abaplint.org/): Syntax check based on a defined rule set
- [ADASH](https://github.com/xinitrc86/adash-cli): Run ABAP unit tests
- [TRM](https://trmregistry.com): Publish and distribute software ready for production environments

## SAP System

The source and target SAP systems are instances of ABAP Platform 1909 provided by [Nuve Platform](https://nuveplatform.com).

The source instance is where all the code changes are performed and committed to this repository; it's also where the TRM release will be generated.

When ready to distribute, a new ABAP Platform 1909 instance is generated but this time from a blank backup (a snapshot where this example package was never installed): this will simulate the first install of a TRM package.

# Branching strategy

The branching strategy of this repository is [trunk-based](https://trunkbaseddevelopment.com/):

the **main** branch is protected, only allowing merge from pull requests.

# Tests

Merges to main are prevented (by pull request rules) if something wrong with the tests is detected.

## abapLint

abapLint will check for syntax errors on each commit.

## ABAP Unit tests

Each commit to any branch other than main will trigger a workflow that checks all of the unit tests in the package (using ADASH).

# Release

Releases are generated with [Github Releases](https://docs.github.com/en/repositories/releasing-projects-on-github/managing-releases-in-a-repository#creating-a-release).

## TRM Release

When a Github Release is created, the TRM publish workflow will trigger.

# Distribute

As soon as the TRM release is completed, the TRM install workflow is triggered.

# Workflow

<p align="center">
  <img src="/media/workflow.jpg" />
</p>

Steps:

- All code is written in a central development system
- Commits are done in a new branch
	- Trigger abapLint syntax check
	- Trigger ABAP Unit tests (ADASH executed on central development system)
- When ready, pull request from branch -> main
	- If all checks ok, merge
- When ready, manually create a new Github release
	- Trigger TRM Publish (from central development system)
- TRM Release published
	- Trigger TRM Install (in this case, run and install on a new instance of ABAP Platform 1909 on Nuve Platform)