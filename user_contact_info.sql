SELECT DISTINCT us.id,
                cf.first_name,
                cf.last_name,
                cf.street,
                cf.city,
                cf.state,
                cf.zip_code,
                us.email
FROM pa_an.users us
LEFT JOIN pa_an.core_fields cf ON (cf.user_id = us.id AND cf.owner_id = YOUR_GROUP_ID)
