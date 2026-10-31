DROP PROCEDURE IF EXISTS GetBonus;


CREATE PROCEDURE GetBonus(pDeptNo IN NUMERIC, pDate IN Date) LANGUAGE plpgsql AS $$
DECLARE
    vEmp record;
    vExperience numeric;
    vBonusCode numeric;
    vPercent numeric;
    vNewSal numeric;
BEGIN
    For vEmp in
        SELECT empno, sal, hiredate
        FROM emp.emp
        WHERE deptno = pDeptNo
    Loop
        vExperience = extract(YEAR FROM AGE(pDate,vEmp.hiredate));
        
        IF vExperience < 1 THEN
            vBonusCode = 0;
        ELSIF vExperience BETWEEN 1 AND 3 THEN
            vBonusCode := 1;
        ELSIF vExperience BETWEEN 4 AND 5 THEN
            vBonusCode := 2;
        ELSIF vExperience BETWEEN 6 AND 7 THEN
            vBonusCode := 3;
        ELSIF vExperience BETWEEN 8 AND 9 THEN
            vBonusCode := 4;
        ELSE
            vBonusCode := 5;
        END IF;

        SELECT percent INTO vPercent FROM emp.bonus_ref WHERE vBonusCode = code;

        vNewSal = vEmp.sal * ((vPercent+100)/100);

                                --empno    sal+bonus  date
        INSERT INTO emp.messages (numcol1, numcol2, datecol1)
        VALUES (vEmp.empno, vNewSal, pDate);
    END LOOP;

END $$;