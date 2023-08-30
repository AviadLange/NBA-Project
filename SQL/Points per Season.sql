--This query calculates the sum of points for each team per season.
SELECT game.season_id, team_name_home AS team_name,
    COUNT(*) + away_games AS num_of_games,
    SUM(pts_home) + total_away AS total_pts
FROM "game"
INNER JOIN
    (SELECT season_id, team_name_away,
    COUNT(*) AS away_games,
    SUM(pts_away) AS total_away
    FROM "game"
    GROUP BY season_id, team_name_away) AS away_record
ON away_record.season_id = game.season_id
AND away_record.team_name_away = game.team_name_home
GROUP BY game.season_id, team_name_home, away_games, total_away
ORDER BY season_id