SELECT g.id, g.name, g.users_count, g.permalink, COUNT(*) AS "Emails", SUM(e.total_sent) AS "Total Sent"
FROM groups g
INNER JOIN emails e ON (g.id = e.group_id)
WHERE LEFT(e.send_date,4) = 2020
AND e.status = 5
GROUP BY g.id, g.name, g.users_count, g.permalink
