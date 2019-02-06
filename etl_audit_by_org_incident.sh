#!/usr/bin/env bash
# First input = org_d in the database
# Second input = single incident number or list of comma separated incident numbers
# Example:
# 	>>>: ./etl_audit_by_org_incident.sh 5532 3456,3457,3489


INPUT1=$1
INPUT2=$2

QUERY1="select org_id, incident_id, start_time, ack_time, end_time, current_phase from fact_all_incidents where org_id = $INPUT1 and incident_id IN ($INPUT2);"

QUERY2="select org_id, incident_id, uuid, alert_type, alert_received_time from fact_incident_alerts where org_id = $INPUT1 and incident_id IN ($INPUT2) order by incident_id,alert_received_time desc"

QUERY3="select org_id, incident_id, user_id, service_time from dimension_surfaced_incidents where org_id = $INPUT1 and incident_id IN ($INPUT2) ORDER BY incident_id, service_time;"

QUERY4="select org_id, username, incident_id, uuid, TTA, TTR from fact_user_tts where org_id = $INPUT1 and incident_id IN ($INPUT2) ORDER BY incident_id"

QUERY5="select org_id, incident_id, event_time, type from incident_timeline where org_id = $INPUT1 and incident_id IN ($INPUT2) order by incident_id, event_time desc"

QUERY6="select org_id, incident_id, start_time, ack_time, res_time, current_phase, tta, ttr from Incidents_Csv where org_id = $INPUT1 and incident_id IN ($INPUT2)"


printf "\n========================================\n TABLE= fact_all_incidents\n========================================\n"
mysql -h repdb2.pr.den02.victorops.net -D vo_reports_data_warehouse -u opssupport -v -v -e "$QUERY1"

printf "\n========================================\n TABLE= fact_incident_alerts\n========================================\n"
mysql -h repdb2.pr.den02.victorops.net -D vo_reports_data_warehouse -u opssupport -v -v -e "$QUERY2"

printf "\n========================================\n TABLE= dimension_surfaced_incidents\n========================================\n"
mysql -h repdb2.pr.den02.victorops.net -D vo_reports_data_warehouse -u opssupport -v -v -e "$QUERY3"

printf "\n========================================\n TABLE= fact_user_tts\n========================================\n"
mysql -h repdb2.pr.den02.victorops.net -D vo_reports_data_warehouse -u opssupport -v -v -e "$QUERY4"

printf "\n========================================\n TABLE= incident_timeline\n========================================\n"
mysql -h repdb2.pr.den02.victorops.net -D vo_reports_data_warehouse -u opssupport -v -v -e "$QUERY5"

printf "\n========================================\n TABLE= Incidents_Csv\n========================================\n"
mysql -h repdb2.pr.den02.victorops.net -D vo_reports_data_warehouse -u opssupport -v -v -e "$QUERY6"