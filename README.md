# ABAP CI/CD

This repository contains an example of how a CI/CD approach can be achieved with an ABAP project.

Notice that with CD we're reefering to [Continuous Deployment](#continuous-deployment-cd), but with a different branching strategy, [Continuous Delivery](#difference-between-continuous-deployment-and-continuous-delivery) is also possible.

## Tools used

- [abapGit](https://abapgit.org/): Serializing objects and having a git approach for ABAP developments
- [abapLint](https://abaplint.org/): Code analysis based on code owners defined rules
- [ADASH](https://github.com/xinitrc86/adash-cli): Run ABAP unit tests
- [TRM](https://trmregistry.com): Publish and distribute software ready for production environments

## Branching strategy

We're going to use the following branching strategy:

**main** commits will be done by **pull requests only** from the **development** branch.

Each pull request development -> main will trigger abapLint syntax checks and ADASH unit tests.

Each commit to main will create a new release on TRM (and Github).

This branching strategy is used for **demonstration purposes** and is not recommended for production use.

## Infrastructure

In this example, the code is done by all developers in one **central development system** (here called RST).

While checking the syntax of the code during the development stage can be done "offline", ABAP unit tests and TRM operations are only possible with an SAP system.

> abapLint has a transpile option for running unit tests without an SAP system, but it's limited. A system would still be necessary for TRM.

After the code is tested in the central development system and published to a TRM registry, it will be deployed into another SAP system (here called RGH).

All SAP systems (RST for central development and RGH for deployment target) are accessible by Github Actions because they are executed in a self-hosted runner.

<p align="center">
  <img src="/_media/schema.jpg" />
</p>

# Continuous Integration (CI)

Continuous integration refers to all the steps necessary for automatically building and testing code, ensuring the changes are done following the rules defined by the code owners and that their execution doesn't have negative side-effects on already tested features.

# Continuous Deployment (CD)

Continuous deployment refers to all the steps necessary for **releasing a solution into a production environment** and available to customers.

## Difference between continuous deployment and continuous delivery

The difference between the two is that continuous delivery focuses on having software ready for manual tests, while continuous deployment ensures a solution ready for production environments.

In this example, we're implementing **continuous deployment**, but continuous delivery for ABAP is also possible using the same tools we're using here.

The main changes for implementing continuous delivery would be:
- Different branching strategy
- Two distinct TRM packages, one for manual testing and one for production use