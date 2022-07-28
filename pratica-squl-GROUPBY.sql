--QUESTÃO 1: Utilizando uma query, obtenha a quantidade de experiências (experiences) atuais, ou seja, com “endDate” diferente de NULL.
SELECT COUNT("endDate") AS "currentExperiences"
FROM experiences;



--QUESTÃO 2: Utilizando uma query, obtenha a quantidade de graduações (educations) por usuário, incluindo o seu id.
SELECT u.id, COUNT(e."userId")
FROM educations e
JOIN users u
ON e."userId" = u.id
GROUB BY u.id
ORDER BY u.id;



--QUESTÃO 3: Utilizando uma query, obtenha a quantidade de depoimentos(testimonials) que o usuário com id 435 efetuou, incluindo o seu nome. 
SELECT u.name AS writer, COUNT(t.id) AS "testimonialCount"
FROM testimonials t
JOIN users u
ON t."writerId" = u.id
WHERE u.id = '435'
GROUP BY u.name;



--QUESTÃO 4: Utilizando uma query, obtenha o maior salário das vagas (jobs) ativas (active = true) e o nome das posições (roles) dessas vagas ordenadas de forma ascendente
SELECT MAX (salary) AS "maximumSalary", r.name
FROM jobs j
JOIN roles r
ON j."roleId" = r.id
WHERE active = 'true'
GROUP BY r.id
ORDER BY "maximumSalary";




