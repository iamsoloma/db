DROP PROCEDURE IF EXISTS public.GetMaxSal;
DROP PROCEDURE IF EXISTS public.InsertMaxSal;

DROP PROCEDURE IF EXISTS public.GetMaxSal(INTEGER, NUMERIC);
DROP PROCEDURE IF EXISTS public.GetMaxSal(INTEGER, NUMERIC, TEXT);
DROP PROCEDURE IF EXISTS public.GetMaxSal(NUMERIC, NUMERIC);
DROP PROCEDURE IF EXISTS public.GetMaxSal(NUMERIC, NUMERIC, TEXT);





CREATE PROCEDURE InsertMaxSal(pDeptNo IN NUMERIC, pMaxSal IN NUMERIC) LANGUAGE plpgsql AS $$
DECLARE
    ---
BEGIN
    INSERT INTO emp.messages (numcol1, numcol2)
    VALUES (pDeptNo, pMaxSal);
END $$;

CREATE PROCEDURE GetMaxSal(pDeptNo IN NUMERIC, pMaxSal OUT NUMERIC, pPrint IN TEXT DEFAULT NULL) LANGUAGE plpgsql AS $$
DECLARE
    ---
BEGIN
    SELECT MAX(e.sal) INTO pMaxSal
    FROM emp.emp as e
    WHERE e.deptno = pDeptNo
    GROUP BY e.deptno;

    IF pPrint = 'ПЕЧАТЬ' THEN
        CALL InsertMaxSal(pDeptNo, pMaxSal);
    END IF;
END $$;