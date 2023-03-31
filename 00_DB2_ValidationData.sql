--data load validation

select 'DEPARTMENT' AS tablename,COUNT(1) from DEPARTMENT union
select 'EMPLOYEE' AS tablename,COUNT(1) from EMPLOYEE union
SELECT 'EMP_PHOTO' AS tablename,COUNT(1) FROM EMP_PHOTO union
select 'EMP_RESUME' AS tablename,COUNT(1) from EMP_RESUME union
select 'PROJECT' AS tablename,COUNT(1) FROM PROJECT union
select 'PROJACT' AS tablename,COUNT(1) from PROJACT union
select 'EMPPROJACT' AS tablename,COUNT(1) from EMPPROJACT union
select 'ACT' AS tablename,COUNT(1) from ACT;
