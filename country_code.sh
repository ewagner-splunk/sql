#!/usr/bin/env bash

INPUT=$1

QUERY="select o.slug, u.first, u.last, e.email, p.phone from Users u join OrganizationMembers m on u.id = m.user_id join Organizations o on o.id = m.organization_id join UserPhones p on p.user_id = u.id join UserEmails e on e.user_id = u.id where p.phone like \"%$INPUT%\" group by u.id order by o.slug"

mysql -h coredb1.pr.den02.victorops.net -D vo_hier -u rouser -p -v -v -e "$QUERY"