
QUERY_X="select * from Columns where table_schema = 'vo_reports_data_warehouse'"

QUERY_Y="select * from ROUTINES;"

#----------------------------------------------------------------------------------------------------------------------------
QUERY1="select count(CONCAT(org_id, \"-\", incident_id, \"-\", start_time)) from Incidents_Csv_Old"

printf "\n\n========================================\n Table: Incidents_Csv_Old \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY2="select count(CONCAT(org_id, \"-\", incident_id, \"-\", start_time)) from Incidents_Csv_Quarantined_Test_REBUILD"

printf "\n\n========================================\n Table: Incidents_Csv_Quarantined_Test_REBUILD \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY2");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY2");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY3="select count(Slug) from MIC_usage_last_30_days_By_org"

printf "\n\n========================================\n Table: MIC_usage_last_30_days_By_org \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY3");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY3;");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY4='select count(username) from RAMEN_NPS'

printf "\n\n========================================\n Table: RAMEN_NPS \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY4");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY4");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY5="select count(CONCAT(org_id, \"-\", incident_id, \"-\", event_time, \"-\", user_id, \"-\", type)) from _incident_timeline_1"

printf "\n\n========================================\n Table: _incident_timeline_1 \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY5");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY5");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY6="select count(event_date) from _job_control_1"

printf "\n\n========================================\n Table: _job_control_1 \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY6");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY6");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY7="select count(org_id) from active_chats"

printf "\n\n========================================\n Table: active_chats \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY7");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY7");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY8="select count(org_slug) from active_integrations"

printf "\n\n========================================\n Table: active_integrations \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY8");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY8");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY9="select count(org_id) from active_monitors"

printf "\n\n========================================\n Table: active_monitors \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY9");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY9");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY10="select count(created_on) from backfill_alert_count"

printf "\n\n========================================\n Table: backfill_alert_count \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY10");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY10");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY11="select count(org_id) from calculated_billing_status"

printf "\n\n========================================\n Table: calculated_billing_status \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY11");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY11");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------


QUERY12="select count(org_id) from churned_orgs"

printf "\n\n========================================\n Table: churned_orgs \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY12");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY12");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY13="select count(table_name) from consumer_offsets"

printf "\n\n========================================\n Table: consumer_offsets \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY13");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY13");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY14="select count(org_id) from deleted_orgs"

printf "\n\n========================================\n Table: deleted_orgs \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY14");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY14");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------


QUERY15="select count(seq) from deleted_stats"

printf "\n\n========================================\n Table: deleted_stats \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY15");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY15");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY16="select count(user_id) from deleted_users"

printf "\n\n========================================\n Table: deleted_users \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY16");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY16");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY17="select count(id) from dimension_billing_audit_stream"

printf "\n\n========================================\n Table: dimension_billing_audit_stream \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY17");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY17");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY18="select count(user_id) from deleted_users"

printf "\n\n========================================\n Table: dimension_device \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY18");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY18");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY19="select count(id) from dimension_entity_type"

printf "\n\n========================================\n Table: dimension_entity_type \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY19");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY19");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY20="select count(CONCAT(org_id, \"-\", policy_slug, \"-\", incident_id, \"-\", escalated_at)) from dimension_escalated_policies"

printf "\n\n========================================\n Table: dimension_escalated_policies \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY20");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY20");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------


QUERY21="select count(CONCAT(org_id, \"-\", team_id, \"-\", incident_id, \"-\", escalated_at)) from dimension_escalated_teams"

printf "\n\n========================================\n Table: dimension_escalated_teams \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY21");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY21");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY22="select count(policy_id) from dimension_escalation_policies"

printf "\n\n========================================\n Table: dimension_escalation_policies \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY22");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY22");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY23="select count(CONCAT(entry_id, \"-\", policy_group_id, \"-\", policy_type, \"-\", deleted, \"-\", created_at)) from dimension_escalation_policy_entries"

printf "\n\n========================================\n Table: dimension_escalation_policy_entries \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY23");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY23");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY24="select count(CONCAT(policy_group_id, \"-\", policy_id, \"-\", priority, \"-\", timeout)) from dimension_escalation_policy_groups"

printf "\n\n========================================\n Table: dimension_escalation_policy_groups \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY24");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY24");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY25="select count(CONCAT(vo_id, \"-\", vo_object)) from dimension_external_salesforce_ids"

printf "\n\n========================================\n Table: dimension_external_salesforce_ids \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY25");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY25");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY26="select count(id) from dimension_monitor"

printf "\n\n========================================\n Table: dimension_monitor \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY26");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY26");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY27="select count(CONCAT(notify_id, \"-\", incident_id, \"-\", org_id)) from dimension_notify_incident_join"

printf "\n\n========================================\n Table: dimension_notify_incident_join \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY27");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY27");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY28="select count(org_id) from dimension_org"

printf "\n\n========================================\n Table: dimension_org \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY28");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY28");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY29="select count(org_id) from dimension_org_members"

printf "\n\n========================================\n Table: dimension_org_members \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY29");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY29");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY30="select count(CONCAT(org_id, \"-\", user_id)) from dimension_org_members_stage"

printf "\n\n========================================\n Table: dimension_org_members_stage \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY30");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY30");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY31 ="select count(org_id) from dimension_org_stage"

printf "\n\n========================================\n Table: dimension_org_stage \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY31");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY31");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY32="select count(CONCAT(org_id, \"-\", incident_id)) from dimension_paged_users"

printf "\n\n========================================\n Table: dimension_paged_users \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY32");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY32");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY33="select count(CONCAT(roster_id, \"-\", organization_id, \"-\", deleted, \"-\", created_at)) from dimension_rosters"

printf "\n\n========================================\n Table: dimension_rosters \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY33");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY33");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY34="select count(CONCAT(rotation_group_id, \"-\", team_id, \"-\", label, \"-\", deleted, \"-\", created_at)) from dimension_rotation_groups"

printf "\n\n========================================\n Table: dimension_rotation_groups \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY34");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY34");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY35="select count(CONCAT(rotation_member_id, \"-\", rotation_id, \"-\", user_id, \"-\", rank, \"-\", deleted, \"-\", roster_id, \"-\", deleted_rotation_member, \"-\", created_at)) from dimension_rotation_members"

printf "\n\n========================================\n Table: dimension_rotation_members \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY35");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY35");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY36="select count(CONCAT(rotation_id, \"-\", team_id, \"-\", label, \"-\", timezone, \"-\", start, \"-\", duration, \"-\", daymask, \"-\", timemask, \"-\", shifttype, \"-\", roster_id, \"-\", deleted, \"-\", created_at)) from dimension_rotation_members"

printf "\n\n========================================\n Table: dimension_rotations \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY36");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY36");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY37="select count(CONCAT(route_id, \"-\", escalation_policy_id)) from dimension_route_to_escalation_policies"

printf "\n\n========================================\n Table: dimension_route_to_escalation_policies \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY37");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY37");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY38="select count(CONCAT(route_id, \"-\", user_id)) from dimension_route_to_paged_users"

printf "\n\n========================================\n Table: dimension_route_to_paged_users \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY38");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY38");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY39="select count(CONCAT(route_id, \"-\", team_id)) from dimension_route_to_teams"

printf "\n\n========================================\n Table: dimension_route_to_teams \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY39");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY39");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY40="select count(id) from dimension_subscription_audit_stream"

printf "\n\n========================================\n Table: dimension_subscription_audit_stream \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY40");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY40");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY41="select count(CONCAT(org_id, \"-\", user_id, \"-\", service_time)) from dimension_surfaced_incidents"

printf "\n\n========================================\n Table: dimension_surfaced_incidents \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY41");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY41");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY42="select count(CONCAT(organization_id, \"-\", team_id)) from dimension_team"

printf "\n\n========================================\n Table: dimension_team \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY42");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY42");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY43="select count(id) from dimension_team_escalation_policies"

printf "\n\n========================================\n Table: dimension_team_escalation_policies \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY43");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY43");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY44="select count(CONCAT(user_id, \"-\", team_id)) from dimension_teammembers"

printf "\n\n========================================\n Table: dimension_teammembers \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY44");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY44");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY45="select count(user_id) from dimension_user"

printf "\n\n========================================\n Table: dimension_user \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY45");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY45");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY46="select count(CONCAT(user_notify_id, \"-\", page_id)) from dimension_user_notify_to_page"

printf "\n\n========================================\n Table: dimension_user_notify_to_page \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY46");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY46");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY47="select count(id) from dimension_user_roles"

printf "\n\n========================================\n Table: dimension_user_roles \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY47");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY47");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY48="select count(org_id) from dq_surge_20181220_delete_log"

printf "\n\n========================================\n Table: dq_surge_20181220_delete_log \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY48");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY48");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY49="select count(CONCAT(org_id, \"-\", policy_slug, \"-\", incident_id, \"-\", escalated_at)) from dq_surge_20181220_escalated_policies_backup"

printf "\n\n========================================\n Table: dq_surge_20181220_escalated_policies_backup \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY49");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY49");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY50="select count(CONCAT(org_id, \"-\", team_id, \"-\", incident_id, \"-\", escalated_at)) from dq_surge_20181220_escalated_teams_backup"

printf "\n\n========================================\n Table: dq_surge_20181220_escalated_teams_backup \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY50");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY50");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY51="select count(CONCAT(org_id, \"-\", uuid)) from dq_surge_20181220_fact_incident_alert_backup"

printf "\n\n========================================\n Table: dq_surge_20181220_fact_incident_alert_backup \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY51");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY51");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY52="select count(incident_id) from dq_surge_20181220_fact_org_incidents"

printf "\n\n========================================\n Table: dq_surge_20181220_fact_org_incidents \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY52");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY52");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY53="select count(CONCAT(org_id, \"-\", username, \"-\", incident_id, \"-\", uuid, \"-\", alert_start_time)) from dq_surge_20181220_fact_user_tts_backup"

printf "\n\n========================================\n Table: dq_surge_20181220_fact_user_tts_backup \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY53");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY53");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY54="select count(CONCAT(org_id, \"-\", event_time, \"-\", incident_id, \"-\", user_id, \"-\", type)) from dq_surge_20181220_timeline_backup"

printf "\n\n========================================\n Table: dq_surge_20181220_timeline_backup \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY54");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY54");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY55="select count(org_id) from excluded_orgs"

printf "\n\n========================================\n Table: excluded_orgs \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY55");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY55");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY56="select count(CONCAT(org_id, \"-\", uuid)) from expected_alerts_to_delete"

printf "\n\n========================================\n Table: expected_alerts_to_delete \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY56");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY56");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY57="select count(CONCAT(org_id, \"-\", uuid)) from fact_all_alerts"

printf "\n\n========================================\n Table: fact_all_alerts \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY57");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY57");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY58="select count(id) from fact_daily_user_login"

printf "\n\n========================================\n Table: fact_daily_user_login \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY58");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY58");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY59="select count(id) from fact_delay_steps"

printf "\n\n========================================\n Table: fact_delay_steps \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY59");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY59");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY60="select count(id) from fact_incident_notifies"

printf "\n\n========================================\n Table: fact_incident_notifies \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY60");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY60");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY61="select count(id) from fact_incident_pages"

printf "\n\n========================================\n Table: fact_incident_pages \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY61");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY61");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY62="select count(id) from fact_incident_routing"

printf "\n\n========================================\n Table: fact_incident_routing \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY62");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY62");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY63="select count(id) from fact_invited_users"

printf "\n\n========================================\n Table: fact_invited_users \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY63");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY63");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY64="select count(id) from fact_nps_ramen"

printf "\n\n========================================\n Table: fact_nps_ramen \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY64");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY64");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY65="select count(CONCAT(org_id, \"-\", incident_id)) from fact_org_incidents"

printf "\n\n========================================\n Table: fact_org_incidents \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY65");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY65");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY66="select count(CONCAT(org_id, \"-\", integration)) from fact_org_integrations"

printf "\n\n========================================\n Table: fact_org_integrations \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY66");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY66");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY67="select count(id) from fact_org_nps_ramen"

printf "\n\n========================================\n Table: fact_org_nps_ramen \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY67");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY67");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY68="select count(CONCAT(organization, \"-\", report, \"-\",, created_on)) from fact_org_reportsviews"

printf "\n\n========================================\n Table: fact_org_reportsviews \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY68");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY68");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY69="select count(id) from fact_route_keys"

printf "\n\n========================================\n Table: fact_route_keys \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY69");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY69");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY70="select count(id) from fact_timeline_chats"

printf "\n\n========================================\n Table: fact_timeline_chats \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY70");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY70");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY71="select count(CONCAT(org_id, \"-\", user_id, \"-\", service_time, \"-\", surfaced)) from fact_timeline_notifications"

printf "\n\n========================================\n Table: fact_timeline_notifications \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY71");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY71");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY72="select count(CONCAT(org_id, \"-\", incident_id)) from fact_ttfn"

printf "\n\n========================================\n Table: fact_ttfn \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY72");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY72");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY73="select count(CONCAT(org_id, \"-\", incident_id)) from fact_ttic"

printf "\n\n========================================\n Table: fact_ttic \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY73");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY73");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY74="select count(id) from fact_user_contact"

printf "\n\n========================================\n Table: fact_user_contact \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY74");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY74");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY75="select count(id) from fact_user_flow"

printf "\n\n========================================\n Table: fact_user_flow \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY75");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY75");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY76="select count(id) from fact_user_notify"

printf "\n\n========================================\n Table: fact_user_notify \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY76");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY76");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY77="select count(id) from fact_user_nps_ramen"

printf "\n\n========================================\n Table: fact_user_nps_ramen \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY77");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY77");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY78="select count(on_id) from fact_user_on_call"

printf "\n\n========================================\n Table: fact_user_on_call \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY78");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY78");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY79="select count(CONCAT(org_id, \"-\", username, \"-\", incident_id, \"-\", uuid, \"-\", alert_start_time)) from dq_surge_20181220_escalated_policies_backup"

printf "\n\n========================================\n Table: fact_user_tts \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY79");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY79");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY80="select count(uuid) from fact_user_uuid"

printf "\n\n========================================\n Table: fact_user_uuid \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY80");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY80");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY81="select count(uuid) from fact_user_uuid_fallout_hist"

printf "\n\n========================================\n Table: fact_user_uuid_fallout_hist \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY81");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY81");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY82="select count(uuid) from fact_user_uuid_pre_unicorn"

printf "\n\n========================================\n Table: fact_user_uuid_pre_unicorn \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY82");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY82");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY83="select count(org_id) from fact_uuid_misses_expl"

printf "\n\n========================================\n Table: fact_uuid_misses_expl \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY83");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY83");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY84="select count(created_on) from fai_stats"

printf "\n\n========================================\n Table: fai_stats \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY84");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY84");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY85="select count(id) from fia_quarantine_backup"

printf "\n\n========================================\n Table: fia_quarantine_backup \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY85");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY85");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY86="select count(uuid) from fia_stats"

printf "\n\n========================================\n Table: fia_stats \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY86");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY86");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY87="select count(incident_id) from foi_bu"

printf "\n\n========================================\n Table: foi_bu \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY87");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY87");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY88="select count(id) from foi_cnts"

printf "\n\n========================================\n Table: foi_cnts \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY88");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY88");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY89="select count(org_id) from futts_negatives"

printf "\n\n========================================\n Table: futts_negatives \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY89");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY89");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY90="select count(uuid) from fuu_bu"

printf "\n\n========================================\n Table: fuu_bu \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY90");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY90");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY91="select count(uuid) from fuu_bu2"

printf "\n\n========================================\n Table: fuu_bu2 \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY91");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY91");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY92="select count(uuid) from fuu_tts_hang"

printf "\n\n========================================\n Table: fuu_tts_hang \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY92");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY92");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY93="select count(created_at) from incident_csv_updates"

printf "\n\n========================================\n Table: incident_csv_updates \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY93");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY93");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY94="select count(CONCAT(org_id, \"-\", event_time, \"-\", incident_id, \"-\", user_id, \"-\", type)) from incident_timeline"

printf "\n\n========================================\n Table: incident_timeline \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY94");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY94");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY95="select count(type) from incident_timeline_last_insert"

printf "\n\n========================================\n Table: incident_timeline_last_insert \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY95");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY95");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY96="select count(uuid) from log_futts_org_date"

printf "\n\n========================================\n Table: log_futts_org_date \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY96");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY96");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY97="select count(org_id) from log_futts_org_date2"

printf "\n\n========================================\n Table: log_futts_org_date2 \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY97");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY97");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY98="select count(org_id) from log_futts_org_date_orig"

printf "\n\n========================================\n Table: log_futts_org_date_orig \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY98");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY98");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY99="select count(CONCAT(org_id, \"-\", month_snapshot, \"-\", year_snapshot)) from fact_incident_routing"

printf "\n\n========================================\n Table: monthly_transmogrifier_totals \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY99");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY99");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY100="select count(org_slug) from fact_incident_routing"

printf "\n\n========================================\n Table: orgs_to_delete \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY100");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY100");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY101="select count(version) from schema_version"

printf "\n\n========================================\n Table: schema_version \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY101");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY101");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY102="select count(org_id) from upd_alert_count_stats"

printf "\n\n========================================\n Table: upd_alert_count_stats \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY102");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY102");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY103="select count(CONCAT(org_id, \"-\", created_on)) from upd_route_keys_stats"

printf "\n\n========================================\n Table: upd_route_keys_stats \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY103");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY103");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY104="select count(CONCAT(org_id, \"-\", created_on)) from upd_route_keys_stats_2"

printf "\n\n========================================\n Table: upd_route_keys_stats_2 \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY104");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY104");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY105="select count(dt) from upd_route_keys_stats_3"

printf "\n\n========================================\n Table: upd_route_keys_stats_3 \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY105");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY105");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY106="select count(CONCAT(org_id, \"-\", created_on)) from upd_uuid_stats"

printf "\n\n========================================\n Table: upd_uuid_stats \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY106");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY106");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY107="select count(CONCAT(org_id, \"-\", created_on)) from upd_uuid_stats_2"

printf "\n\n========================================\n Table: upd_uuid_stats_2 \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY107");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY107");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY108="select count(org_id) from uuid_errors"

printf "\n\n========================================\n Table: uuid_errors \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY108");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY108");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

#----------------------------------------------------------------------------------------------------------------------------

QUERY109="select count(dt) from uuid_errors_summ"

printf "\n\n========================================\n Table: uuid_errors_summ \n\n *** repdb1 ***:\n"
DB1=$(mysql -h 10.10.12.34 -D vo_reports_data_warehouse -u reports -se "$QUERY109");
echo "COUNT: "$DB1
printf "\n *** repdb2 ***\n"
DB2=$(mysql -h 10.10.12.35 -D vo_reports_data_warehouse -u reports -se "$QUERY109");
echo "COUNT: "$DB2
printf "\n *** AWS - Aurora ***\n"
DB3=$(mysql -h 10.25.96.220 -D vo_reports_data_warehouse -u reports -se "$QUERY1");
echo "COUNT: "$DB3

if [[ $DB1 -ne $DB2 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb 1 and repdb2\n"
	echo Difference = $ABS_OF_DIFF

elif [[ $DB1 -ne $DB3 ]]
then
	DIFF=$(( $DB1 - $DB2 ))
	ABS_OF_DIFF=${DIFF#-}

	printf "!!!--------- DISCREPANCY FOUND ---------!!!"
	printf " Difference calculated between repdb1 and aws-aurora\n"
	echo Difference = $ABS_OF_DIFF
	
else 
	printf "\nNo difference found\n"
fi

printf "\n\n========================================\n Table: 