#!/usr/bin/env bash

INPUT=$1

QUERY="select o.slug from Organizations o join OrganizationBilling b on b.organization_id = o.id where b.state = 'trial' and o.created_on > '$INPUT'"

mysql -h coredb1.pr.den02.victorops.net -D vo_hier -u rouser -p -v -v -e "$QUERY" | while read org_slug; do
	echo \"$org_slug\",
done