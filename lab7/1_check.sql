DO $$
DECLARE
    vRes text;
BEGIN
    RAISE NOTICE 'Клерк с зп более 900';
    vRes = getEmpInfo(colJob => 'job', pJob => 'CLERK', pSal => 900);
    RAISE NOTICE 'Результат: %', vRes;

    RAISE NOTICE 'Клерк с зп более 1301';
    vRes = getEmpInfo(colJob => 'job', pJob => 'CLERK', pSal => 1327);
    RAISE NOTICE 'Результат: %', vRes;

    
    RAISE NOTICE 'Смотрим управленцев без зп';
    vRes = getEmpInfo(colJob => 'job', pJob => 'MANAGER');
    RAISE NOTICE 'Результат: %', vRes;
END $$;