SELECT
	  A.nome AS artista,
	  AL.nome AS album,
  COUNT(UA.artist_id) AS seguidores
  FROM SpotifyClone.albuns AS AL
  INNER JOIN SpotifyClone.artist AS A ON AL.artist_id = A.artist_id
  INNER JOIN SpotifyClone.user_artist AS UA ON AL.artist_id = UA.artist_id
  GROUP BY AL.album_id
  ORDER BY seguidores DESC, artista, album;
      