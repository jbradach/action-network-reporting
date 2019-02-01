SELECT us.email,
       us.zip_code
FROM pa_an.subscription_statuses ss
INNER JOIN pa_an.users us ON (ss.subscriber_id = us.id)
WHERE ss.group_id = YOUR_GROUP_ID
  AND status = 1
