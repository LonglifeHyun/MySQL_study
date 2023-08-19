-- 코드를 입력하세요

SELECT  C.CAR_ID,
        IF( ((COUNT(1) = 1) AND (C.AVAILABILITY = '대여 가능')), '대여 가능', '대여중') AS AVAILABILITY
FROM (  SELECT B.CAR_ID, B.AVAILABILITY, COUNT(1) AS CNT 
        FROM (  SELECT  A.*, 
                        IF('2022-10-16' BETWEEN DATE_FORMAT(START_DATE, '%Y-%m-%d') AND DATE_FORMAT(END_DATE, '%Y-%m-%d'), 
                           '대여중', '대여 가능') AS AVAILABILITY
                FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY A) B
        GROUP BY B.CAR_ID, B.AVAILABILITY ) C
GROUP BY C.CAR_ID
ORDER BY C.CAR_ID DESC
