#!/usr/bin/env bash

INPUT=$1

QUERY="select o.slug as 'Org Slug', o.name as 'Org Name', t.name as 'Team Name', t.slug as 'Team Slug' from Teams t join Organizations o on o.id = t.organization_id where t.slug like '$INPUT'"


mysql -h coredb1.pr.den02.victorops.net -D vo_hier -u rouser -v -v -p -e "$QUERY"