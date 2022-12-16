-- Utilizando 1 query, obtenha os **3** cursos (`courses`) e escolas (`schools`) com a **maior** quantidade de alunos (`educations`) que estão cursando (status **ongoing)** ou finalizaram (status **finished**) 

-- A resposta deve vir no formato:

-- ```
-- |-----------------school-----------------|-----course------|----studentsCount----|-----status------|
--          Universidad de Los Andes	           Linguistics	           7	               ongoing
--     Universitas Slamet Riyadi Surakarta  	   Psychology     	       6	               finished
--        American International College	       Philosophy	             4	               ongoing
-- ```

-- **Dica**: A ordem dos comandos é `SELECT` → `FROM` → `JOIN` → `WHERE` → `GROUP BY` → `ORDER BY` → `LIMIT`

-- **Dica:** Podemos dar group by em mais de uma coluna por vez, basta separá-las por virgula

  SELECT s.name AS school, c.name AS course, COUNT(e."userId") AS "studentsCount", e.status
    FROM educations e
    JOIN schools s ON e."schoolId" = s.id
    JOIN courses c ON e."courseId" = c.id
   WHERE e.status = 'ongoing' OR e.status = 'finished'
GROUP BY s.name, c.name, e.status
ORDER BY "studentsCount" DESC
   LIMIT 3;