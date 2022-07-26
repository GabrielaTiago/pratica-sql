SELECT users.id, users.name, cities.name AS city FROM users
JOIN cities ON cities.id = users."cityId"
WHERE cities.name = 'Rio de Janeiro'



SELECT t.id, t."writerId" AS writer, t."recipientId" AS recipient, t.message
FROM testimonials t
JOIN users u ON t."writerId" = u.id AND t."recipientId" = u.id


SELECT u.id, u.name, c.name AS course, s.name AS school, e."endDate" 
FROM courses c
JOIN educations e ON e."courseId" = c.id
JOIN schools s ON s.id = e."schoolId"
JOIN users u ON u.id = e."userId"
WHERE u.id = '30' AND e.status = 'finished'


SELECT u.id, u.name, r.name AS role, c.name AS company, e."startDate" as startDate
FROM companies c
JOIN experiences e ON c.id = e."companyId"
JOIN roles r ON e."roleId" = r.id
JOIN users u ON e."userId" = u.id
WHERE e."endDate" IS NULL AND u.id = '50'


