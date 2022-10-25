SELECT U.nome AS usuario, COUNT(*) AS qt_de_musicas_ouvidas, ROUND(SUM(S.duration) / 60, 2) AS total_minutos
FROM SpotifyClone.users AS U
INNER JOIN SpotifyClone.historic AS H ON U.user_id = H.user_id
INNER JOIN SpotifyClone.songs AS S ON H.song_id = S.song_id
GROUP BY U.nome
ORDER BY U.nome ASC;