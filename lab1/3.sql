DO $$
DECLARE
    vDate date = CURRENT_DATE;
    vStroke CHAR(10);
BEGIN
    vStroke = TO_CHAR(vDate, 'Day');
    RAISE NOTICE 'The result is %', vStroke;
END;
$$;
