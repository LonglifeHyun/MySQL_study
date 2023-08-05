-- 코드를 입력하세요
# SELECT ANIMAL_ID, NAME
# FROM ANIMAL_INS 
# WHERE 1=1
# AND NAME IN (SELECT B.NAME
#               FROM ANIMAL_INS B
#               WHERE UPPER(B.NAME) LIKE '%EL%' )
# AND ANIMAL_TYPE = 'Dog'
# ORDER BY NAME
# ;

SELECT ANIMAL_ID, NAME
FROM ANIMAL_INS
WHERE NAME LIKE '%EL%'
AND ANIMAL_TYPE = 'Dog'
ORDER BY NAME;