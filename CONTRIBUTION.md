# Contributing to CircleCI MegaLinter Orb

First off, thank you for considering contributing to the CircleCI MegaLinter Orb! This document provides guidelines and steps for contributing.

## Table of Contents

- [Contributing to CircleCI MegaLinter Orb](#contributing-to-circleci-megalinter-orb)
  - [Table of Contents](#table-of-contents)
  - [Code of Conduct](#code-of-conduct)
  - [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Environment Setup](#environment-setup)
  - [Development Process](#development-process)
    - [Development Orbs](#development-orbs)
  - [Orb Structure](#orb-structure)
  - [Testing](#testing)
  - [Publishing](#publishing)
    - [Version Updates](#version-updates)
    - [Additional Resources](#additional-resources)

## Code of Conduct

This project and everyone participating in it are governed by our Code of Conduct. By participating, you are expected to uphold this code.

## Getting Started

### Prerequisites

- Basic knowledge of CircleCI configuration and orbs
- CircleCI CLI installed locally
- GitHub account
- Docker Hub account

### Environment Setup

Configure the following environment variables:

- `DOCKER_HUB_USER`: Docker Hub username
- `DOCKER_HUB_PASSWORD`: Docker Hub password
- `GITHUB_TOKEN`: GitHub token for integration

## Development Process

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test your changes locally
5. Submit a pull request

### Development Orbs

For rapid development and testing, you can create a development orb:

1. Ensure you have performed an initial semver deployment
2. Modify the `orb-tools/publish` job in `test-deploy.yml`:

```yaml
- orb-tools/publish:
    orb_name: RelativeSure/megalinter
    vcs_type: >
    pub_type: dev
    requires:
      - orb-tools/pack
      - megalinter/megalinter
    context: Main Context
    filters: *filters
```

## Orb Structure

The orb source is maintained in an _unpacked_ form for easier development:

- `@orb.yml`: Main entry point containing:
  - version (2.1)
  - description
  - display (home_url and source_url)
  - orb dependencies

## Testing

Before submitting your changes:

1. Ensure all tests pass locally
2. Run the orb validation
3. Test the orb in a sample project

## Publishing

### Version Updates

1. Merge pull requests to the main branch
   - Use [Conventional Commit Messages](https://conventionalcommits.org/)
2. Check current version:

   ```bash
   circleci orb info RelativeSure/megalinter | grep "latest"
   ```

3. Create a [new release](https://github.com/RelativeSure/circleci-megalinter-orb/releases/new)
   - Create a semantically versioned tag
   - Auto-generate release notes
   - Review changes and ensure version accuracy
4. Publish the release

### Additional Resources

- [CircleCI Orb Registry](https://circleci.com/developer/orbs/orb/RelativeSure/megalinter)
- [CircleCI Orb Docs](https://circleci.com/docs/orb-intro/#section=configuration)
- [Orb Author Intro](https://circleci.com/docs/2.0/orb-author-intro/#section=configuration)
- [Reusable Configuration](https://circleci.com/docs/2.0/reusing-config)
