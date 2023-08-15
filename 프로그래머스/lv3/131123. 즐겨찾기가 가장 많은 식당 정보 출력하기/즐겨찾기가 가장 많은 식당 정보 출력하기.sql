-- 코드를 입력하세요
# SELECT FOOD_TYPE, REST_ID, REST_NAME, FAVORITES
# FROM REST_INFO
# WHERE CONCAT(FOOD_TYPE, FAVORITES) IN ( SELECT CONCAT( A.FOOD_TYPE, MAX(A.FAVORITES))
#                     FROM REST_INFO A
#                     GROUP BY A.FOOD_TYPE)
# ORDER BY FOOD_TYPE DESC
-- 스시사카우스


                                
SELECT FOOD_TYPE, REST_ID, REST_NAME, FAVORITES
FROM REST_INFO
WHERE (FOOD_TYPE, FAVORITES) IN ( SELECT A.FOOD_TYPE, MAX(A.FAVORITES)
                                FROM REST_INFO A
                                GROUP BY A.FOOD_TYPE)
ORDER BY FOOD_TYPE DESC