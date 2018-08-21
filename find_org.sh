#!/usr/bin/env bash

INPUT=$1

QUERY="select o.slug as 'Slug', o.name as 'Name', b.tier as 'Product Tier', case o.enabled when 1 then 'Enabled' when 0 then 'Disabled' end as 'Org status', b.state as 'State', b.seats_credit as 'Credits', b.seats_prepaid as 'Prepaid', o.created_on as 'Creation Date', b.trial_end as 'Trial End Date', o.last_login as 'Last Login', o.sso_idp as 'SSO IDP entityID', a.value as 'Trad Auth Enabled' from vo_hier.Organizations o join vo_hier.OrganizationBilling b on b.organization_id = o.id join vo_alert. OrganizationAlertMeta a on a.organization_id = o.id where o.slug LIKE '$INPUT' and a.name like '%AllowPasswordAuth%' order by o.enabled desc"


mysql -h coredb1.pr.den02.victorops.net -D vo_hier -u rouser -p -e "$QUERY"