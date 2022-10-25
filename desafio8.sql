SELECT
	  A.nome AS artista,
	  AL.nome AS album
	FROM SpotifyClone.albuns AS AL
	INNER JOIN SpotifyClone.artist AS A ON AL.artist_id = A.artist_id
	GROUP BY AL.album_id HAVING artista = 'Elis Regina'
	ORDER BY artista, album;