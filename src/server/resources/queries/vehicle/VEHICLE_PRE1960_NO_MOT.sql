select v.registration
from vehicle v
inner join dvla_vehicle as dv on v.id = dv.vehicle_id
where dv.first_registration_date < "1960-01-01"
and not exists (
    select 1
    from mot_test_current m
    where m.vehicle_id = v.id and m.status_id = 6
)
limit 5;