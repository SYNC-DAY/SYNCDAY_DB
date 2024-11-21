-- Additional Project Data
INSERT INTO TBL_PROJ (proj_name, start_time, end_time, created_at, progress_status, vcs_type, vcs_proj_url)
VALUES
    ('SyncDay 모바일 앱', '2024-02-01 00:00:00', '2024-08-31 23:59:59', NOW(), 15, 'GITHUB', 'https://github.com/syncday/mobile-app'),
    ('SyncDay API 서버', '2024-01-15 00:00:00', '2024-07-31 23:59:59', NOW(), 25, 'GITLAB', 'https://gitlab.com/syncday/api-server'),
    ('디자인 시스템 구축', '2024-03-01 00:00:00', '2024-06-30 23:59:59', NOW(), 5, NULL, NULL),
    ('마케팅 캠페인', '2024-04-01 00:00:00', '2024-12-31 23:59:59', NOW(), 0, NULL, NULL);

-- Additional Workspace Data
INSERT INTO TBL_WORKSPACE (workspace_name, created_at, progress_status, proj_id, vcs_type, vcs_repo_url)
VALUES
    ('모바일 앱 개발', NOW(), 10, 4, 'GITHUB', 'https://github.com/syncday/mobile-app/repo1'),
    ('API 개발', NOW(), 30, 5, 'GITLAB', 'https://gitlab.com/syncday/api-server/main'),
    ('API 문서화', NOW(), 20, 5, NULL, NULL),
    ('UI 컴포넌트', NOW(), 5, 6, NULL, NULL),
    ('스타일 가이드', NOW(), 15, 6, NULL, NULL),
    ('SNS 마케팅', NOW(), 0, 7, NULL, NULL);

-- Additional Project Member Data
INSERT INTO TBL_PROJ_MEMBER (bookmark_status, participation_status, proj_id, user_id)
VALUES
    ('BOOKMARKED', 'OWNER', 4, 1),    -- 김개발이 모바일 앱 프로젝트 소유자
    ('NOT_BOOKMARKED', 'MEMBER', 4, 2), -- 이코딩이 모바일 앱 프로젝트 멤버
    ('BOOKMARKED', 'OWNER', 5, 1),    -- 김개발이 API 서버 프로젝트 소유자
    ('NOT_BOOKMARKED', 'MEMBER', 5, 2), -- 이코딩이 API 서버 프로젝트 멤버
    ('BOOKMARKED', 'OWNER', 6, 3),    -- 박디자인이 디자인 시스템 프로젝트 소유자
    ('NOT_BOOKMARKED', 'MEMBER', 6, 4), -- 정그래픽이 디자인 시스템 프로젝트 멤버
    ('BOOKMARKED', 'OWNER', 7, 5);    -- 최마케팅이 마케팅 캠페인 프로젝트 소유자

-- Additional Card Board Data
INSERT INTO TBL_CARD_BOARD (title, created_at, start_time, end_time, progress_status, workspace_id)
VALUES
    ('모바일 앱 1차 개발', NOW(), '2024-02-01 00:00:00', '2024-03-31 23:59:59', 15, 4),
    ('API 개발 Sprint 1', NOW(), '2024-01-15 00:00:00', '2024-02-15 23:59:59', 80, 5),
    ('API 개발 Sprint 2', NOW(), '2024-02-16 00:00:00', '2024-03-15 23:59:59', 40, 5),
    ('UI 컴포넌트 개발', NOW(), '2024-03-01 00:00:00', '2024-04-30 23:59:59', 10, 7),
    ('마케팅 전략 기획', NOW(), '2024-04-01 00:00:00', '2024-05-31 23:59:59', 0, 9);

-- Additional Card Tag Data
INSERT INTO TBL_CARD_TAG (tag_name, color, workspace_id)
VALUES
    ('버그', '#FF0000', 4),
    ('기능개선', '#00FF00', 4),
    ('문서화', '#0000FF', 5),
    ('디자인', '#FF00FF', 7),
    ('기획', '#FFFF00', 9);

-- Additional Card Data
INSERT INTO TBL_CARD (title, content, created_at, start_time, end_time, card_board_id, tag_id, created_by, assignee)
VALUES
    ('로그인 화면 구현', '모바일 앱 로그인 화면 UI/UX 구현', NOW(), '2024-02-01 00:00:00', '2024-02-15 23:59:59', 4, 1, 1, 2),
    ('회원가입 API 개발', 'REST API 엔드포인트 구현 및 문서화', NOW(), '2024-01-15 00:00:00', '2024-01-31 23:59:59', 5, 3, 1, 1),
    ('푸시알림 기능 구현', '푸시 알림 시스템 설계 및 구현', NOW(), '2024-02-16 00:00:00', '2024-03-15 23:59:59', 6, 2, 2, 1),
    ('버튼 컴포넌트 제작', '공통 버튼 컴포넌트 디자인 및 구현', NOW(), '2024-03-01 00:00:00', '2024-03-15 23:59:59', 7, 4, 3, 4),
    ('SNS 마케팅 전략', '각 채널별 마케팅 전략 수립', NOW(), '2024-04-01 00:00:00', '2024-04-30 23:59:59', 8, 5, 5, 5);

-- Additional Card Comments
INSERT INTO TBL_CARD_COMMENT (content, created_at, updated_at, user_id, card_id)
VALUES
    ('로그인 화면 디자인 검토 필요합니다', NOW(), NOW(), 2, 4),
    ('API 문서 작성 완료했습니다', NOW(), NOW(), 1, 5),
    ('푸시 알림 테스트 환경 구축 중입니다', NOW(), NOW(), 1, 6),
    ('버튼 컴포넌트 초안 완성했습니다', NOW(), NOW(), 4, 7),
    ('채널별 예산 배분 검토 필요합니다', NOW(), NOW(), 5, 8);

-- Additional Card Checklists
INSERT INTO TBL_CHECKLIST (card_id, content, status)
VALUES
    (4, '로그인 화면 와이어프레임 작성', 'COMPLETED'),
    (4, '로그인 화면 API 연동', 'IN_PROGRESS'),
    (5, 'API 엔드포인트 구현', 'COMPLETED'),
    (5, '단위 테스트 작성', 'COMPLETED'),
    (6, '푸시 알림 서버 구축', 'IN_PROGRESS'),
    (7, '버튼 컴포넌트 디자인', 'COMPLETED'),
    (8, '채널별 타겟 고객 분석', 'IN_PROGRESS');




-- 김개발이 참여하는 프로젝트들
INSERT INTO TBL_PROJ (proj_name, start_time, end_time, created_at, progress_status, vcs_type, vcs_proj_url)
VALUES
    ('백엔드 시스템 개선', '2024-01-01 00:00:00', '2024-06-30 23:59:59', NOW(), 35, 'GITHUB', 'https://github.com/syncday/backend');

SET @backend_proj_id = LAST_INSERT_ID();

INSERT INTO TBL_PROJ (proj_name, start_time, end_time, created_at, progress_status, vcs_type, vcs_proj_url)
VALUES
    ('신규 서비스 개발', '2024-03-01 00:00:00', '2024-12-31 23:59:59', NOW(), 10, 'GITLAB', 'https://gitlab.com/syncday/new-service');

SET @new_service_proj_id = LAST_INSERT_ID();

INSERT INTO TBL_PROJ (proj_name, start_time, end_time, created_at, progress_status, vcs_type, vcs_proj_url)
VALUES
    ('레거시 시스템 마이그레이션', '2024-02-01 00:00:00', '2024-08-31 23:59:59', NOW(), 20, 'GITHUB', 'https://github.com/syncday/migration');

SET @migration_proj_id = LAST_INSERT_ID();

-- 김개발의 프로젝트 멤버십
INSERT INTO TBL_PROJ_MEMBER (bookmark_status, participation_status, proj_id, user_id)
VALUES
-- 백엔드 시스템 개선 프로젝트
('BOOKMARKED', 'OWNER', @backend_proj_id, 1),    -- 김개발: 소유자
('NOT_BOOKMARKED', 'MEMBER', @backend_proj_id, 2), -- 이코딩: 멤버
-- 신규 서비스 개발 프로젝트
('BOOKMARKED', 'OWNER', @new_service_proj_id, 1),    -- 김개발: 소유자
('NOT_BOOKMARKED', 'MEMBER', @new_service_proj_id, 2), -- 이코딩: 멤버
('NOT_BOOKMARKED', 'MEMBER', @new_service_proj_id, 3), -- 박디자인: 멤버
-- 레거시 시스템 마이그레이션 프로젝트
('BOOKMARKED', 'OWNER', @migration_proj_id, 1);     -- 김개발: 소유자

-- 김개발의 프로젝트 워크스페이스들
INSERT INTO TBL_WORKSPACE (workspace_name, created_at, progress_status, proj_id, vcs_type, vcs_repo_url)
VALUES
-- 백엔드 시스템 개선 프로젝트의 워크스페이스들
('성능 최적화', NOW(), 40, @backend_proj_id, 'GITHUB', 'https://github.com/syncday/backend/performance'),
('API 리팩토링', NOW(), 30, @backend_proj_id, 'GITHUB', 'https://github.com/syncday/backend/refactoring');

SET @performance_workspace_id = LAST_INSERT_ID();
SET @api_workspace_id = LAST_INSERT_ID() + 1;

INSERT INTO TBL_WORKSPACE (workspace_name, created_at, progress_status, proj_id, vcs_type, vcs_repo_url)
VALUES
-- 신규 서비스 개발 프로젝트의 워크스페이스들
('인증 시스템', NOW(), 15, @new_service_proj_id, 'GITLAB', 'https://gitlab.com/syncday/new-service/auth'),
('결제 시스템', NOW(), 5, @new_service_proj_id, 'GITLAB', 'https://gitlab.com/syncday/new-service/payment');

SET @auth_workspace_id = LAST_INSERT_ID();
SET @payment_workspace_id = LAST_INSERT_ID() + 1;

INSERT INTO TBL_WORKSPACE (workspace_name, created_at, progress_status, proj_id, vcs_type, vcs_repo_url)
VALUES
-- 레거시 시스템 마이그레이션 프로젝트의 워크스페이스들
('데이터 마이그레이션', NOW(), 25, @migration_proj_id, 'GITHUB', 'https://github.com/syncday/migration/data'),
('서비스 전환', NOW(), 15, @migration_proj_id, 'GITHUB', 'https://github.com/syncday/migration/service');

SET @data_migration_workspace_id = LAST_INSERT_ID();
SET @service_migration_workspace_id = LAST_INSERT_ID() + 1;

-- 워크스페이스 북마크
INSERT INTO TBL_WORKSPACE_BOOKMARK (workspace_id, user_id)
VALUES
    (@performance_workspace_id, 1),  -- 성능 최적화
    (@api_workspace_id, 1),         -- API 리팩토링
    (@payment_workspace_id, 1);      -- 결제 시스템

-- 각 워크스페이스의 태그들
INSERT INTO TBL_CARD_TAG (tag_name, color, workspace_id)
VALUES
-- 성능 최적화 워크스페이스의 태그들
('성능개선', '#FF5733', @performance_workspace_id),
('버그수정', '#C70039', @performance_workspace_id),
('모니터링', '#900C3F', @performance_workspace_id);

SET @performance_tag_id = LAST_INSERT_ID();
SET @bug_tag_id = LAST_INSERT_ID() + 1;
SET @monitoring_tag_id = LAST_INSERT_ID() + 2;

INSERT INTO TBL_CARD_TAG (tag_name, color, workspace_id)
VALUES
-- API 리팩토링 워크스페이스의 태그들
('리팩토링', '#FFC300', @api_workspace_id),
('문서화', '#DAF7A6', @api_workspace_id);

SET @refactoring_tag_id = LAST_INSERT_ID();
SET @documentation_tag_id = LAST_INSERT_ID() + 1;

-- 카드보드 생성
INSERT INTO TBL_CARD_BOARD (title, created_at, start_time, end_time, progress_status, workspace_id)
VALUES
-- 성능 최적화 워크스페이스의 카드보드들
('캐시 시스템 개선', NOW(), '2024-01-01 00:00:00', '2024-02-29 23:59:59', 45, @performance_workspace_id),
('데이터베이스 최적화', NOW(), '2024-02-01 00:00:00', '2024-03-31 23:59:59', 35, @performance_workspace_id);

SET @cache_board_id = LAST_INSERT_ID();
SET @db_board_id = LAST_INSERT_ID() + 1;

INSERT INTO TBL_CARD_BOARD (title, created_at, start_time, end_time, progress_status, workspace_id)
VALUES
-- API 리팩토링 워크스페이스의 카드보드들
('API 구조 개선', NOW(), '2024-01-15 00:00:00', '2024-03-15 23:59:59', 30, @api_workspace_id),
('API 문서 업데이트', NOW(), '2024-02-01 00:00:00', '2024-04-30 23:59:59', 20, @api_workspace_id);

SET @api_structure_board_id = LAST_INSERT_ID();
SET @api_doc_board_id = LAST_INSERT_ID() + 1;

-- 카드 생성
INSERT INTO TBL_CARD (title, content, created_at, start_time, end_time, card_board_id, tag_id, created_by, assignee)
VALUES
-- 캐시 시스템 개선 카드보드의 카드들
('Redis 캐시 도입', '주요 API 응답 속도 개선을 위한 Redis 캐시 도입', NOW(), '2024-01-01 00:00:00', '2024-01-15 23:59:59', @cache_board_id, @performance_tag_id, 1, 1),
('캐시 무효화 전략 수립', '캐시 정합성 보장을 위한 전략 수립 및 구현', NOW(), '2024-01-16 00:00:00', '2024-01-31 23:59:59', @cache_board_id, @performance_tag_id, 1, 2);

SET @redis_card_id = LAST_INSERT_ID();
SET @cache_invalidation_card_id = LAST_INSERT_ID() + 1;

INSERT INTO TBL_CARD (title, content, created_at, start_time, end_time, card_board_id, tag_id, created_by, assignee)
VALUES
-- 데이터베이스 최적화 카드보드의 카드들
('인덱스 최적화', '주요 쿼리 성능 개선을 위한 인덱스 재설계', NOW(), '2024-02-01 00:00:00', '2024-02-15 23:59:59', @db_board_id, @performance_tag_id, 1, 1),
('쿼리 튜닝', '병목 쿼리 분석 및 최적화', NOW(), '2024-02-16 00:00:00', '2024-02-29 23:59:59', @db_board_id, @performance_tag_id, 1, 2);

SET @index_card_id = LAST_INSERT_ID();
SET @query_card_id = LAST_INSERT_ID() + 1;

-- 체크리스트 생성
INSERT INTO TBL_CHECKLIST (card_id, content, status)
VALUES
-- Redis 캐시 도입 카드의 체크리스트
(@redis_card_id, 'Redis 서버 구축', 'COMPLETED'),
(@redis_card_id, '캐시 적용 대상 API 선정', 'COMPLETED'),
(@redis_card_id, '캐시 적용 구현', 'IN_PROGRESS'),
(@redis_card_id, '성능 테스트', 'TODO'),
-- 인덱스 최적화 카드의 체크리스트
(@index_card_id, '느린 쿼리 조사', 'COMPLETED'),
(@index_card_id, '인덱스 설계', 'IN_PROGRESS'),
(@index_card_id, '인덱스 적용', 'TODO'),
(@index_card_id, '성능 측정', 'TODO');

-- 카드 댓글
INSERT INTO TBL_CARD_COMMENT (content, created_at, updated_at, user_id, card_id)
VALUES
    ('Redis 서버 구축 완료했습니다. 개발 서버에서 테스트 진행 중입니다.', NOW(), NOW(), 1, @redis_card_id),
    ('캐시 키 설계 리뷰 부탁드립니다.', NOW(), NOW(), 2, @redis_card_id),
    ('인덱스 설계안 공유드립니다. 검토 부탁드립니다.', NOW(), NOW(), 1, @index_card_id),
    ('실행계획 분석 결과 공유해주세요.', NOW(), NOW(), 2, @index_card_id);

-- 카드 북마크
INSERT INTO TBL_CARD_BOOKMARK (user_id, card_id)
VALUES
    (1, @redis_card_id),    -- Redis 캐시 도입
    (1, @index_card_id),    -- 인덱스 최적화
    (1, @query_card_id);    -- 쿼리 튜닝