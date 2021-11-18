# jira-ticket-checker

> A GitHub App built with [Probot](https://github.com/probot/probot) that enforces the linkage of a JIRA ticket to a pull request before it can be merged

> This probot utilizes the Jira API endpoint: `<jiraBaseUrl>: https://www.YourJiraUrl.com
>/rest/api/2/issue/<jira_ticket_number>` and uses the JSON response to determine the ticket number's validity.
## Installation

1. Go to [github.com/settings/apps/jira-ticket-checker/installations](https://github.com/settings/apps/jira-ticket-checker/installations)
1. Click *Install* on your account
1. Choose either *All Repositories* or *Only selected repositories* 
1. Click *Save*
## Post-Installation
After installing the app, create a `.github/config.yml` file in the default branch of either:

1. The repository you want the configuration to be applied in or
1. A repository with the name `.github` to apply the configuration to all repositories

Repositories can belong to either a user account or organization.

Example:

```yaml
jiraBaseUrl: https://www.YourJiraUrl.com
``` 


## Development
 
1. Clone the repo, install dependencies and run it 
    
    ```bash 
    git clone git@github.com:artnetworldwide/automation-jira-ticket-checker.git
    cd automation-jira-ticket-checker.git
    ```
    Locally

    ```bash 
    yarn install
    yarn dev
    ```

    Docker
    ```bash
    docker build -t artnet/jira-ticket-checker:latest .
    docker run -p 3000:3000 artnet/jira-ticket-checker
    ``` 

1. Go to [localhost:3000/probot](http://localhost:3000/probot) and click *Register Github App*
1. Next, you'll get to decide on an app name that isn't already taken. Note: if you see a message "Name is already in use" although no such app exists, it means that a GitHub organization with that name exists and cannot be used as an app name.
1. After registering your GitHub App, you'll be redirected to install the app on any repositories. At the same time, you can check your local `.env` and notice it will be populated with values GitHub sends us in the course of that redirect.
1. Restart the server in your terminal (press <kbd>ctrl</kbd> + <kbd>c</kbd> to stop the server)
1. Install the app on a test repository.
1. Try triggering a webhook to activate the bot!
## Contributing

If you have suggestions for how issue-checker could be improved, or want to report a bug, open an issue! We'd love all and any contributions.

For more, check out the [Contributing Guide](CONTRIBUTING.md).

## License

[ISC](LICENSE) © 2019 Nick Tang <nick.tang@gmail.com>