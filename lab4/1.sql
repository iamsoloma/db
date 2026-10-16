DO $$
DECLARE
    vCounter numeric := 0;
BEGIN
    LOOP
        vCounter = vCounter + 1;

        IF vCounter = 6 or vCounter = 8 THEN
            CONTINUE;
        END IF;

        INSERT INTO emp.messages(numcol1) VALUES(vCounter);

        EXIT WHEN vCounter = 10;
    END LOOP;
END $$;
