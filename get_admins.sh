#!/usr/bin/env bash

INPUT=$1

QUERY="select s.first, s.last, u.email as 'Email' from UserEmails u join OrganizationMemberRoles m on u.user_id = m.user_id join Organizations o on o.id = m.organization_id join Users s on s.id = u.user_id where m.role = 'admin' and o.slug = '$INPUT' group by u.email"


mysql -h coredb1.pr.den02.victorops.net -D vo_hier -u rouser -p -e "$QUERY"