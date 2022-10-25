SELECT S.nome AS cancao, COUNT(*) AS reproducoes
FROM SpotifyClone.songs AS S
INNER JOIN SpotifyClone.historic AS H ON S.song_id = H.song_id
GROUP BY S.nome
ORDER BY reproducoes DESC, S.nome ASC LIMIT 2;