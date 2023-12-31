-- 코드를 입력하세요
SELECT DATE_FORMAT(A.SALES_DATE,'%Y') AS YEAR,
       DATE_FORMAT(A.SALES_DATE,'%c')+0 AS MONTH,
       B.GENDER,
       COUNT(DISTINCT(USER_ID)) AS USERS
FROM ONLINE_SALE A
JOIN USER_INFO B USING (USER_ID)
WHERE 1=1
AND B.GENDER IS NOT NULL
GROUP BY YEAR, MONTH, B.GENDER
ORDER BY YEAR, MONTH, B.GENDER