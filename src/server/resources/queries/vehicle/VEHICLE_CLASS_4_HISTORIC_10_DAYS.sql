SELECT
       veh.registration,
       veh.vin,
       mtc.odometer_value,
       mtc.number AS number
  FROM vehicle veh
  JOIN mot_test_current mtc ON mtc.vehicle_id = veh.id
  JOIN model_detail md ON md.id = veh.model_detail_id
  JOIN (SELECT MAX(submitted_date) AS max_date,
               vehicle_id
          FROM mot_test_current
         GROUP BY vehicle_id
       LIMIT 5000) as lmot -- Latest MOT
    ON lmot.max_date = mtc.submitted_date AND lmot.vehicle_id = mtc.vehicle_id
 WHERE md.vehicle_class_id = 4 -- cars only
   AND mtc.status_id not in (4,5) -- exclude vehicles whose latest status is under test or failed
   AND mtc.mot_test_type_id = 1 -- Normal MOT test
   AND mtc.odometer_result_type = 'OK'
   AND mtc.odometer_value < 994999
   AND mtc.status_id = 6 -- Passed MOT tests
   AND veh.vin IS NOT NULL
   AND veh.registration NOT IN ('R3GHAU5', 'R3GHA01', 'R3GHDVL5', 'DVLA903') -- Exclude vehicles that have already been modified by automation
   AND veh.registration NOT LIKE '%-%' -- exclude dodgy test data on ACPT
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
and DATE(mtc.issued_date) < date_sub(CURDATE(), INTERVAL 14 DAY) -- Oldest certificate older than 10 days
and DATE(mtc.issued_date) > date_sub(CURDATE(), INTERVAL 4 YEAR) -- Testers can only see 4 years worth
AND DATE(mtc.issued_date) != CURDATE()
ORDER BY RAND()
limit 50