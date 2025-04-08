SELECT * FROM countries
WHERE (continent = 'South America') AND
      (substring(currency,1,1) = 'P' OR
       substring(currency,1,1) = 'U')
ORDER BY currency DESC, id