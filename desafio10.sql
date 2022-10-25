SELECT
	  S.nome AS nome,
      COUNT(*) AS reproducoes
	FROM SpotifyClone.songs AS S
	INNER JOIN SpotifyClone.historic AS H ON S.song_id = H.song_id
    INNER JOIN SpotifyClone.users AS U ON H.user_id = U.user_id
    WHERE U.plan_id IN (1, 4)
    GROUP BY S.song_id
    ORDER BY nome;