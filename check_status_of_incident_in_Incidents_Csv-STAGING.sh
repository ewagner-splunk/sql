#!/usr/bin/env bash

INPUT1=$1
INPUT2=$2

QUERY="select incident_id, entity_id, entity_disp_name, routing_key, current_phase, created_at from Incidents_Csv where incident_id = '$INPUT1' and org_id = '$INPUT2'"

mysql -h stg-aurora-cluster.cluster-cpyrodqr8iuz.us-west-2.rds.amazonaws.com -D vo_reports_data_warehouse -u rouser -v -v -p -e "$QUERY"