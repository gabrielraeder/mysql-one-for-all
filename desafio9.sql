SELECT
	  COUNT(*) AS quantidade_musicas_no_historico
	FROM SpotifyClone.historic AS H
	INNER JOIN SpotifyClone.users AS U ON H.user_id = U.user_id
  WHERE U.nome = 'Barbara Liskov'
	GROUP BY H.user_id;