--This query sums the deficit for each finals serie.
SELECT finals_deficit.Year, winners, losers, SUM(deficit) AS sum_deficit
FROM
(SELECT c.year,
 c.team AS winners,
 r.team AS losers,
 c.pts-r.pts AS deficit
FROM championsdata AS c
INNER JOIN runnerupsdata AS r
ON c.Year=r.year
AND c.game=r.game) AS finals_deficit
INNER JOIN NBAFinalsandMVP
ON finals_deficit.year = NBAFinalsandMVP.year
WHERE result = '4–3'
GROUP BY finals_deficit.Year
ORDER BY sum_deficit;