-- =====================================================================
-- DESAFIO 03 - Consultas de verificação e a junção colaborador x gerente
-- Rodar no Workbench depois do 01_script_azure_company.sql
-- =====================================================================
USE azure_company;

-- [3] Nulos por coluna relevante
SELECT
  SUM(Minit IS NULL)     AS minit_nulos,
  SUM(Bdate IS NULL)     AS bdate_nulos,
  SUM(Address IS NULL)   AS address_nulos,
  SUM(Salary IS NULL)    AS salary_nulos,
  SUM(Super_ssn IS NULL) AS super_ssn_nulos
FROM employee;

-- [4] Colaboradores sem gerente (Super_ssn nulo)
SELECT Ssn, CONCAT(Fname, ' ', Lname) AS Colaborador, Dno
FROM employee
WHERE Super_ssn IS NULL;

-- [5] Departamentos sem gerente ou com gerente inexistente
SELECT d.Dnumber, d.Dname, d.Mgr_ssn
FROM departament d
LEFT JOIN employee e ON e.Ssn = d.Mgr_ssn
WHERE d.Mgr_ssn IS NULL OR e.Ssn IS NULL;

-- [5b] Departamentos citados em employee.Dno que não existem em departament
SELECT DISTINCT e.Dno
FROM employee e
LEFT JOIN departament d ON d.Dnumber = e.Dno
WHERE d.Dnumber IS NULL;

-- [7] Horas por projeto e lançamentos com 0 hora
SELECT p.Pname, SUM(w.Hours) AS total_horas, COUNT(*) AS colaboradores
FROM project p
LEFT JOIN works_on w ON w.Pno = p.Pnumber
GROUP BY p.Pname
ORDER BY total_horas DESC;

SELECT * FROM works_on WHERE Hours = 0;

-- [8] Endereços com número de partes diferente de 4 (número-rua-cidade-estado)
SELECT Ssn, Address,
       (LENGTH(Address) - LENGTH(REPLACE(Address, '-', '')) + 1) AS partes
FROM employee
HAVING partes <> 4;

-- [11] Junção colaborador x gerente (consulta usada no README)
SELECT
  e.Ssn                              AS Ssn,
  CONCAT(e.Fname, ' ', e.Lname)      AS Colaborador,
  e.Super_ssn                        AS Ssn_Gerente,
  CONCAT(g.Fname, ' ', g.Lname)      AS Gerente
FROM employee e
LEFT JOIN employee g ON g.Ssn = e.Super_ssn
ORDER BY Gerente, Colaborador;

-- [15] Quantidade de colaboradores por gerente
SELECT CONCAT(g.Fname, ' ', g.Lname) AS Gerente, COUNT(*) AS Qtd_Colaboradores
FROM employee e
JOIN employee g ON g.Ssn = e.Super_ssn
GROUP BY Gerente
ORDER BY Qtd_Colaboradores DESC;
