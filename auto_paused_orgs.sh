#!/usr/bin/env bash

QUERY="select o.slug, p.is_paused, p.updated_at from vo_alert_core.polling_states p join vo_hier.Organizations o on o.id = p.org_id where p.is_paused = 1 and o.enabled = 1 and o.alert_core_version = 4"

mysql -h coredb1.pr.den02.victorops.net -D vo_hier -u rouser -p -e "$QUERY"