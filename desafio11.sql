SELECT
	  S1.nome AS nome_musica,
      CASE 
		WHEN S2.nome LIKE '%bard%' THEN REPLACE(S2.nome, 'Bard', 'QA')
        WHEN S2.nome LIKE '%Amar%' THEN REPLACE(S2.nome, 'Amar', 'Code Review')
        WHEN S2.nome LIKE '%Pais%' THEN REPLACE(S2.nome, 'Pais', 'Pull Requests')
        WHEN S2.nome LIKE '%SOUL%' THEN REPLACE(S2.nome, 'SOUL', 'CODE')
        WHEN S2.nome LIKE '%SUPERSTAR%' THEN REPLACE(S2.nome, 'SUPERSTAR', 'SUPERDEV')
        END AS novo_nome
	FROM SpotifyClone.songs AS S1
    INNER JOIN SpotifyClone.songs AS S2 ON S1.song_id =S2.song_id
    GROUP BY S1.song_id HAVING novo_nome IS NOT NULL
    ORDER BY nome_musica DESC;