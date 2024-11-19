-- Team 데이터 생성
INSERT INTO TBL_TEAM (team_name) VALUES
                                     ('개발팀'),
                                     ('디자인팀'),
                                     ('마케팅팀'),
                                     ('기획팀'),
                                     ('인사팀'),
                                     ('영업팀'),
                                     ('고객지원팀'),
                                     ('재무팀');

-- User 데이터 생성
INSERT INTO TBL_USER (username, email, password, phone_number, profile_photo, join_year, position, team_id, last_access_time) VALUES
                                                                                                                                  ('김개발', 'kim.dev@syncday.com', SHA2('password123', 256), '010-1234-5678', 'https://i.namu.wiki/i/Kvz8qpAPelibP5ze5oLc4D1bN3BsNzhrmHH-vUcb7I4x2RsGgkjyoZFBmhyWuw_tYxBw7BmNbOSF-RsidX5C-4I9Ve19GKX3xwBbUpQMazlRMKz-eexlm3hWHq3JVovkvvqeC8X7FFEdcCitl8-mfQ.webp', '2020-03-02 09:00:00', '선임개발자', 1, NOW()),
                                                                                                                                  ('이코딩', 'lee.code@syncday.com', SHA2('password123', 256), '010-2234-5678', 'https://i.namu.wiki/i/7b972-jyc12aqgoBbPt0EIMYplnF0570Uxn_5G32-3r1fhHuJLr3uIdP1Q_8jiycoHa9ZjD1aThcxemxHwyhsTTp3vJtw4SirwhZ-y8T2rwdn7MU6-xjimTj4dCGbjdDFcrG4HiuFY6MduyLPAUiKQ.webp', '2021-06-15 09:00:00', '주니어개발자', 1, NOW()),
                                                                                                                                  ('박디자인', 'park.design@syncday.com', SHA2('password123', 256), '010-3234-5678', 'https://i.namu.wiki/i/EN5llJjxki4j9ZFteGARZviU-ES64FmDWO6mTXFCpN4jc-6BZ61142eedJZvFVgA3e7J-D8j4V-D48ka2HEDmTqSrrcoGXSnkKzrRLLrsnCdG1yiS_1CON0vuOXrDknJW5nDrJ99EvSht5RNWVwi0A.webp', '2022-09-01 09:00:00', '수석디자이너', 2, NOW()),
                                                                                                                                  ('정그래픽', 'jung.graphic@syncday.com', SHA2('password123', 256), '010-4234-5678', 'https://i.namu.wiki/i/ItxcDH3fIMndf5FTXYsOhCLEv6wXbflb-LxQpXzCNqo3z8r-5vOVpmhbrpheJoOuBtgLfI1u8FxxywXpOHDn-SsPfflpcl3xTyeWXD3qi4hB-zbwY20CoMrJLIe70kKNN3lTDp7Cma3EKScJSPdbnA.webp', '2021-11-08 09:00:00', '그래픽디자이너', 2, NOW()),
                                                                                                                                  ('최마케팅', 'choi.marketing@syncday.com', SHA2('password123', 256), '010-5234-5678', 'https://i.namu.wiki/i/TdxqW16FlJKunFTp3Qt-e2RSi_aQxm3qWPZd0zhcRbQnVPzeAGA_8AKKxcL0xaAfEvFeX-AILB2PSuy7Xbqy1qMf0KJDXWn4vw1dYE8tG3Cvx_Rfm7AXOdobqXZ_4TPmknCFSXW-pAIn-7lsd70ADQ.webp', '2023-01-16 09:00:00', '마케팅 팀장', 3, NOW()),
                                                                                                                                  ('강기획', 'kang.plan@syncday.com', SHA2('password123', 256), '010-6234-5678', 'https://i.namu.wiki/i/Kvz8qpAPelibP5ze5oLc4D1bN3BsNzhrmHH-vUcb7I4x2RsGgkjyoZFBmhyWuw_tYxBw7BmNbOSF-RsidX5C-4I9Ve19GKX3xwBbUpQMazlRMKz-eexlm3hWHq3JVovkvvqeC8X7FFEdcCitl8-mfQ.webp', '2020-03-02 09:00:00', '기획 팀장', 4, NOW()),
                                                                                                                                  ('윤인사', 'yoon.hr@syncday.com', SHA2('password123', 256), '010-7234-5678', 'https://i.namu.wiki/i/Kvz8qpAPelibP5ze5oLc4D1bN3BsNzhrmHH-vUcb7I4x2RsGgkjyoZFBmhyWuw_tYxBw7BmNbOSF-RsidX5C-4I9Ve19GKX3xwBbUpQMazlRMKz-eexlm3hWHq3JVovkvvqeC8X7FFEdcCitl8-mfQ.webp', '2020-03-02 09:00:00', 'HR 매니저', 5, NOW()),
                                                                                                                                  ('임영업', 'im.sales@syncday.com', SHA2('password123', 256), '010-8234-5678', 'https://i.namu.wiki/i/Kvz8qpAPelibP5ze5oLc4D1bN3BsNzhrmHH-vUcb7I4x2RsGgkjyoZFBmhyWuw_tYxBw7BmNbOSF-RsidX5C-4I9Ve19GKX3xwBbUpQMazlRMKz-eexlm3hWHq3JVovkvvqeC8X7FFEdcCitl8-mfQ.webp', '2020-03-02 09:00:00', '영업 팀장', 6, NOW()),
                                                                                                                                  ('한지원', 'han.support@syncday.com', SHA2('password123', 256), '010-9234-5678', 'https://i.namu.wiki/i/Kvz8qpAPelibP5ze5oLc4D1bN3BsNzhrmHH-vUcb7I4x2RsGgkjyoZFBmhyWuw_tYxBw7BmNbOSF-RsidX5C-4I9Ve19GKX3xwBbUpQMazlRMKz-eexlm3hWHq3JVovkvvqeC8X7FFEdcCitl8-mfQ.webp', '2020-03-02 09:00:00', '고객지원 매니저', 7, NOW()),
                                                                                                                                  ('오재무', 'oh.finance@syncday.com', SHA2('password123', 256), '010-0234-5678', 'https://i.namu.wiki/i/Kvz8qpAPelibP5ze5oLc4D1bN3BsNzhrmHH-vUcb7I4x2RsGgkjyoZFBmhyWuw_tYxBw7BmNbOSF-RsidX5C-4I9Ve19GKX3xwBbUpQMazlRMKz-eexlm3hWHq3JVovkvvqeC8X7FFEdcCitl8-mfQ.webp', '2020-03-02 09:00:00', '재무 팀장', 8, NOW());


-- Meetingroom 데이터 생성
INSERT INTO TBL_MEETINGROOM (meetingroom_place, meetingroom_name, meetingroom_capacity)
VALUES ('모모빌딩', 'RM101', 20),
       ('여의도 한강공원', 'RM101', 15),
       ('SFC빌딩', 'RM101', 25),
       ('여의도 한강공원', 'RM201', 18),
       ('SFC빌딩', 'RM201', 12),
       ('모모빌딩', 'RM102', 30);


-- 프로젝트 데이터
INSERT INTO TBL_PROJ (proj_name, start_time, end_time, created_at, progress_status, vcs_type, vcs_proj_url)
VALUES ('SyncDay 웹 개발', '2024-01-01 00:00:00', '2024-12-31 23:59:59', NOW(), 30, NULL, NULL),
       ('모바일 앱 개발', '2024-03-01 00:00:00', '2024-09-30 23:59:59', NOW(), 10, NULL, NULL),
       ('디자인 시스템 구축', '2024-02-01 00:00:00', '2024-08-31 23:59:59', NOW(), 20, NULL, NULL);

-- 워크스페이스 데이터
INSERT INTO TBL_WORKSPACE (workspace_name, created_at, progress_status, proj_id, vcs_type, vcs_repo_url)
VALUES ('SyncDay 백엔드', NOW(), 35, 1, NULL, NULL),
       ('SyncDay 프론트엔드', NOW(), 25, 1, NULL, NULL),
       ('모바일 UI/UX', NOW(), 15, 2, NULL, NULL);

-- 카드태그 데이터
INSERT INTO TBL_CARD_TAG (tag_name, color, workspace_id)
VALUES ('긴급', '#FF0000', 1),
       ('보류', '#FFFF00', 1),
       ('진행중', '#00FF00', 1),
       ('검토필요', '#0000FF', 2);

-- 카드보드 데이터
INSERT INTO TBL_CARD_BOARD (title, created_at, start_time, end_time, progress_status, workspace_id)
VALUES ('스프린트 1', NOW(), '2024-03-01 00:00:00', '2024-03-15 23:59:59', 40, 1),
       ('스프린트 2', NOW(), '2024-03-16 00:00:00', '2024-03-31 23:59:59', 20, 1),
       ('디자인 작업', NOW(), '2024-03-01 00:00:00', '2024-03-31 23:59:59', 30, 2);

-- 카드 데이터
INSERT INTO TBL_CARD (title, content, created_at, start_time, end_time, card_board_id, tag_id, created_by, assignee)
VALUES ('로그인 기능 구현', '스프링 시큐리티를 이용한 로그인 기능 구현', NOW(), '2024-03-01 00:00:00', '2024-03-07 23:59:59', 1, 1, 1, 1),
       ('메인 페이지 디자인', '반응형 메인 페이지 디자인 작업', NOW(), '2024-03-08 00:00:00', '2024-03-14 23:59:59', 3, 3, 2, 2),
       ('API 문서화', 'Swagger를 이용한 API 문서화 작업', NOW(), '2024-03-16 00:00:00', '2024-03-22 23:59:59', 2, 4, 1, 1);


-- TBL_SCHEDULE에 더미 데이터 삽입
INSERT INTO TBL_SCHEDULE (title, content, start_time, end_time, update_time, public_status, schedule_repeat_id,
                          repeat_order, meeting_status, meetingroom_id, user_id)
VALUES ('일일 스크럼', '개발팀 데일리 스크럼 미팅', '2024-01-02 10:00:00', '2024-01-02 10:30:00', '2024-01-02 10:00:00', 'PUBLIC', NULL,
        1, 'ACTIVE', 1, 1),
       ('디자인 리뷰', '앱 디자인 검토 회의', '2024-01-03 14:00:00', '2024-01-03 15:00:00', '2024-01-03 14:00:00', 'PUBLIC', NULL, 1,
        'ACTIVE', 2, 3),
       ('마케팅 전략 회의', '분기별 마케팅 전략 회의', '2024-01-04 15:00:00', '2024-01-04 17:00:00', '2024-01-04 15:00:00', 'PUBLIC',
        NULL, 1, 'ACTIVE', 3, 1),
       ('팀 정기 미팅', '기획팀 정기 회의', '2024-01-05 11:00:00', '2024-01-05 12:00:00', '2024-01-05 11:00:00', 'PRIVATE', NULL, 1,
        'ACTIVE', 4, 1),
       ('복지제도 회의', '직원 복지 개선 회의', '2024-01-08 13:00:00', '2024-01-08 14:00:00', '2024-01-08 13:00:00', 'PRIVATE', NULL,
        NULL, 'INACTIVE', 5, 1);
-- TBL_MEETINGROOM_RESERVATION 더미데이터 생성
INSERT INTO `TBL_MEETINGROOM_RESERVATION` (`meeting_time`, `meetingroom_id`, `schedule_id`)
VALUES ('2024-01-03 14:00:00', 3, 2),
       ('2024-01-03 14:10:00', 3, 2),
       ('2024-01-03 14:20:00', 3, 2),
       ('2024-01-03 14:30:00', 3, 2),
       ('2024-01-03 14:40:00', 3, 2),
       ('2024-01-03 14:50:00', 3, 2);

-- Meeting Note 데이터 생성
INSERT INTO TBL_MEETING_NOTE (schedule_id, title, content)
VALUES (1, '2024-01-02 데일리 스크럼', '1. 진행상황 공유\n2. 이슈 사항 논의\n3. 다음 작업 계획'),
       (2, '앱 디자인 검토 회의록', '1. UI 디자인 리뷰\n2. 수정사항 정리\n3. 다음 일정 조율'),
       (3, 'Q1 마케팅 전략 회의록', '1. Q1 마케팅 목표 설정\n2. 채널별 전략 수립\n3. 예산 계획');

-- Team Board 데이터 생성
INSERT INTO TBL_TEAM_BOARD (team_id, board_title) VALUES
                                                      (1, '개발팀 공지사항'),
                                                      (2, '디자인팀 공지사항'),
                                                      (3, '마케팅팀 공지사항'),
                                                      (4, '기획팀 공지사항'),
                                                      (5, '인사팀 공지사항');
-- Team Post 데이터 생성
INSERT INTO TBL_TEAM_POST (title, content, created_at, updated_at, user_id, team_board_id) VALUES
                                                                                               ('1월 개발 일정', '1월 개발 일정 및 마일스톤 공유드립니다.', NOW(), NOW(), 1, 1),
                                                                                               ('디자인 가이드라인 업데이트', '디자인 시스템 가이드라인이 업데이트되었습니다.', NOW(), NOW(), 3, 2),
                                                                                               ('Q1 마케팅 계획', '2024년 Q1 마케팅 실행 계획입니다.', NOW(), NOW(), 5, 3),
                                                                                               ('서비스 로드맵', '2024년 서비스 로드맵 공유드립니다.', NOW(), NOW(), 6, 4),
                                                                                               ('복지제도 개선안', '새로운 복지제도 안내드립니다.', NOW(), NOW(), 7, 5);

-- Team Comment 데이터 생성
INSERT INTO TBL_TEAM_COMMENT (created_at, updated_at, team_post_id, author) VALUES
                                                                                (NOW(), NOW(), 1, 2),
                                                                                (NOW(), NOW(), 2, 4),
                                                                                (NOW(), NOW(), 3, 5),
                                                                                (NOW(), NOW(), 4, 6),
                                                                                (NOW(), NOW(), 5, 7);



-- Team Work 데이터 생성 (이어서)
INSERT INTO TBL_TEAM_WORK (title, content, created_at, start_time, end_time, assignee_id, status, team_id, user_id)
VALUES ('메인 페이지 디자인', '웹사이트 메인 페이지 디자인 작업', NOW(), '2024-01-03', '2024-01-20', 3, 'IN_PROGRESS', 2, 3),
       ('SNS 콘텐츠 제작', '1월 SNS 콘텐츠 기획 및 제작', NOW(), '2024-01-04', '2024-01-25', 5, 'TODO', 3, 5),
       ('서비스 기획안 작성', '신규 서비스 기획 문서 작성', NOW(), '2024-01-05', '2024-01-31', 6, 'TODO', 4, 6),
       ('직원 만족도 조사', '분기별 직원 만족도 조사 실시', NOW(), '2024-01-08', '2024-01-19', 7, 'TODO', 5, 7),
       ('영업 보고서 작성', '12월 영업 실적 보고서 작성', NOW(), '2024-01-02', '2024-01-10', 8, 'IN_PROGRESS', 6, 8),
       ('고객 피드백 분석', '4분기 고객 피드백 분석 보고서', NOW(), '2024-01-03', '2024-01-17', 9, 'TODO', 7, 9),
       ('연간 예산 계획', '2024년 예산 계획 수립', NOW(), '2024-01-02', '2024-01-31', 10, 'IN_PROGRESS', 8, 10);



-- 팀 게시판 데이터
INSERT INTO TBL_TEAM_BOARD (team_id, board_title)
VALUES (1, '개발팀 공지사항'),
       (1, '기술 공유'),
       (2, '디자인팀 공지사항');

-- 팀 게시글 데이터
INSERT INTO TBL_TEAM_POST (title, content, created_at, updated_at, user_id, team_board_id)
VALUES ('3월 일정 안내', '3월 주요 일정 안내입니다.', NOW(), NOW(), 1, 1),
       ('Spring Security 가이드', '로그인 구현 가이드입니다.', NOW(), NOW(), 1, 2),
       ('디자인 가이드라인 공유', '프로젝트 디자인 가이드라인입니다.', NOW(), NOW(), 2, 3);

-- Team Work 데이터 생성 (이어서)
INSERT INTO TBL_TEAM_WORK (title, content, created_at, start_time, end_time, assignee_id, status, team_id, user_id)
VALUES ('메인 페이지 디자인', '웹사이트 메인 페이지 디자인 작업', NOW(), '2024-01-03', '2024-01-20', 3, 'IN_PROGRESS', 2, 3),
       ('SNS 콘텐츠 제작', '1월 SNS 콘텐츠 기획 및 제작', NOW(), '2024-01-04', '2024-01-25', 5, 'TODO', 3, 5),
       ('서비스 기획안 작성', '신규 서비스 기획 문서 작성', NOW(), '2024-01-05', '2024-01-31', 6, 'TODO', 4, 6),
       ('직원 만족도 조사', '분기별 직원 만족도 조사 실시', NOW(), '2024-01-08', '2024-01-19', 7, 'TODO', 5, 7),
       ('영업 보고서 작성', '12월 영업 실적 보고서 작성', NOW(), '2024-01-02', '2024-01-10', 8, 'IN_PROGRESS', 6, 8),
       ('고객 피드백 분석', '4분기 고객 피드백 분석 보고서', NOW(), '2024-01-03', '2024-01-17', 9, 'TODO', 7, 9),
       ('연간 예산 계획', '2024년 예산 계획 수립', NOW(), '2024-01-02', '2024-01-31', 10, 'IN_PROGRESS', 8, 10);

-- 북마크 데이터
INSERT INTO TBL_WORKSPACE_BOOKMARK (workspace_id, user_id)
VALUES (1, 1),
       (2, 1),
       (3, 2);

INSERT INTO TBL_CARD_BOOKMARK (user_id, card_id)
VALUES (1, 1),
       (2, 2);

-- 연결 테이블 데이터
INSERT INTO tbl_proj_member (bookmark_status, participation_status, proj_id, user_id)
VALUES ('BOOKMARKED', 'ACTIVE', 1, 1),
       ('NOT_BOOKMARKED', 'ACTIVE', 1, 2),
       ('BOOKMARKED', 'ACTIVE', 2, 3);

INSERT INTO TBL_USER_SCHEDULE (user_id, schedule_id, status)
VALUES (1, 1, 'CONFIRMED'),
       (2, 1, 'CONFIRMED'),
       (1, 2, 'PENDING');

INSERT INTO TBL_TEAM_SCHEDULE (team_id, schedule_id)
VALUES (1, 1),
       (2, 2),
       (1, 3);

INSERT INTO TBL_PROJ_SCHEDULE (project_id, schedule_id)
VALUES (1, 1),
       (1, 2),
       (1, 3);