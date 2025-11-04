create table tbl_job_category
(
    id               bigint generated always as identity
        primary key,
    job_name         varchar(255) not null,
    created_datetime timestamp default now(),
    updated_datetime timestamp default now()
);

insert into tbl_job_category (job_name) values

                                            ('미선택');
select * from tbl_job_category;
delete from tbl_job_category where id = 25;