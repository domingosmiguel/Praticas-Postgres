-- Utilizando uma query, obtenha a lista das diferentes escolas (`schools`) e cursos (`courses`) onde estudaram as pessoas que estão aplicando pra posição de **“Software Engineer”** na empresa com id **10**. Só devem ser consideradas as vagas que estiverem ativas, ou seja, quando o campo `active` da tabela `jobs` estiver **true**.

-- A resposta deve vir no formato:

-- ```
-- |---id---|---school---|--------course--------|----company----|--------role-------|
--     1        Driven       Software Engineer        OLX         Software Engineer
--     2        Unicamp      Computer Science         OLX         Software Engineer
--    ...        ...               ...                 ...              ...
-- ```

-- **OBS:** a coluna `id` se refere ao id da escola

SELECT schools.id, schools.name, courses.name AS course, companies.name AS company, roles.name AS role
  FROM jobs
  JOIN companies ON jobs."companyId"=companies.id
  JOIN roles ON jobs."roleId"=roles.id
  JOIN applicants ON jobs.id=applicants."jobId"
  JOIN users ON applicants."userId"=users.id
  JOIN educations ON users.id=educations."userId"
  JOIN schools ON educations."schoolId"=schools.id
  JOIN courses ON educations."courseId"=courses.id
 WHERE companies.id=10
   AND roles.name='Software Engineer'
   AND jobs.active;