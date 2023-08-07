-- 코드를 입력하세요
SELECT MCDP_CD AS '진료과코드', COUNT(*) AS '5월예약건수'
FROM APPOINTMENT 
WHERE DATE_FORMAT(APNT_YMD, '%Y-%m') = '2022-05'
GROUP BY MCDP_CD
-- HAVING DATE_FORMAT(APNT_YMD, '%Y-%m') = '2022-05'
ORDER BY COUNT(*), MCDP_CD
