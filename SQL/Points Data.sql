--This query sums the total points per franchise.
SELECT team_id_home AS team_id,
    team_name_home AS team_name,
    SUM(pts_home)+total_away AS total_pts,
    ROUND(((SUM(pts_home)+total_away)/seasons),2) AS avg_per_season
FROM "game"
INNER JOIN
    (SELECT CASE
            WHEN team_name_away = 'LA Clippers' 
            THEN 'Los Angeles Clippers'
            ELSE team_name_away
            END AS team_away,
        SUM(pts_away) AS total_away
    FROM "game"
    GROUP BY team_away) AS away_record
ON away_record.team_away = game.team_name_home
JOIN
    (SELECT team_name_home, COUNT(DISTINCT season_id) AS seasons
    FROM "game"
    GROUP BY team_name_home) AS seasons_active
USING(team_name_home)
GROUP BY team_name_home, team_id_home, total_away, seasons
ORDER BY total_pts DESC;