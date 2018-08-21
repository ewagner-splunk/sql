#!/usr/bin/env bash

INPUT=$1

QUERY="select ob.state, oc.id as 'Org ID', o.name as 'Org Name', o.slug as 'Slug', t.slug as 'Team', u1.username as 'Original', u2.username as 'Override_user', date_sub(start_time, interval 7 hour) as 'Start (MDT)', date_sub(end_time, interval 7 hour) as'End (MDT)', oc.team_id as 'Team', oc.override_id from OnCallOverrides oc inner join Teams t on t.id = oc.team_id left outer join Users u1 on u1.id = oc.original_id left outer join Users u2 on u2.id = oc.override_id inner join Organizations o on o.id = t.organization_id inner join OrganizationBilling ob on ob.organization_id = o.id where o.slug like '$INPUT' order by o.slug, t.slug, oc.id desc"

mysql -h coredb1.pr.den02.victorops.net -D vo_hier -u rouser -p -e "$QUERY"