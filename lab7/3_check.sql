DO $$
BEGIN
    RAISE NOTICE '======Без зарплатного диапозона======';
    CALL dept_report(false);
    
    RAISE NOTICE '======С зарплатным диапозоном======';
    CALL dept_report(true);
END $$;