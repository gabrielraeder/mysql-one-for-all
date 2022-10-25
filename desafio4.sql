SELECT U.nome AS usuario, IF (MAX(YEAR(H.play_date)) < 2021, 'Usuário inativo', 'Usuário ativo') AS status_usuario
FROM SpotifyClone.users AS U
INNER JOIN SpotifyClone.historic AS H ON U.user_id = H.user_id
GROUP BY U.nome
ORDER BY U.nome ASC;