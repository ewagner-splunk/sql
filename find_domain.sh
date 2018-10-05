#!/usr/bin/env bash

INPUT=$1

QUERY="select o.name as 'Org name', o.slug as 'Org slug', case o.enabled when 1 then 'Enabled'when 0 then 'Disabled'end as 'Org status', b.state as 'Billing State', u.username, u.first as 'First name', u.last as 'Last name', u.created_on as 'User created on', e.email, case e.verified when 1 then 'Verified'when 0 then 'Unverified'end as 'Email Status'from Organizations o join OrganizationMembers m on o.id = m.organization_id join Users u on u.id = m.user_id join OrganizationBilling b on b.organization_id = o.id join UserEmails e on e.user_id = u.id where e.email like '%$INPUT%' group by o.slug"

mysql -h coredb1.pr.den02.victorops.net -D vo_hier -u rouser -p -e "$QUERY"