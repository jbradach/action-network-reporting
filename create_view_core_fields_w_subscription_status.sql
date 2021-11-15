CREATE OR REPLACE VIEW [SCHEMA].[VIEW] AS
SELECT DISTINCT us.id,
                cf.first_name,
                cf.last_name,
                cf.street,
                cf.city,
                cf.state,
                cf.zip_code,
                cf.phone,
                us.email,
                CASE
                  WHEN ss.status = 1 THEN 'Subscribed'
                  WHEN ss.status = 2 THEN 'Unsubscribed'
                  WHEN ss.status = 3 THEN 'Bouncing'
                  WHEN ss.status = 4 THEN 'Spam Complaint'
                  WHEN ss.status = 5 THEN 'Previously Bounced'
                  WHEN ss.status = 6 THEN 'Previously Complained About Spam'
                END AS "Subscription Status"
FROM pa_an.subscription_statuses ss
INNER JOIN pa_an.users us ON (ss.subscriber_id = us.id)
LEFT JOIN pa_an.core_fields cf ON (cf.user_id = us.id AND cf.owner_id = YOUR_GROUP_ID)
WHERE ss.group_id = YOUR_GROUP_ID
--  AND status = 1 /* Uncomment to select only active subscriptons */
