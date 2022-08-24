select *from registro;
/*
	index para permitir o acesso mais rápido na busca da data/hora de entrada de um determinado dia, mês ou ano.
*/
create index idx_entrada
on registro (entrada);

select *from registro
where entrada between '2020-09-01' and '2020-10-01';

show index from registro;

drop index idx_entrada on registro;