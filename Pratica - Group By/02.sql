SELECT "userId" AS id, COUNT("userId") AS educations FROM educations GROUP BY id ORDER BY educations DESC;