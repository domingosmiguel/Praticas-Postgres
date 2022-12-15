-- Utilizando uma query, obtenha todos os depoimentos (`testimonials`) cadastrados, incluindo o nome do remetente e do destinatário.

-- A resposta deve vir no formato:

-- ```
-- |---id---|---writer---|---recipient---|--------------message------------------|
--     1        João           Maria         Foi ótimo trabalhar com a Maria...
--     2        Maria          João           Adorei trabalhar com o João...
--    ...        ...            ...                     ...
-- ```

-- **OBS:** a coluna `id` se refere ao id do depoimento

SELECT testimonials.id, t1.name AS writer, t2.name AS recipient, testimonials.message
  FROM testimonials
  JOIN users t1 ON testimonials."writerId"=t1.id
  JOIN users t2 ON testimonials."recipientId"=t2.id;