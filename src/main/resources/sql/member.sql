create type provider as enum('google', 'kakao', 'naver', 'kok');

create table tbl_member
(
    user_id            bigint                           not null
        primary key
        constraint fk_member_user
            references tbl_user,
    member_provider    provider default 'kok'::provider not null,
    member_profile_url varchar(255),
    member_info        text
);

select * from tbl_member;

DELETE FROM tbl_member
WHERE user_id = 4;

select count(*) from tbl_user
where (now() - interval '30 day') < updated_datetime