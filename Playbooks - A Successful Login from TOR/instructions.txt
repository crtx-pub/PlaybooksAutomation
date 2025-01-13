# Testing the "A Successful Login from TOR" Playbook

This guide provides detailed instructions on how to test the "A Successful Login from TOR" playbook using identity providers such as OKTA and Azure AD. Follow the steps below to configure and execute the test environment.

## Prerequisites

- **GitHub Repository:** Ensure you have access to our [GitHub repository](URL-to-GitHub-repo) which contains additional configuration files and scripts.
- **TOR Browser:** Download and install the TOR Browser from [here](https://www.torproject.org/download/).

## Step 1: Registering With an Identity Provider

1. Choose an identity provider. We used OKTA for our setup (some actions only support Azure AD):
   - OKTA: Register for a trial at [OKTA](https://www.okta.com/free-trial/).
   - Azure AD: Register for a trial at [Azure AD](https://azure.microsoft.com/en-us/services/active-directory/).

2. During the registration:
   - Configure a username and password.
   - Note and save the URL of your newly created tenant.

## Step 2: Configuration in XIM

1. Log in to the XSIAM platform.
2. Configure the newly created tenant as a data source in XSIAM:
   - Navigate to the 'Data Sources' section.
   - Add your tenant information and credentials.

## Step 3: Simulate the Attack

1. Open the TOR Browser.
2. Log into your IDP tenant using the previously configured username and password.

## Step 4: Monitor the Results

1. Return to the XSIAM platform.
2. Monitor for alerts that are triggered by the login attempt.
   - If the "A Successful Login from TOR" playbook is triggered, follow through the playbook steps as they unfold.
   - If a different playbook is triggered, use the incident configuration to either showcase this playbook or manually activate the "A Successful Login from TOR" playbook.

3. Optionally, if using an existing alert to showcase the playbook:
   - Use the pre-configured tenant in the settings.
   - Filter the incidents as required to refine the alert presentation.

## Conclusion

By following these steps, you can effectively simulate and test the response of the "A Successful Login from TOR" playbook to unauthorized access attempts via the TOR network. For more detailed information or technical assistance, refer to the resources on our GitHub repository.
