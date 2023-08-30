--This query joins the Points Data to Franchise Division.
SELECT *
FROM "Points Data" AS p
JOIN "Franchise Division" AS f
ON f.team_id = p.team_id
AND p.team_name = f.city || f.franchise;