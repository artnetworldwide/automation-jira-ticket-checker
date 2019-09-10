# jira-ticket-checker

> A GitHub App built with [Probot](https://github.com/probot/probot) that enforces the linkage of a Jira ticket to a pull request before it can be merged

## Installation
After installing the app, create a `.github/config.yml` file in the default branch of either:

1. The repository you want the configuration to be applied in or
2. A repository with the name `.github` to apply the configuration to all repositories

Repositories can belong to either a user account or organization.

Example:

```yaml
jiraBaseUrl: https://www.foobar.com/Jira
``` 


## Contributing

If you have suggestions for how issue-checker could be improved, or want to report a bug, open an issue! We'd love all and any contributions.

For more, check out the [Contributing Guide](CONTRIBUTING.md).

## License

[ISC](LICENSE) © 2019 Nick Tang <ntang@artnet.com>