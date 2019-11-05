select veh.registration
from vehicle veh, mot_test_current mtc, mot_test_current_rfr_map rfr
where veh.registration is not null
and mtc.vehicle_id = veh.id
and mtc.prs_mot_test_id is not null  -- only shows tests that do have a Pass after Rectification at Station
and mtc.id = rfr.mot_test_id
and rfr.rfr_type_id = 1 -- advisory
and mtc.mot_test_type_id = 1 -- Normal test
and mtc.completed_date > str_to_date('20/05/2018', '%d/%m/%Y') -- competed mot tests before EURW changes
limit 1