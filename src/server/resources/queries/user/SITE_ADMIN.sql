select p.username as username, s.name as site_name, s.site_number as site_number,
  s.default_brake_test_class_1_and_2_id as group_a_brake_default,
  s.default_service_brake_test_class_3_and_above_id as group_b_service_brake_default,
  s.default_parking_brake_test_class_3_and_above_id as group_b_parking_brake_default
from site s, person p, site_business_role_map sbrm, person_security_card_map pscm, security_card sc
where s.id = sbrm.site_id
and sbrm.person_id = p.id
and sbrm.site_business_role_id = 3 -- site admin
and sbrm.status_id = 1 -- site admin role accepted
and p.username is not null -- exclude dodgy test data
and s.site_status_id = 1 -- site is approved
and exists (
  select 1 from auth_for_testing_mot_at_site auth_a
  where auth_a.site_id = s.id
  and auth_a.status_id = 2 -- approved
  and auth_a.vehicle_class_id in (1, 2) -- site approved for at least one group A class
)
and exists (
  select 1 from auth_for_testing_mot_at_site auth_b
  where auth_b.site_id = s.id
  and auth_b.status_id = 2 -- approved
  and auth_b.vehicle_class_id in (3, 4, 5, 7) -- site approved for at least one group B class
)
and p.id = pscm.person_id
and sc.id = pscm.security_card_id
and sc.security_card_status_lookup_id = 1 -- only assigned cards
and not exists ( -- not all security_card have a corresponding security_card_drift
  select 1 from security_card_drift scd
  where sc.id = scd.security_card_id
  and (scd.last_observed_drift > 60 or scd.last_observed_drift < -60) -- no drift beyond +/-2
)
limit 10