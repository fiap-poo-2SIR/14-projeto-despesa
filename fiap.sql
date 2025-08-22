-- apagando as tabelas
drop table java_despesa;
drop table java_categoria;

-- criação das sequences
create sequence seqc start with 1 increment by 1;
create sequence seqd start with 100 increment by 1;

create table java_categoria (
    id_categoria number,
    categoria varchar2(50),
    primary key (id_categoria)
);

create table java_despesa (
    id_despesa number,
    descricao varchar2(100),
    valor number(10,2),
    data date,
    id_categoria number,
    primary key (id_despesa),
    foreign key (id_categoria) REFERENCES java_categoria (id_categoria)
    on delete cascade
);

-- inserção na tabela java_categoria
insert into java_categoria values (seqc.nextval, 'moradia');
insert into java_categoria values (seqc.nextval, 'alimentação');
commit;
select * from java_categoria;

-- inserção na tabela java_despesa
insert into java_despesa values (seqd.nextval, 'festa na fiap', 1500, 
    to_date('21/08/2025', 'dd/MM/yyyy'), 1);
    
insert into java_despesa values (seqd.nextval, 'aluguel', 1500, 
    to_date('21/08/2025', 'dd/MM/yyyy'), 2);

--delete from java_categoria where id_categoria = 2;
rollback;
commit;

update java_categoria set categoria = 'xyz' where id_categoria = 1;

select d.descricao, d.valor, d.data, c.categoria
from java_despesa d
inner join java_categoria c
on d.id_categoria = c.id_categoria;

select * from java_despesa;