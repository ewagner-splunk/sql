#!/usr/bin/env bash

QUERY1="select count(org_id) from dimension_org"

QUERY2="select count(org_id) from dimension_org_members"

QUERY3="select count(CONCAT(organization_id, \"-\", team_id)) from dimension_team"

QUERY4="select count(CONCAT(user_id, \"-\", team_id)) from dimension_teammembers"

QUERY5="select count(user_id) from dimension_user"

QUERY6="select count(on_id) from fact_user_on_call"

QUERY7="select count(policy_id) from dimension_escalation_policies"

QUERY8="select count(CONCAT(vo_id, \"-\", vo_object)) from dimension_external_salesforce_ids"

printf "\n\n *** AWS DB ***\n"
mysql -h reporting.cluster-caafzfourwgg.us-west-2.rds.amazonaws.com -D vo_reports_data_warehouse -u reports -v -e "$QUERY1"

printf "\n\n *** AWS DB ***\n"
mysql -h reporting.cluster-caafzfourwgg.us-west-2.rds.amazonaws.com -D vo_reports_data_warehouse -u reports -v -e "$QUERY2"

printf "\n\n *** AWS DB ***\n"
mysql -h reporting.cluster-caafzfourwgg.us-west-2.rds.amazonaws.com -D vo_reports_data_warehouse -u reports -v -e "$QUERY3"

printf "\n\n *** AWS DB ***\n"
mysql -h reporting.cluster-caafzfourwgg.us-west-2.rds.amazonaws.com -D vo_reports_data_warehouse -u reports -v -e "$QUERY4"

printf "\n\n *** AWS DB ***\n"
mysql -h reporting.cluster-caafzfourwgg.us-west-2.rds.amazonaws.com -D vo_reports_data_warehouse -u reports -v -e "$QUERY5"

printf "\n\n *** AWS DB ***\n"
mysql -h reporting.cluster-caafzfourwgg.us-west-2.rds.amazonaws.com -D vo_reports_data_warehouse -u reports -v -e "$QUERY6"

printf "\n\n *** AWS DB ***\n"
mysql -h reporting.cluster-caafzfourwgg.us-west-2.rds.amazonaws.com -D vo_reports_data_warehouse -u reports -v -e "$QUERY7"

printf "\n\n *** AWS DB ***\n"
mysql -h reporting.cluster-caafzfourwgg.us-west-2.rds.amazonaws.com -D vo_reports_data_warehouse -u reports -v -e "$QUERY8"