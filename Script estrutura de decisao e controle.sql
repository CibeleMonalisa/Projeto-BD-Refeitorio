use refeitorio;

-- 7 e 8
-- estrutura de decisao e controle
-- if, ifnull, nullif, else e case
select 
case
when nome = 'Uruana' then 'Uruana-GO'
when nome = 'Ceres' then 'IF Goiano Campus Ceres'
else nome
end as 'nome'
from cidade where cidade.estado_id = 9;

-- update select cc.valor from cartao cc, usuario u where cc.usuario_id = u.id and u.cidade_id = 944

-- agr vai ser pago o refeitorio:
update cartao
set valor = case
when valor = 0 then 5 else valor end;
	
-- select para dizer se o usuario mora ou n em ceres
select u.id,u.nome,c.nome, if(c.nome = 'Ceres','Mora em Ceres', 'n') as 'Mora ou n em Ceres' from usuario u, cidade c where u.cidade_id = c.id;
-- select para dizer se paga ou n
select u.nome,p.nome,if(p.preco > 0,'Paga','Não paga') as 'Paga ou n' from usuario u, patente p where u.patente_id = p.id;
  select * from patente;

select id from cidade where nome = 'Ceres';
-- 12
-- dominio
-- create domain IFCeres as varchar(45)
-- check(id_cidade = 944);

-- alter table usuario add column ceres IFCeres
-- default 0;
alter table sexo add identidade_genero enum('Cisgênero','Transgênero','Não-binário');
-- alter table sexo drop column g;
select * from sexo;
update sexo set identidade_genero = 'Cisgênero' where id = 1;
update sexo set identidade_genero = 'Transgênero' where id = 2;
update sexo set identidade_genero = 'Não-binário' where id = 3;

-- 18
-- criacao usuario
create user externo identified by 'Conex@o';
grant select(nome,patente_id) on refeitorio.usuario to externo;