-- 코드를 입력하세요

# SOL1) MY
# SELECT  C.CAR_ID,
#         IF( ((COUNT(1) = 1) AND (C.AVAILABILITY = '대여 가능')), '대여 가능', '대여중') AS AVAILABILITY
# FROM (  SELECT B.CAR_ID, B.AVAILABILITY, COUNT(1) AS CNT 
#         FROM (  SELECT  A.*, 
#                         IF('2022-10-16' BETWEEN DATE_FORMAT(START_DATE, '%Y-%m-%d') AND DATE_FORMAT(END_DATE, '%Y-%m-%d'), 
#                            '대여중', '대여 가능') AS AVAILABILITY
#                 FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY A) B
#         GROUP BY B.CAR_ID, B.AVAILABILITY ) C
# GROUP BY C.CAR_ID
# ORDER BY C.CAR_ID DESC

# SOL2) SG
# SELECT  DISTINCT CAR_ID,
#         CASE
#             WHEN EXISTS(SELECT  *
#                         FROM    CAR_RENTAL_COMPANY_RENTAL_HISTORY B
#                         WHERE   1=1
#                         AND     A.CAR_ID = B.CAR_ID
#                         AND     '2022-10-16' BETWEEN B.START_DATE AND B.END_DATE)
#             THEN '대여중'
#             ELSE '대여 가능'
#         END AS AVAILABILITY
# FROM    CAR_RENTAL_COMPANY_RENTAL_HISTORY A
# ORDER BY CAR_ID DESC;


# SOL 3) L-cloud
select A.car_id AS CAR_ID, CASE WHEN max(A.b) = 1 THEN '대여중' ELSE '대여 가능' END as AVAILABILITY
from (select CAR_ID, CASE WHEN START_DATE <= '2022-10-16' AND '2022-10-16' <= END_DATE Then 1 else 0 END as b
from car_rental_company_rental_history
group by car_id, b) AS A
group by A.car_id
ORDER BY 1 DESC