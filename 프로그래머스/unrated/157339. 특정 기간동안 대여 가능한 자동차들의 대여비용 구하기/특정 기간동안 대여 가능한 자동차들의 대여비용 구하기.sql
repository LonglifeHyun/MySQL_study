-- 코드를 입력하세요

SELECT  D.CAR_ID, 
        D.CAR_TYPE, 
        ROUND(D.DAILY_FEE * 30 * ((100 - E.DISCOUNT_RATE) / 100)) AS FEE
FROM (  SELECT C.CAR_ID, C.CAR_TYPE, C.DAILY_FEE, MIN(C.PSBL_YN) AS RENT_PSBL_YN
        FROM (  SELECT *,
                        CASE 
                            WHEN B.START_DATE > '2022-11-30' THEN 1
                            WHEN B.END_DATE < '2022-11-01' THEN 1
                            ELSE 0
                        END AS PSBL_YN
                FROM CAR_RENTAL_COMPANY_CAR A
                JOIN CAR_RENTAL_COMPANY_RENTAL_HISTORY B USING (CAR_ID)
                WHERE 1=1
                AND (A.CAR_TYPE = '세단' OR A.CAR_TYPE = 'SUV') ) C
        GROUP BY C.CAR_ID, C.CAR_TYPE, C.DAILY_FEE ) D
JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN E USING (CAR_TYPE)
WHERE 1=1
AND D.RENT_PSBL_YN = 1
AND E.DURATION_TYPE = '30일 이상'
AND D.DAILY_FEE * 30 * ((100 - E.DISCOUNT_RATE) / 100) BETWEEN 500000 AND 1999999
ORDER BY FEE DESC, D.CAR_TYPE ASC, D.CAR_ID DESC



