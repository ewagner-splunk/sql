#!/usr/bin/env bash

INPUT=$1

QUERY="select o.slug as 'Org Slug', o.name as 'Org Name', e.name as 'Policy Name', e.slug as 'Policy Slug' from EscalationPolicies e join Organizations o on o.id = e.organization_id where e.slug like '$INPUT'"


mysql -h coredb1.pr.den02.victorops.net -D vo_hier -u rouser -v -v -p -e "$QUERY"