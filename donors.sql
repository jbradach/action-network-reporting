CREATE OR REPLACE VIEW an_donors AS
SELECT DISTINCT
		cf.first_name,
		cf.last_name,
		us.email,
		cf.street,
		cf.city,
		cf.state,
		cf.zip_code,
		cf.country
FROM pa_an.donations dn
INNER JOIN pa_an.donation_payments dp on (dp.donation_id = dn.id)
INNER JOIN pa_an.users us on (us.id = dn.user_id)
INNER JOIN pa_an.core_fields cf on (cf.user_id = us.id)
INNER JOIN pa_an.fundraisings fr on (fr.id = dn.fundraising_id)
WHERE cf.owner_id = YOUR_GROUP_ID
