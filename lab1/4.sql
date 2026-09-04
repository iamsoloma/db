DO $$
DECLARE
    vDate constant date = CURRENT_DATE;
    vYear Integer;
    vDay VARCHAR(10);
BEGIN
    vYear = EXTRACT(YEAR FROM vDate);
    vDay = TO_CHAR(TO_DATE('01.01.'||vYear, 'DD.MM.YYYY'), 'Day');
    RAISE NOTICE 'В % году 1 января был(а) %', vYear, vDay;
END;
$$;
