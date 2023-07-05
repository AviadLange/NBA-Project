SELECT team_id_home AS team_id,
    RTRIM(team_name_home, franchise) AS city,
    franchise
FROM (SELECT DISTINCT team_name_home, team_id_home,
    SPLIT_PART(team_name_home, ' ', -1) AS franchise
    FROM "game"
    WHERE team_name_home NOT LIKE 'LA%') AS splited
ORDER BY city;