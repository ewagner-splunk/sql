#!/usr/bin/env bash

for arg
do	QUERY="select e.email as 'Email' from UserEmails e join OrganizationMemberRoles m on e.user_id = m.user_id join Organizations o on o.id = m.organization_id join Users u on u.id = e.user_id where m.role = 'admin' and o.slug = '$arg' group by e.email"
	echo $'-----------------------------------------------------------\n'
	printf "Admin emails for slug: %s" "$arg"
	echo $'\n-----------------------------------------------------------'
	mysql -h coredb1.pr.den02.victorops.net -D vo_hier -u rouser -p -e "$QUERY" | while read Email ; do
	echo "$Email"
	done
	echo $'\n\n'
done
