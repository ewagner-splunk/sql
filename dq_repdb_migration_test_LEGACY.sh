#!/usr/bin/env bash

QUERY1="select count(org_id) from dimension_org"

QUERY2="select count(org_id) from dimension_org_members"

QUERY3="select count(CONCAT(organization_id, \"-\", team_id)) from dimension_team"

QUERY4="select count(CONCAT(user_id, \"-\", team_id)) from dimension_teammembers"

QUERY5="select count(user_id) from dimension_user"

QUERY6="select count(on_id) from fact_user_on_call"

QUERY7="select count(policy_id) from dimension_escalation_policies"

QUERY8="select count(CONCAT(vo_id, \"-\", vo_object)) from dimension_external_salesforce_ids"


printf "\n\n========================================\n Table: dimension_org \n\n *** Legacy DB ***:\n"
mysql -h repdb2.pr.den02.victorops.net -D vo_reports_data_warehouse -u reports -v -e "$QUERY1"

printf "\n\n========================================\n TABLE= dimension_org_members\n\n *** Legacy DB ***:\n"
mysql -h repdb2.pr.den02.victorops.net -D vo_reports_data_warehouse -u reports -v -e "$QUERY2"

printf "\n\n========================================\n TABLE= dimension_team \n\n *** Legacy DB ***:\n"
mysql -h repdb2.pr.den02.victorops.net -D vo_reports_data_warehouse -u reports -v -e "$QUERY3"

printf "\n\n\n\n\n========================================\n TABLE= dimension_teammembers \n\n *** Legacy DB ***:\n"
mysql -h repdb2.pr.den02.victorops.net -D vo_reports_data_warehouse -u reports -v -e "$QUERY4"

printf "\n\n\n\n========================================\n TABLE= dimension_user \n\n *** Legacy DB ***:\n"
mysql -h repdb2.pr.den02.victorops.net -D vo_reports_data_warehouse -u reports -v -e "$QUERY5"

printf "\n\n\n========================================\n TABLE= fact_user_on_call \n\n *** Legacy DB ***:\n"
mysql -h repdb2.pr.den02.victorops.net -D vo_reports_data_warehouse -u reports -v -e "$QUERY6"

printf "\n\n========================================\n TABLE= dimension_escalation_policies \n\n *** Legacy DB ***:\n"
mysql -h repdb2.pr.den02.victorops.net -D vo_reports_data_warehouse -u reports -v -e "$QUERY7"

printf "\n\n========================================\n TABLE= dimension_external_salesforce_ids \n\n *** Legacy DB ***:\n"
mysql -h repdb2.pr.den02.victorops.net -D vo_reports_data_warehouse -u reports -v -e "$QUERY8