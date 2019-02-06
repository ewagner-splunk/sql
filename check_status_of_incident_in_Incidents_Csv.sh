#!/usr/bin/env bash

INPUT1=$1
INPUT2=$2

QUERY="select i.incident_id, i.entity_id, i.entity_disp_name, i.routing_key, i.current_phase, i.created_at from Incidents_Csv i join dimension_org o on o.org_id = i.org_id where incident_id = '$INPUT1' and o.org_slug = '$INPUT2'"

mysql -h repdb2.pr.den02.victorops.net -D vo_reports_data_warehouse -u opssupport -v -v -p -e "$QUERY"