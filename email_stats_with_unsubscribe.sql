SELECT gr.name AS "group",
       em.send_date AS "send date",
       em.subject AS "subject",
       em.from AS "from name",
       em.total_sent AS "total sent",
       em.actions_count AS "actions count",
       json_extract_path_text(em.stats, 'open') AS "opens",
       json_extract_path_text(em.stats, 'click') AS "clicks",
/*       json_extract_path_text(em.stats, 'unsub') AS "unsubscribes", */ -- There is no aggregate unsubscribe stat
       json_extract_path_text(em.stats, 'spam') AS "spam complaints",
       json_extract_path_text(em.stats, 'bounce') AS "bounces",
       sum(us.processed) AS "unsubscribes"
FROM pa_an.emails em
INNER JOIN pa_an.groups gr ON (gr.id = em.group_id)
LEFT JOIN pa_an.unsubscriptions us ON (em.id = us.email_id and gr.id = em.group_id)
WHERE em.status = 5
AND gr.id = 90210 -- Your Group ID
AND em.subject LIKE '%SQL Jokes%' -- Optionally narrow by subject
GROUP BY gr.name, em.send_date, gr.name, em.subject, em.from, em.total_sent, em.actions_count, json_extract_path_text(em.stats, 'open'), json_extract_path_text(em.stats, 'click'), json_extract_path_text(em.stats, 'spam'), json_extract_path_text(em.stats, 'bounce')
