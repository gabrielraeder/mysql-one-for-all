SELECT 
	  CONCAT(MIN(P.valor_plano), '.00') AS faturamento_minimo,
    CONVERT(MAX(P.valor_plano), CHAR) AS faturamento_maximo,
    CONVERT(ROUND(AVG(P.valor_plano), 2), CHAR) AS faturamento_medio,
    CONVERT(ROUND(SUM(P.valor_plano), 2), CHAR) AS faturamento_total
FROM SpotifyClone.users AS U
INNER JOIN SpotifyClone.plans AS P ON U.plan_id = P.plan_id;