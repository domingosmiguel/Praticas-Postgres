-- Utilizando uma query, obtenha todos os usuários (`users`) que vivem na cidade (`cities`) cujo nome seja “**Rio de Janeiro**”.

-- A resposta deve vir no formato:

-- ```
-- |---id---|---name---|-------city-------|
--     1        João      Rio de Janeiro
--     2        Maria     Rio de Janeiro
--    ...        ...            ...
-- ```

-- **OBS:** a coluna `id` se refere ao id do usuário

SELECT users.id, users.name, cities.name AS city 
  FROM users
  JOIN cities ON users."cityId"=cities.id
 WHERE cities.name='Rio de Janeiro';