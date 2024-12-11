-- Additional Project Data
INSERT INTO TBL_PROJ (proj_name, start_time, end_time, created_at, progress_status, vcs_type, vcs_proj_url)
VALUES
    ('SyncDay 모바일 앱', '2024-02-01 00:00:00', '2024-08-31 23:59:59', NOW(), 15, 'GITHUB', 'https://github.com/syncday/mobile-app'),
    ('SyncDay API 서버', '2024-01-15 00:00:00', '2024-07-31 23:59:59', NOW(), 25, 'GITLAB', 'https://gitlab.com/syncday/api-server'),
    ('디자인 시스템 구축', '2024-03-01 00:00:00', '2024-06-30 23:59:59', NOW(), 5, 'GITLAB', NULL),
    ('마케팅 캠페인', '2024-04-01 00:00:00', '2024-12-31 23:59:59', NOW(), 0, 'GITHUB', NULL);

-- Additional Workspace Data
INSERT INTO TBL_WORKSPACE (workspace_name, created_at, progress_status, proj_id,vcs_type,vcs_repo_name, vcs_repo_url)
VALUES
    ('모바일 앱 개발', NOW(), 10, 4, 'GITHUB', 'Mobile Repo', 'https://github.com/syncday/mobile-app/repo1'),
    ('API 개발', NOW(), 30, 5, 'GITLAB', 'Api Repo', 'https://gitlab.com/syncday/api-server/main'),
    ('MUDIUM DB', NOW(), 20, 5, 'GITHUB', 'MUDIUM_DB', 'https://github.com/three-ping/MUDIUM_DB'),
    ('MUDIUM 프론트엔드', NOW(), 5, 6, 'GITHUB', 'MUDIUM_FRONT', 'https://github.com/three-ping/MUDIUM_Frontend'),
    ('MUDIUM 백엔드', NOW(), 15, 6, 'GITHUB', 'MUDIUM_BACK', 'https://github.com/three-ping/MUDIUM_Backend'),
    ('MUDIUM CI/CD', NOW(), 0, 7, 'GITHUB', 'MUDIUM_CI/CD', 'https://github.com/three-ping/MUDIUM_DevOps');

-- Additional Project Member Data
INSERT INTO TBL_PROJ_MEMBER (bookmark_status, participation_status, proj_id, user_id)
VALUES
    ('BOOKMARKED', 'OWNER', 4, 1),   -- 김개발이 모바일 앱 프로젝트 소유자
    ('NONE', 'MEMBER', 4, 2), -- 이코딩이 모바일 앱 프로젝트 멤버
    ('BOOKMARKED', 'OWNER', 5, 1),    -- 김개발이 API 서버 프로젝트 소유자
    ('NONE', 'MEMBER', 5, 2), -- 이코딩이 API 서버 프로젝트 멤버
    ('BOOKMARKED', 'OWNER', 6, 3),    -- 박디자인이 디자인 시스템 프로젝트 소유자
    ('NONE', 'MEMBER', 6, 4), -- 정그래픽이 디자인 시스템 프로젝트 멤버
    ('BOOKMARKED', 'OWNER', 7, 5);    -- 최마케팅이 마케팅 캠페인 프로젝트 소유자

-- Additional Card Board Data
INSERT INTO TBL_CARDBOARD (title, created_at, start_time, end_time, progress_status, workspace_id)
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
INSERT INTO TBL_CARD (title, content, created_at, start_time, end_time, cardboard_id, tag_id, created_by, assignee)
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
('NONE', 'MEMBER', @backend_proj_id, 2), -- 이코딩: 멤버
-- 신규 서비스 개발 프로젝트
('BOOKMARKED', 'OWNER', @new_service_proj_id, 1),    -- 김개발: 소유자
('NONE', 'MEMBER', @new_service_proj_id, 2), -- 이코딩: 멤버
('NONE', 'MEMBER', @new_service_proj_id, 3), -- 박디자인: 멤버
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

INSERT INTO TBL_WORKSPACE (workspace_name, created_at, progress_status, proj_id, vcs_type, vcs_repo_name,vcs_repo_url)
VALUES
-- 레거시 시스템 마이그레이션 프로젝트의 워크스페이스들
('데이터 마이그레이션', NOW(), 25, 1, 'GITHUB', 'DataMigration_Repo', 'https://github.com/syncday/migration/data'),
('서비스 전환', NOW(), 15, 1, 'GITHUB', 'ServiceChange_Repo', 'https://github.com/syncday/migration/service');

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
INSERT INTO TBL_CARDBOARD (title, created_at, start_time, end_time, progress_status, workspace_id)
VALUES
-- 성능 최적화 워크스페이스의 카드보드들
('캐시 시스템 개선', NOW(), '2024-01-01 00:00:00', '2024-02-29 23:59:59', 45, @performance_workspace_id),
('데이터베이스 최적화', NOW(), '2024-02-01 00:00:00', '2024-03-31 23:59:59', 35, @performance_workspace_id);

SET @cache_board_id = LAST_INSERT_ID();
SET @db_board_id = LAST_INSERT_ID() + 1;

INSERT INTO TBL_CARDBOARD (title, created_at, start_time, end_time, progress_status, workspace_id)
VALUES
-- API 리팩토링 워크스페이스의 카드보드들
('API 구조 개선', NOW(), '2024-01-15 00:00:00', '2024-03-15 23:59:59', 30, @api_workspace_id),
('API 문서 업데이트', NOW(), '2024-02-01 00:00:00', '2024-04-30 23:59:59', 20, @api_workspace_id);

SET @api_structure_board_id = LAST_INSERT_ID();
SET @api_doc_board_id = LAST_INSERT_ID() + 1;

-- 카드 생성
INSERT INTO TBL_CARD (title, content, created_at, start_time, end_time, vcs_object_type, vcs_object_url, cardboard_id, tag_id, created_by, assignee)
VALUES
    ('카드 검색 기능 추가 및 기존 검색 기능 수정', '카드 검색 기능 추가 및 기존 검색 방식 수정', NOW(), '2024-01-01 00:00:00', '2024-01-15 23:59:59', 'Commit', 'https://github.com/three-ping/SyncDay_Back/commit/5e52640e9034fbd3f864a441c93c0e2f6cfe689a', 5, 12, 1, 1),
    ('팀게시판 관련 쿼리 수정', '팀 게시판 관련 필요한 컬럼 추가', NOW(), '2024-01-16 00:00:00', '2024-01-31 23:59:59', 'Refactor', 'https://github.com/three-ping/SyncDay_Back/commit/a7882aa7f3dbc50209dff158bf1674a9c89578f6', 11, 3, 1, 2),
    ('회의실 예약 쿼리 수정', '회의실 예약 쿼리 수정', NOW(), '2024-02-01 00:00:00', '2024-02-14 23:59:59', 'Refactor', 'https://github.com/three-ping/SyncDay_Back/commit/85dfaf988ab357ab07db157e1492f6166cf92308', 9, 4, 2, 3),
    ('팀 게시판 조회 화면에 필요한 팀 조회 엔드포인트 추가', '팀 게시판에서 보여줄 팀 이름 조회하는 엔드포인트 추가', NOW(), '2024-02-15 00:00:00', '2024-02-28 23:59:59', 'Commit', 'https://github.com/three-ping/SyncDay_Back/commit/bfcdfa517231f8d25dfe40c1413bcac053491084', 6, 7, 3, 4),
    ('일정 참석여부 조회를 위한 메소드 추가 및 sse 연결시간 재설정', '1. sse 연결 시 timeout이 5분으로 설정되어 5분 이후부터 오류 로그 발생하던 문제 수정\n\n2. 일정 참석여부 선택 페이지에서 호출하기 위한 일정 참여 조회 메소드 추가', NOW(), '2024-03-01 00:00:00', '2024-03-15 23:59:59', 'Commit', 'https://github.com/three-ping/SyncDay_Back/commit/07be0641a10623c6c097578a034b249ce80561fa', 3, 1, 4, 5),
    ('회의실 예약코드 수정', '회의실 예약코드 수정', NOW(), '2024-03-16 00:00:00', '2024-03-31 23:59:59', 'Refactor', 'https://github.com/three-ping/SyncDay_Back/commit/bd3dfdc8408129d6a2ff586829904be048d9d64d', 12, 10, 5, 6),
    ('회의실 예약 수정', '회의실 예약 수정', NOW(), '2024-04-01 00:00:00', '2024-04-14 23:59:59', 'Pull Request', 'https://github.com/three-ping/SyncDay_Back/pull/121', 4, 14, 6, 7),
    ('[채팅] 몽고db 데이터 수정', '유저 관련 몽고db 데이터 수정', NOW(), '2024-04-15 00:00:00', '2024-04-30 23:59:59', 'Pull Request', 'https://github.com/three-ping/SyncDay_Back/pull/120', 7, 2, 7, 8),
    ('[팀댓글] 팀 댓글 CRUD 기능 추가', '팀 댓글 CRUD 기능을 추가했습니다. 일정 상 테스트 코드는 추후 작성 예정입니다. 포스트맨을 통한 기능 테스트는 완료했습니다.', NOW(), '2024-05-01 00:00:00', '2024-05-14 23:59:59', 'Pull Request', 'https://github.com/three-ping/SyncDay_Back/pull/119', 1, 13, 8, 9),
    ('[채팅] 메세지 전송 성공', '웹소켓 연결을 통해 상대방에게 메세지 전송 완료 ', NOW(), '2024-05-15 00:00:00', '2024-05-31 23:59:59', 'Pull Request', 'https://github.com/three-ping/SyncDay_Back/pull/118', 8, 6, 9, 10),
    ('[팀게시글] 팀 게시글 CRUD 기능 추가', '팀 게시글 CRUD 기능을 추가했습니다. 조회 시 게시글 페이지 처리를 위한 PageHelper 의존성을 추가했습니다.\n테스트코드는 일정 상 추후 작성 예정입니다. Postman을 통한 테스트는 완료했습니다.', NOW(), '2024-06-01 00:00:00', '2024-06-14 23:59:59', 'Pull Request', 'https://github.com/three-ping/SyncDay_Back/pull/117', 10, 8, 10, 10),
    ('[팀게시판] 팀 게시판 CRUD 기능 추가', '팀 게시판 CRUD 기능을 추가하였습니다. 일정 상 테스트 코드는 추후에 작성 예정입니다. 포스트맨을 통한 테스트 모두 완료하였습니다.', NOW(), '2024-06-15 00:00:00', '2024-06-30 23:59:59', 'Pull Request', 'https://github.com/three-ping/SyncDay_Back/pull/116', 2, 9, 10, 1),
    ('워크스페이스 검색 기능 구현', '워크스페이스 검색이 가능하도록 구현했습니다. (1글자, 2글자, 3글자, 4글자까진 되고 이후는 테스트 안 해봄...)\n워크스페이스 검색을 vcs 레포지토리 이름으로도 할 수 있게 하기위해 워크스페이스 엔티티 및 그와 관련된 클래스를 다 수정했습니다(service에서 repo이름 넣기는 아직 안 함...)', NOW(), '2024-07-01 00:00:00', '2024-07-14 23:59:59', 'Pull Request', 'https://github.com/three-ping/SyncDay_Back/pull/115', 3, 4, 2, 2),
    ('[일정알림] 일정 시작 전 알림 기능 추가', '프론트에서 sse 연결 요청을 받아 해당 연결을 유지할 떄, 새로운 요청이 같은 유저 아이디로 들어온다면 오래된 요청을 안전하게 정리하고 새로운 요청을 연결하는 로직을 추가했습니다.\n\n컨트롤러에서 비즈니스 로직을 담당하던 부분을 서비스로 재배치했습니다.', NOW(), '2024-07-15 00:00:00', '2024-07-31 23:59:59', 'Pull Request', 'https://github.com/three-ping/SyncDay_Back/pull/114', 9, 7, 3, 3),
    ('[vcs 정보추가] 프론트와 연동', '프론트와 연동 성공!', NOW(), '2024-08-01 00:00:00', '2024-08-14 23:59:59', 'Pull Request', 'https://github.com/three-ping/SyncDay_Back/pull/113', 6, 11, 4, 4),
    ('feat: 북마크 프론트와 연동 구현', '구현 했습니당', NOW(), '2024-08-15 00:00:00', '2024-08-31 23:59:59', 'Pull Request', 'https://github.com/three-ping/SyncDay_Back/pull/112', 4, 13, 5, 5),
    ('[CardTag] CRUD 기본', 'CRUD 기본', NOW(), '2024-09-01 00:00:00', '2024-09-14 23:59:59', 'Pull Request', 'https://github.com/three-ping/SyncDay_Back/pull/109', 8, 2, 6, 6),
    ('[CardBookmark] 조회 생성 수정 삭제 + 테스트코드', '테스트 코드 작성 성공했습니다.', NOW(), '2024-09-15 00:00:00', '2024-09-30 23:59:59', 'Pull Request', 'https://github.com/three-ping/SyncDay_Back/pull/104', 7, 14, 7, 7),
    ('[CardComment] 카드댓글 CRUD 기본', '분산 캐시 시스템 구성 및 테스트', NOW(), '2024-10-01 00:00:00', '2024-10-14 23:59:59', 'Pull Request', 'https://github.com/three-ping/SyncDay_Back/pull/98', 12, 3, 8, 8),
    ('[Card] 생성 수정 삭제', '예외처리\n예외처리\n예외처리', NOW(), '2024-10-15 00:00:00', '2024-10-31 23:59:59', 'Pull Request', 'https://github.com/three-ping/SyncDay_Back/pull/93', 6, 10, 9, 9),
    ('[Cardboard] 수정, 삭제 구현 및 테스트코드', '사진 첨부', NOW(), '2024-11-01 00:00:00', '2024-11-14 23:59:59', 'Pull Request', 'https://github.com/three-ping/SyncDay_Back/pull/89', 1, 8, 10, 10),
    ('[Cardboard] 생성 및 테스트코드', '다중 리전 캐시 시스템 구축', NOW(), '2024-11-15 00:00:00', '2024-11-30 23:59:59', 'Pull Request', 'https://github.com/three-ping/SyncDay_Back/pull/86', 9, 6, 7, 6),
    ('프로젝트 정보 반환시 역할과 북마크 상태 같이 반환', '프로젝트 정보 반환시 역할과 북마크 상태 같이 반환', NOW(), '2024-12-01 00:00:00', '2024-12-14 23:59:59', 'Pull Request', 'https://github.com/three-ping/SyncDay_Back/pull/83', 3, 9, 1, 2),
    ('Feature/schedule repeat 일정반복 swagger 설정 추가', '설정 추가 했습니다.', NOW(), '2024-12-15 00:00:00', '2024-12-31 23:59:59', 'Pull Request', 'https://github.com/three-ping/SyncDay_Back/pull/81', 5, 11, 2, 3),
    ('[채팅] 웹소켓 연결 설정', '채팅을 위한 웹소켓 설정 및 기본 구조 설계', NOW(), '2025-01-01 00:00:00', '2025-01-14 23:59:59', 'Pull Request', 'https://github.com/three-ping/SyncDay_Back/pull/80', 10, 4, 3, 4),
    ('유저 PK로 유저 조회 기능 추가 및 프로젝트 검색 기능 추가', '유저 pk로 유저dto를 조회하고 프론트에서 es를 사용해 검색하는 기능을 추가했습니다.', NOW(), '2025-01-15 00:00:00', '2025-01-31 23:59:59', 'Pull Request', 'https://github.com/three-ping/SyncDay_Back/pull/78', 2, 7, 4, 5),
    ('회의실 및 회의실 예약 추가', '회의실 및 회의실 예약 추가', NOW(), '2025-02-01 00:00:00', '2025-02-14 23:59:59', 'Pull Request', 'https://github.com/three-ping/SyncDay_Back/pull/76', 11, 5, 5, 6);
SET @redis_card_id = LAST_INSERT_ID();
SET @cache_invalidation_card_id = LAST_INSERT_ID() + 1;

INSERT INTO TBL_CARD (title, content, created_at, start_time, end_time, cardboard_id, tag_id, created_by, assignee)
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