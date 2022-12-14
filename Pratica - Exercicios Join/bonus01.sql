SELECT schools.id, 
schools.name AS school, 
courses.name AS course,
companies.name AS company, 
roles.name AS role 
FROM users 
JOIN applicants ON users.id=applicants."userId" 
JOIN jobs ON applicants."jobId"=jobs.id 
JOIN companies ON jobs."companyId"=companies.id 
JOIN roles ON jobs."roleId"=roles.id 
JOIN educations ON users.id=educations."userId"
JOIN schools ON educations."schoolId"=schools.id
JOIN courses ON educations."courseId"=courses.id
WHERE companies.id=10
AND roles.name='Software Engineer'
AND jobs.active='true';