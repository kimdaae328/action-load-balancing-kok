create table tbl_experience_notice
(
    id                              bigint generated always as identity
        primary key,
    experience_notice_title         varchar(255) not null,
    experience_notice_subtitle      varchar(255) not null,
    experience_notice_introduce_job varchar(255) not null,
    experience_notice_etc           varchar(255) not null,
    experience_start_date           date         not null,
    experience_end_date             date         not null,
    experience_notice_status        status    default 'inactive'::status,
    created_datetime                timestamp default now(),
    updated_datetime                timestamp default now(),
    company_id                      bigint       not null
        constraint fk_experience_notice_company
            references tbl_company,
    experience_main_tasks           varchar(255),
    experience_notice_start_date    date         not null,
    experience_notice_end_date      date         not null
);

insert into tbl_experience_notice
(experience_notice_title, experience_notice_subtitle, experience_notice_introduce_job, experience_notice_etc, experience_start_date, experience_end_date, experience_notice_status, company_id, experience_main_tasks, experience_notice_start_date, experience_notice_end_date)
values
    ('현대자동차 체험형 인턴', '미래 모빌리티를 경험하다', '연구보조 및 차량 데이터 관리', '기숙사 제공, 중식 지원', '2025-01-10', '2025-03-31', 'active', 1, '차량 데이터 분석, 문서 정리', '2024-12-01', '2024-12-31'),
    ('카카오 고객센터 체험', '소통의 힘을 배우다', '고객 문의 대응 및 데이터 정리', '음료 무제한, 자유복장', '2025-02-01', '2025-02-28', 'inactive', 1, '문의응대, FAQ 업데이트', '2025-01-01', '2025-01-15'),
    ('네이버 콘텐츠 운영 체험', '트렌드를 읽는 눈', '콘텐츠 검수 및 트렌드 분석', '점심 지원, 사내 카페 이용 가능', '2025-03-01', '2025-04-15', 'active', 1, '게시물 검수, 키워드 리서치', '2025-02-01', '2025-02-10'),
    ('롯데백화점 마케팅 지원', '현장 중심 마케팅', '이벤트 운영 및 리포트 작성', '식비 및 교통비 지원', '2025-01-15', '2025-02-20', 'inactive', 1, '현장 지원, SNS 홍보', '2024-12-20', '2025-01-05'),
    ('삼성전자 연구보조 체험', '기술의 현장 속으로', '테스트 및 데이터 수집', '사내식당 이용 가능', '2025-04-01', '2025-05-31', 'active', 1, '데이터 정리, 테스트 기록', '2025-03-01', '2025-03-15'),
    ('쿠팡 물류 운영 체험', '빠른 배송의 비밀', '물류센터 관리 지원', '식사 제공, 교통비 지급', '2025-02-10', '2025-03-05', 'active', 1, '상품 분류, 데이터 입력', '2025-01-10', '2025-01-25'),
    ('CJ ENM 콘텐츠 편집 체험', '방송 콘텐츠 제작 보조', '영상 클립 편집 및 자막 제작', '장비 제공, 간식 무제한', '2025-03-15', '2025-04-30', 'inactive', 1, '편집보조, 자료정리', '2025-02-10', '2025-02-25'),
    ('한화건설 현장관리 체험', '건설의 기본을 배우다', '현장일지 기록 및 안전관리 보조', '안전장비 제공', '2025-05-01', '2025-06-15', 'active', 1, '현장 관리, 문서 정리', '2025-04-01', '2025-04-10'),
    ('LG유플러스 데이터분석 체험', '데이터로 서비스 개선', '이용패턴 분석 및 리포팅', '점심 제공', '2025-03-10', '2025-04-25', 'inactive', 1, '데이터 추출, 보고서 작성', '2025-02-15', '2025-02-28'),
    ('넷마블 게임 QA 체험', '재미를 검증하다', '게임 테스트 및 오류 리포트', '사내식당, 간식 제공', '2025-02-20', '2025-04-10', 'active', 1, '테스트 진행, 버그 리포트', '2025-01-25', '2025-02-10'),
    ('현대백화점 디자인 체험', '공간의 미학을 배우다', '매장 디스플레이 보조', '식비 지원', '2025-01-05', '2025-02-10', 'inactive', 1, '디스플레이 지원, 자료 정리', '2024-12-10', '2024-12-25'),
    ('SK텔레콤 CS보조 체험', '고객 중심 서비스 체험', '상담 지원 및 VOC 분석', '간식 제공', '2025-04-05', '2025-05-20', 'active', 1, 'VOC분석, 응대보조', '2025-03-10', '2025-03-25');

select * from tbl_experience_notice;
insert into tbl_experience_job_category (experience_notice_id, job_category) VALUES (4,2);
insert into tbl_experience_notice (experience_notice_title, experience_notice_subtitle, experience_notice_introduce_job, experience_notice_etc, experience_start_date, experience_end_date, company_id, experience_main_tasks, experience_notice_start_date, experience_notice_end_date)
VALUES ('AI Developer', 'AI 개발자','소개','참고','2025-10-27','2026-11-25',3,'업무','2025-10-17','2026-11-25');
select *
from tbl_experience_notice
order by id desc;

delete from tbl_experience_notice
    where id >7;

-- 순서대로
ALTER TABLE tbl_experience_notice
    ALTER COLUMN experience_notice_status SET DEFAULT 'active'::status;
ALTER TABLE tbl_experience_notice
    ALTER COLUMN experience_notice_status SET NOT NULL;

ALTER TABLE tbl_experience_notice
    ALTER COLUMN experience_main_tasks SET DEFAULT '';
ALTER TABLE tbl_experience_notice
    ALTER COLUMN experience_main_tasks SET NOT NULL;

ALTER TABLE tbl_experience_notice
    ALTER COLUMN company_id SET NOT NULL;
