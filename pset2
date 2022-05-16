-- ex:1
SELECT AVG(salario) AS mediasalarial, nome_departamento AS departamento
 FROM funcionario AS f 
 INNER JOIN departamento AS d ON (f.numero_departamento = d.numero_departamento)
 GROUP BY nome_departamento;
 
 
-- ex:2
 SELECT AVG(salario) AS mediasalarial, sexo 
  FROM funcionario
  GROUP BY sexo;


-- ex:3
 SELECT CONCAT(f.primeiro_nome, ' ', f.nome_meio, ' ', f.ultimo_nome) as nome_completo, f.data_nascimento, CURDATE() as dataAtual, 
   TIMESTAMPDIFF (year, data_nascimento, CURDATE()) as idade, 
   f.salario, d.nome_departamento
   FROM  funcionario as f
   INNER JOIN departamento as d ON  (f.numero_departamento = d.numero_departamento)
	 ORDER BY nome_completo;
 
 
-- ex:4
 SELECT CONCAT(f.primeiro_nome, ' ', f.nome_meio, ' ', f.ultimo_nome) as nome_completo, f.data_nascimento, CURDATE() AS dataAtual, 
  TIMESTAMPDIFF(year, data_nascimento, CURDATE()) as idade, f.salario as salario, case
  WHEN f.salario < 35.000 then f.salario * 1.2
  WHEN f.salario >= 35.000 then f.salario * 1.15
  END AS reajuste_salario
  FROM funcionario as f
	ORDER BY nome_completo;


-- ex:5
SELECT CASE 
 WHEN d.numero_departamento = 1 THEN 'Jorge E. Brito'
 WHEN d.numero_departamento = 4 THEN 'Jennifer S. Souza'
 WHEN d.numero_departamento = 5 THEN 'Fernando T. Wong'	
 END 	AS gerente,	nome_departamento AS departamento,
 CONCAT(f.primeiro_nome,' ', f.nome_meio,' ', f.ultimo_nome) AS funcionario,salario
 FROM departamento d
INNER JOIN funcionario f ON (d.numero_departamento = f.numero_departamento)
ORDER BY nome_departamento ASC, salario DESC;


-- ex:6

SELECT CONCAT(f.primeiro_nome, ' ', f.nome_meio, ' ', f.ultimo_nome) AS nome_completo, dp.nome_departamento, d.nome_dependente, 
 d.parentesco, d.data_nascimento, CURDATE() as dataAtual, TIMESTAMPDIFF(year, d.data_nascimento, CURDATE()) AS idade_dependente, 
 case
 when d.sexo = "M" then "Masculino"
 when d.sexo = "F" then "Feminino"
 END AS  sexo
 FROM funcionario AS f
 INNER JOIN departamento AS dp ON (f.numero_departamento = dp.numero_departamento)
 INNER JOIN dependente AS d ON (f.cpf = d.cpf_funcionario);


-- ex:7

SELECT CONCAT(primeiro_nome,' ', nome_meio,' ', ultimo_nome) AS funcionario,f.numero_departamento AS departamento, salario
 FROM funcionario f 
 LEFT OUTER JOIN dependente d ON (f.cpf = d.cpf_funcionario)
 WHERE d.cpf_funcionario IS NULL
 ORDER BY funcionario ASC;


-- ex:8
 SELECT p.nome_projeto AS projeto,CONCAT(primeiro_nome,' ', nome_meio,' ', ultimo_nome)	AS funcionario, 
  SUM(horas) AS horas	
  FROM funcionario f
  INNER JOIN trabalha_em te ON (f.cpf = te.cpf_funcionario)
  INNER JOIN projeto p ON ( te.numero_projeto = p.numero_projeto)
  WHERE f.cpf = te.cpf_funcionario
  GROUP BY f.numero_departamento, p.nome_projeto, funcionario
  ORDER BY projeto;


-- ex:9
select d.nome_departamento as departamento
SUM(t.horas) as horas
from elmasri.departamento d 
inner join projeto as p on (p.numero_departamento = dp.numero_departamento)
inner join trabalha_em as t on (p.numero_projeto = t.numero_projeto)
group by d.numero_departamento, p.numero_projeto;


-- ex:10
select 
d.nome_departamento,
round(avg(f.salario)) as media_salarial
from elmasri.funcionario f 
join elmasri.departamento d on d.numero_departamento = f.numero_departamento 
group by d.numero_departamento;


-- ex:11
SELECT CONCAT(f.primeiro_nome, ' ', f.nome_meio, ' ', f.ultimo_nome) as nome_completo,p.nome_projeto, t.horas * 50 AS valor_recebido
FROM funcionario AS f 
INNER JOIN departamento AS d ON (f.numero_departamento = d.numero_departamento)
INNER JOIN trabalha_em AS t ON (f.cpf = t.cpf_funcionario)
INNER JOIN projeto AS p ON (t.numero_projeto = p.numero_projeto)
WHERE f.cpf = t.cpf_funcionario
ORDER BY nome_completo,nome_projeto;


-- ex:12
SELECT CONCAT(f.primeiro_nome, ' ', f.nome_meio, ' ', f.ultimo_nome) as nome_completo,d.nome_departamento,p.nome_projeto, t.horas = 0 AS Horas
 FROM funcionario AS f 
 INNER JOIN departamento AS d ON (f.numero_departamento = d.numero_departamento)
 INNER JOIN trabalha_em AS t ON (f.cpf = t.cpf_funcionario)
 INNER JOIN projeto AS p ON (t.numero_projeto = p.numero_projeto)
 WHERE f.cpf = t.cpf_funcionario
 ORDER BY nome_completo;


-- ex:13
SELECT CONCAT(f.primeiro_nome, ' ', f.nome_meio, ' ', f.ultimo_nome) AS nome_completo_func, CONCAT(d.nome_dependente, ' ', f.ultimo_nome) AS nome_completo_dep, 
 f.sexo AS sexo_func, d.sexo AS sexo_dep, CURDATE() AS dataAtual, TIMESTAMPDIFF(year, f.data_nascimento, CURDATE()) AS idade_func, 
 TIMESTAMPDIFF(year, d.data_nascimento, CURDATE()) AS idade_dep
 FROM funcionario AS f
 LEFT OUTER JOIN dependente AS d ON (f.cpf = d.cpf_funcionario)
 GROUP BY nome_completo_func, nome_completo_dep
 ORDER BY idade_func DESC;
 
 
-- ex:14
 SELECT d.nome_departamento, COUNT(*) AS total_funcinarios
FROM funcionario AS f
INNER JOIN departamento AS d ON ( f.numero_departamento = d.numero_departamento)
GROUP BY nome_departamento;


-- ex:15
SELECT CONCAT(primeiro_nome,' ', nome_meio,' ', ultimo_nome) AS nome, d.nome_departamento AS departamento, p.nome_projeto AS projeto
 FROM funcionario f
 INNER JOIN departamento d ON (d.numero_departamento = f.numero_departamento)
 INNER JOIN projeto p ON (p.numero_departamento = d.numero_departamento)
 ORDER BY nome ASC;
