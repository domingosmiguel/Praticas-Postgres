-- Utilizando 1 query, obtenha a quantidade de experiencias (`experiences`) atuais, ou seja, com `“endDate”` diferente de `NULL`.

-- A resposta deve vir no formato:

-- ```
-- |---currentExperiences---|
-- 					80
-- 			   ....      
-- ```

SELECT COUNT("endDate") AS "currentExperiences" FROM experiences;