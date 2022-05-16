-- ex:1 
select 
d.nome_departamento,
select avg(f.salario) as media_salarial, nome_departament
from funcionario as f 
join elmasri.departamento d on d.numero_departamento = f.numero_departamento 
group by nome_departamento;



--  ex:2 

select avg(salario) as mediasalarial, sexo 
from funcionario
group by sexo;


--  ex:3 

select 
CONCAT(f.nome, ' ', f.nome_meio, ' ', f.ultimo_nome) as funcionario,
f.data_nascimento,
date_part('year', age(current date, f.data_nascimento)) as idade,
f.salario 
timestampdiff(year, data_nascimento, curdate()) as idade,
from el.departamento d 
inner join el.funcionario f on f.num_departamento = d.num_departamento
order by nome_departamento;





-- ex:4

select 
(f.primeiro_nome || ' ' || f.nome_meio || '. ' || f.ultimo_nome) as funcionario,
date_part('year', age(current date, f.data_nascimento)) as idade,
salario,
case 
when salario < 35000 
then fun.salario + ((salario/100) * 20)
 else salario + ((salario/100) * 15)
end as salario
from funcionario as f;

 






-- ex:5 


select dp.nome_departament as departament, case 
when dp.numero_departament = 5 then "Julia"
end as gerente,
CONCAT(f.nome, ' ', f.nome_meio, ' ', f.ultimo_nome) as funcionario,
f.salario from funcionario as f
inner join departamento as dp on (f.numero_departamento = dp.numero_departamento)
order by dp.nome_departamento asc, f.salario desc;




--  ex:6 

select 
(f.primeiro_nome || ' ' || f.nome_meio || '. ' || f.ultimo_nome) as nome_completo,
dpt.nome_departamento,
d.nome_dependente,
date_part('year', age(current date, d.data_nascimento)) as idade_dependente,
case when d.sexo = 'M' then 'Masculino'
	else 'Feminino'
end as sexo_dependente
from elmasri.funcionario f 
join elmasri.dependente d on d.cpf_funcionario = f.cpf
join elmasri.departamento dpt on dpt.numero_departamento = f.numero_departamento;



--  ex:7


select (f.nome, ' ', f.nome_meio, ' ', f.ultimo_nome) as nome_completo
numero_departamento as departamento
from funcionario as f
left join elmasri.dependente d on d.cpf_funcionario = f.cpf 
join elmasri.departamento dpt on dpt.numero_departamento = f.numero_departamento 
where cpf_funcionario is null;





-- ex:8 

 
select CONCAT(f.nome, ' ', f.nome_meio, ' ', f.ultimo_nome) as funcionario,
t.horas, dp.nome_departamento as departamento, 
p.nome_projeto as projeto
from projeto as p
from elmasri.departamento d 
inner join departamento as dp on (p.numero_departamento = dp.numero_departamento)
inner join trabalha_em as t on (t.numero_projeto = p.numero_projeto)
inner join funcionario as f on (f.cpf = t.cpf_funcionario);




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

select 
(f.primeiro_nome || ' ' || f.nome_meio || '. ' || f.ultimo_nome) as nome_funcionario,
sum(te.horas) * 50 as horas
from elmasri.funcionario f 
join elmasri.trabalha_em te on te.cpf_funcionario = f.cpf
left join elmasri.projeto p on p.numero_projeto = te.numero_projeto
group by f.cpf, te.cpf_funcionario;

-- ex:12

select 
(f.primeiro_nome || ' ' || f.nome_meio || '. ' || f.ultimo_nome) as nome_funcionario,
p.nome_projeto,
sum(te.horas) horas
from elmasri.funcionario f 
join elmasri.trabalha_em te on te.cpf_funcionario = f.cpf
left join elmasri.projeto p on p.numero_projeto = te.numero_projeto
where te.horas is null
group by f.cpf, te.cpf_funcionario, p.numero_projeto;

-- ex:13 
select concat(f.primeiro_nome, ' ', f.nome_meio, ' ', f.ultimo_nome) as nome_completo_func, CONCAT(d.nome_dependente, ' ', f.ultimo_nome) AS nome_completo_dep, 
 f.sexo AS sexo_func, d.sexo as sexo_dep, CURDATE() as dataAtual, timestampdiff(year, f.data_nascimento, CURDATE()) AS idade_func, 
 timestampdiff(year, d.data_nascimento, CURDATE()) as idade_dep
 from funcionario as f
 left outer join dependente as d on (f.cpf = d.cpf_funcionario)
 group by nome_completo_func, nome_completo_dep
 order by idade_func desc;


-- ex:14
select dp.nome_departamento as departamento, 
COUNT(cpf) as quantidade_funcionarios
from funcionario as f
inner join departamento as dp on (f.numero_departamento = dp.numero_departamento)
group by nome_departamento;


-- ex:15 
select CONCAT(f.nome, ' ', f.nome_meio, ' ', f.ultimo_nome) as funcionario, 
dp.nome_departamento as departamento,
p.nome_projeto as projeto
from funcionario as f
inner join departamento as dp on (f.numero_departamento = dp.numero_departamento)
left outer join projeto as p on (p.numero_departamento = dp.numero_departamento)
inner join trabalha_em as t on (f.cpf = t.cpf_funcionario)
group by funcionario, nome_projeto
order by nome_projeto;