# Perform Common SQL Queries Directly from the Terminal

Requires MySQL client for the terminal.  If you have HomeBrew, install with `brew install mysql`

Fork this repo and clone it locally.

Add the following lines to your bash profile.  You will need to change the directory to match the directory where you cloned this repo.  (In the below example, the repo is `~/GitHub/sql`)


```bash
# Execute SQL script with argument
        function find_user() {
                ./GitHub/sql/find_user.sh $1
                }

        function find_org() {
                ./GitHub/sql/find_org.sh $1
                }

        function get_admins() {
                ./GitHub/sql/get_admins.sh $@
                }

        function incident() {
                ./GitHub/sql/incident_audit.sh $1 $2
                }
        function poll_org() {
                ./GitHub/sql/poll_org.sh $1
                }

        function splunk_users() {
                ./GitHub/sql/get_splunk_users.sh
                }

        function splunk_orgs() {
                ./GitHub/sql/get_splunk_orgs.sh
                }

        function autopause() {
                ./GitHub/sql/auto_paused_orgs.sh
                }

        function overrides() {
                ./GitHub/sql/show_overrides.sh $1
                }

        function splunk_orgs_enabled() {
                ./GitHub/sql/get_enabled_splunk_orgs.sh
                }
```

### find_user
Takes a single argument that can be either a username or an email address.  For example `find_user jdevops` and `find_user johnny.devops@company.com` will both work.  It should return all relevant info about the user.

### find_org
Takes a single argument that must be the org slug, like `find_org ops-testing`.  It will return all relevant information about the org.

### get_admins
Takes a single argument that must be the org slug, like `get_admins ops-testing`.  It will list out all of the email addresses for all administrators in that org in a format that can be copied from the terminal and pasted into a SF case email.  Be sure to comb throught he list of emails to eliminate duplicates, as this will give all the email addresses listed for each admin user (No need to hit ALL of them, just opt for the one that seems like their work email account)

### incident
Takes two positional arguments: the incident number and the org slug, like so: `incident 1234 ops-testing`.  This will return all the events related to the incident in chronological order (This is the "Incident Audit Query")

### splunk_users
No arguments, just executed as `splunk_users`.  This will return a de-duped list of all users with a splunk.com email address, while filtering out any known internal VictorOps orgs.  Simply add an additional `and o.slug not like \"whatever\"` statement to eliminate any that creep in.

### splunk_orgs
No arguments, just passed as `splunk_orgs`.  This will return relevant info (including current user count) for all Splunk orgs, with internal VictorOps orgs filtered out. Simply add an additional `and o.slug not like \"whatever\"` statement to eliminate any that creep in.

### autopause
No arguments, just passed as `autopause`.  This will return a list of any orgs who are currently auto-paused on ALertCore4.
