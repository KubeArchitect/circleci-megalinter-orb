# CircleCI MegaLinter Orb

[![CircleCI Build Status](https://circleci.com/gh/KubeArchitect/circleci-megalinter-orb.svg?style=shield "CircleCI Build Status")](https://circleci.com/gh/KubeArchitect/circleci-megalinter-orb) [![GitHub License](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://raw.githubusercontent.com/KubeArchitect/circleci-megalinter-orb/master/LICENSE) [![CircleCI Community](https://img.shields.io/badge/community-CircleCI%20Discuss-343434.svg)](https://discuss.circleci.com/c/ecosystem/orbs)

## Environment Variables

The following environment variables must be configured:

| Variable | Description | Required |
|----------|-------------|-----------|
| `DOCKERHUB_USERNAME` | Docker Hub username for pulling MegaLinter image | Yes |
| `DOCKERHUB_PASSWORD` | Docker Hub password for pulling MegaLinter image | Yes |
| `GITHUB_TOKEN` | GitHub token for MegaLinter GitHub integration | Yes |
| `GIT_USER_EMAIL` | Email to use for Git operations when auto-fixing issues | No |
| `GIT_USER_NAME` | Name to use for Git operations when auto-fixing issues | No |

## Orb Parameters

The following parameters can be configured when using the orb:

### General Parameters
| Parameter | Description | Default | Required |
|-----------|-------------|---------|-----------|
| `resource_class` | The resource class to use for the jobs (see [resource classes](https://circleci.com/docs/2.0/configuration-reference/#resource_class)) | medium | No |
| `tag` | Choose a specific tag of megalinter (see [available tags](https://hub.docker.com/r/oxsecurity/megalinter/tags)) | latest | No |
| `flavor` | Choose a specific flavor of megalinter (see [available flavors](https://megalinter.io/latest/flavors/)) | "" | No |
| `github_token` | GitHub token to use for the reporters in megalinter | GITHUB_TOKEN | No |
| `parallelism` | Number of parallel executors to use | 1 | No |
| `persist_megalinter_reports` | Whether to persist the megalinter-reports folder for use in subsequent jobs | false | No |
| `entrypoint` | Change entrypoint of megalinter | "/entrypoint.sh" | No |

### Git Operations Parameters
| Parameter | Description | Default | Required |
|-----------|-------------|---------|-----------|
| `run_git_operations` | Whether to run git operations to commit and push changes | false | No |
| `git_user_email` | Email to use for Git | GIT_USER_EMAIL | No |
| `git_user_name` | Name to use for Git | GIT_USER_NAME | No |
| `git_pr_commit_message` | Commit message to use for Git | "Automated linting fixes by MegaLinter" | No |
| `git_pr_title` | Title to use for the pull request | "[MegaLinter] Apply linters automatic fixes" | No |
| `git_pr_branch_name` | Branch name to use for Git | "megalinter-fixes-$CIRCLE_BUILD_NUM" | No |
| `git_pr_base_branch` | Boolean parameter for base branch to use for Git | false | No |
| `git_pr_current_branch` | Current branch to use for Git (used only for setting up git pull request together with git_pr_base_branch) | "" | No |

### Security Notes
- GitHub Token: Use a token with minimal required permissions (read-only access recommended)
- Docker Hub: Consider using a restricted access token instead of password
- For CircleCI security best practices, see [Using Contexts](https://circleci.com/docs/contexts/)

## Resources

[CircleCI Orb Registry Page](https://circleci.com/developer/orbs/orb/RelativeSure/megalinter) - The official registry page of this orb for all versions, executors, commands, and jobs described.

[CircleCI Orb Docs](https://circleci.com/docs/orb-intro/#section=configuration) - Docs for using, creating, and publishing CircleCI Orbs.

All examples are shown in [the examples folder](src/examples/)

### How to Contribute

We welcome [issues](https://github.com/RelativeSure/circleci-megalinter-orb/issues) and [pull requests](https://github.com/RelativeSure/circleci-megalinter-orb/pulls) against this repository!

#### Contribution Guidelines
1. Fork and clone the repository
2. Create a new branch for your changes
3. Make your changes following our coding standards
4. Test your changes locally
5. Submit a pull request with a clear description of the changes

For more details, see our [Contributing Guide](CONTRIBUTING.md).

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
    vcs_type: << pipeline.project.type >>
    pub_type: dev
    # Ensure this job requires all test jobs and the pack job.
    requires:
      - orb-tools/pack
      - megalinter/megalinter
    context: < organization context >
    filters: *filters
