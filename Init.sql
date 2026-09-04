CREATE DATABASE emp WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';

CREATE SCHEMA emp; --выполнять в БД emp

--все следующие срупты выполнять в схеме emp.emp
CREATE FUNCTION emp.lang() RETURNS text
    LANGUAGE sql STABLE
    RETURN current_setting('emp.lang'::text, true);
    
   SET default_tablespace = '';
   
  SET default_table_access_method = heap;
  
 
CREATE TABLE emp.salgrade (
    grade integer NOT NULL,
    losal integer NOT NULL,
    hisal integer NOT NULL
);


-- Очистим таблицу (осторожно!)
TRUNCATE emp.salgrade RESTART IDENTITY CASCADE;

-- Вставим  грейды
INSERT INTO emp.salgrade (grade, losal, hisal)
VALUES 
    (1, 700, 1200),
    (2, 1201, 1400),
    (3, 1401, 2000),
    (4, 2001, 3000),
    (5, 3001, 9999)
RETURNING *;
-- Посмотреть все грейды
SELECT * FROM emp.salgrade ORDER BY grade;

CREATE TABLE emp.dept (
    deptno integer NOT NULL,
    dname text NOT NULL
);


-- Очистим таблицу (осторожно!)
TRUNCATE emp.dept RESTART IDENTITY CASCADE;

-- Вставим отделы
INSERT INTO emp.dept (deptno, dname)
VALUES 
    (10, 'ACCOUNTING'),
    (40, 'OPERATIONS'),
    (20, 'RESEARCH'),
    (30, 'SALES')
RETURNING *;
-- Посмотреть все отделы
SELECT * FROM emp.dept ORDER BY deptno;



CREATE TABLE emp.emp (
    empno integer NOT NULL,
    ename text NOT null,
    job text NOT null,
    mgr integer,
    hiredate date,
    sal integer NOT NULL,
    comm integer,
    deptno integer NOT NULL
);


-- Очистим таблицу
TRUNCATE TABLE emp.emp RESTART IDENTITY CASCADE;

-- Добавим  сотрудников
INSERT INTO emp.emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES
-- Топ-менеджмент
(7839, 'KING', 'PRESIDENT', NULL, '1981-11-17', 5000, NULL, 10),

-- Менеджеры
(7698, 'BLAKE', 'MANAGER', 7839, '1981-05-01', 2850, NULL, 30),
(7782, 'CLARK', 'MANAGER', 7839, '1981-06-09', 2450, NULL, 10),
(7566, 'JOMES', 'MANAGER', 7839, '1981-04-01', 2975, NULL, 20),

-- Продавцы
(7654, 'MARTIN', 'SALESMAN', 7698, '1981-08-28', 1250, 1400, 30),
(7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', 1600, 300, 30),
(7844, 'TURNER', 'SALESMAN', 7698, '1981-09-08', 1500, 0, 30),
(7900, 'JAMES', 'CLERK', 7698, '1981-12-03', 950, NULL, 30),
(7521, 'WARD', 'SALESMAN', 7698, '1981-02-22', 1250, 500, 30),

-- Бухгалтерия
(7902, 'FORD', 'ANALYST', 7566, '1981-12-03', 3000, NULL, 20),
(736, 'SMITH', 'CLERK', 7902, '1980-12-17', 800, NULL, 20),
(7788, 'SCOTT', 'ANALYST', 7566, '1982-12-09', 3000, NULL, 20),
(7876, 'ADAMS', 'CLERK', 7788, '1983-12-12', 1100, NULL, 20),

-- HR
(7934, 'MILLER', 'CLERK', 7782, '1982-12-23', 1300, NULL, 10);


--посмотреть всех сотрудников
select * from emp.emp order by deptno;
