-- Atividade referente ao Workshop: ETL ao DW

-- Tratamento dos dados st_customers

-- Alteração do tipo de dados das colunas location_x e location_y
alter table st_customers
alter column location_x type float
using location_x :: float
;

alter table st_customers
alter column location_y type float
using location_y :: float
;

-- Alterando os valores nulos das colunas location_x e location_y para 0
update st_customers
set location_x = 0
where location_x is null
;

update st_customers
set location_y = 0
where location_y is null
;

select * from st_customers;

-- Tratamento dos dados st_orders

-- Alterando os valores nulos das colunas sales_rep_id e promo_id para 0
update st_orders
set sales_rep_id = 0
where sales_rep_id is null
;

update st_orders
set promo_id = 0
where promo_id is null
;

select * from st_orders;


-- Tratamento dos dados st_salesrep

-- Atualizando valor nulo nas colunas hire_date e department_id
update st_salesrep
set hire_date = '1900-01-01 00:00:00'
where first_name = 'No rep';

update st_salesrep
set department_id = 0
where department_id is null

select * from st_salesrep;
