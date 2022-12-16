-- Utilizando 1 query, obtenha o maior salário das vagas (`jobs`) ativas (**active** sendo true) e o nome das posições (`roles`) dessas vagas ordenadas de forma ascendente

-- A resposta deve vir no formato:

-- ```
-- |---maximumSalary---|-------------role--------------|
-- 				107981	          Junior Software Engineer
-- 				153208	          Front-end developer
-- 				165869	          Senior Software Engineer
-- 				183405	          Software Engineer
-- 				201025	          Data Analyst
-- 				215640	          QA Analyst
-- 				230539	          Back-end developer
-- 				246764	          Scrum Master
--          ...                     ...
-- ```

-- **Dica:** Podemos ordernar uma busca pelo valor de uma função agregadora usando o alias que demos a ela

  SELECT MAX(j.salary) AS "maximumSalary", r.name AS role
    FROM jobs j
    JOIN roles r ON j."roleId" = r.id
GROUP BY r.id
ORDER BY "maximumSalary";