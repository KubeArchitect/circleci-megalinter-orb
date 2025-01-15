# CircleCI MegaLinter Orb

[![CircleCI Build Status](https://circleci.com/gh/RelativeSure/circleci-megalinter-orb.svg?style=shield "CircleCI Build Status")](https://circleci.com/gh/RelativeSure/circleci-megalinter-orb) [![GitHub License](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://raw.githubusercontent.com/RelativeSure/circleci-megalinter-orb/master/LICENSE) [![CircleCI Community](https://img.shields.io/badge/community-CircleCI%20Discuss-343434.svg)](https://discuss.circleci.com/c/ecosystem/orbs)

## Environment Variables

The following environment variables must be configured:

| Variable | Description | Required |
|----------|-------------|-----------|
| `DOCKER_HUB_USER` | Docker Hub username for pulling MegaLinter image | Yes |
| `DOCKER_HUB_PASSWORD` | Docker Hub password for pulling MegaLinter image | Yes |
| `GITHUB_TOKEN` | GitHub token for MegaLinter GitHub integration | Yes |

## Resources

[CircleCI Orb Registry Page](https://circleci.com/developer/orbs/orb/RelativeSure/megalinter) - The official registry page of this orb for all versions, executors, commands, and jobs described.

[CircleCI Orb Docs](https://circleci.com/docs/orb-intro/#section=configuration) - Docs for using, creating, and publishing CircleCI Orbs.

### How to Contribute

We welcome [issues](https://github.com/RelativeSure/circleci-megalinter-orb/issues) and [pull requests](https://github.com/RelativeSure/circleci-megalinter-orb/pulls) against this repository!

### How to Publish an Update

1. Merge pull requests with desired changes to the main branch.
   - For the best experience, squash-and-merge and use [Conventional Commit Messages](https://conventionalcommits.org/).
2. Find the current version of the orb.
   - You can run `circleci orb info RelativeSure/megalinter | grep "latest"` to see the current version.
3. Create a [new release](https://github.com/RelativeSure/circleci-megalinter-orb/releases/new) on GitHub.
   - Click "Choose a tag" and _create_ a new [semantically versioned](http://semver.org/) tag. (ex: v1.0.0)
     - We will have an opportunity to change this before we publish if needed after the next step.
   - Click _"+ Auto-generate release notes"_.
   - This will create a summary of all of the merged pull requests since the previous release.
   - If you have used _[Conventional Commit Messages](https://conventionalcommits.org/)_ it will be easy to determine what types of changes were made, allowing you to ensure the correct version tag is being published.
4. Now ensure the version tag selected is semantically accurate based on the changes included.
5. Click _"Publish Release"_.
   - This will push a new tag and trigger your publishing pipeline on CircleCI.

### Development Orbs

Prerequisites:

- An initial semver deployment must be performed in order for development orbs to be published and seen in the [Orb Registry](https://circleci.com/developer/orbs).

A [Development Orb](https://circleci.com/docs/orb-concepts/#development-orbs) can be created to help with rapid development or testing. To create a development orb, change the `orb-tools/publish` job in `test-deploy.yml` to be the following:

```yaml
- orb-tools/publish:
    orb_name: RelativeSure/megalinter
    vcs_type: >
    pub_type: dev
    # Ensure this job requires all test jobs and the pack job.
    requires:
      - orb-tools/pack
      - megalinter/megalinter
    context: orb-publishing
    filters: *filters
