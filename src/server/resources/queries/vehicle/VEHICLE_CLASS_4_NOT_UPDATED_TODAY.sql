SELECT veh.registration, veh.vin, mtc.odometer_value
FROM vehicle veh, model_detail md, mot_test_current mtc
INNER JOIN (SELECT  vehicle_id, MAX(id) AS id
			FROM mot_test_current
	 	    WHERE created_on > CURRENT_DATE - INTERVAL 1 MONTH -- only current certificates can be pulled
 	   		GROUP BY vehicle_id) AS mtcId
 	  ON mtc.id = mtcId.id
WHERE veh.id = mtc.vehicle_id
AND veh.model_detail_id = md.id
AND mtc.document_id IS NOT NULL  -- exclude where there are no MOT certificates
AND md.vehicle_class_id = 4 -- cars only
AND mtc.status_id = 6 -- Passed tests only
AND odometer_result_type = 'OK'
AND veh.registration NOT LIKE "%-%" -- exclude dodgy test data on ACPT
AND veh.registration IS NOT NULL -- nullable in PP/Prod
and veh.registration NOT IN ('R3GHAU5','DVLA903','DVLA904') -- Exclude vehicles that have already been modified by automation
AND veh.vin IS NOT NULL -- nullable in PP/Prod
AND NOT EXISTS (
    SELECT 1 FROM vehicle v
    WHERE v.registration = veh.registration
    GROUP BY v.registration
    HAVING COUNT(v.registration) > 1 -- exclude where same registration has been entered as different vehicles
)
AND NOT EXISTS (
    SELECT 1 FROM vehicle v
    WHERE v.vin = veh.vin
    GROUP BY v.vin
    HAVING COUNT(v.vin) > 1 -- exclude where same vin has been entered as different vehicles
)
AND NOT EXISTS (
	SELECT 1 FROM mot_test_current mtc2
	WHERE mtc2.vehicle_id = veh.id
	AND mtc2.completed_date = CURDATE() -- exclude test completed today
	)
AND veh.last_updated_on < CURDATE() -- vehicles not updated today
limit 5