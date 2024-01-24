-- Comandos SQL Intermedários

-- Como recuperar valores Usando AND e OR?

SELECT ename nome, job função, sal salario
FROM emp
WHERE sal < 2000 AND hiredate NOT LIKE '______81';

SELECT ename nome, job função, hiredate data_contratação
FROM emp
WHERE deptno = 10 OR deptno = 20; 

-- Outra opção para OR
SELECT ename nome, job função, hiredate data_contratação
FROM emp
WHERE deptno IN (10,20); 

-- Como recuperar valores usando wildcards('coringas como '%' ou '_') ?

SELECT first_name nome, last_name sobrenome, phone_number telefone
FROM employees
WHERE phone_number LIKE '515%';

SELECT first_name nome, last_name sobrenome, phone_number telefone
FROM employees
WHERE phone_number LIKE '____44%';

SELECT first_name nome, last_name sobrenome, phone_number telefone
FROM employees
WHERE phone_number LIKE '%9';

SELECT first_name nome, last_name sobrenome, phone_number telefone
FROM employees
WHERE phone_number LIKE '%123__2%';

-- Como filtrar em valores que estão agrupados?

SELECT job nome, COUNT(empno) num_funcionário
FROM emp
GROUP BY job
HAVING COUNT(empno) > 2;

SELECT job_id função, AVG(salary) media_funcionário
FROM employees
GROUP BY job_id
HAVING AVG(salary) <= 5000;

-- Como checar se os valores de uma determinada tabela, corresponde a uma segunda tabela?

SELECT a.street_address endereço, a.city cidade
FROM locations a
WHERE EXISTS (SELECT * FROM countries b WHERE a.country_id = b.country_id);

SELECT a.first_name nome, a.job_id função, a.phone_number telefone
FROM employees a
WHERE NOT EXISTS (SELECT * FROM job_history b WHERE a.department_id = b.department_id);

-- Como juntar os valores de tabelas diferentes?

SELECT DISTINCT a.first_name nome, a.last_name sobrenome, a.job_id função
FROM employees a
INNER JOIN job_history b
ON a.department_id = b.department_id;

SELECT DISTINCT a.first_name nome, a.last_name sobrenome, a.job_id função
FROM employees a
LEFT JOIN job_history b
ON a.department_id = b.department_id;

-- Como atualizar valores de uma tabela?

UPDATE employees
SET department_id = (SELECT department_id 
                     FROM employees 
                     WHERE employee_id = 130)
WHERE job_id      = (SELECT job_id
                     FROM employees
                     WHERE employee_id = 114);

UPDATE emp
SET job = 'Manager'
WHERE empno = 7654;

-- Como criar views?

CREATE VIEW contato AS
(SELECT email, phone_number FROM employees);

CREATE VIEW media_salario AS
(SELECT AVG(salary) FROM employees);

CREATE VIEW novos_funcionarios AS
SELECT e.employee_id, e.first_name, salary, hire_date
FROM employees e
WHERE hire_date > date '2015-01-01';





                     
                     


