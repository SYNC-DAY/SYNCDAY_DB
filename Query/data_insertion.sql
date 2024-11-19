-- 팀 데이터
INSERT INTO TBL_TEAM (team_name) VALUES
                                     ('개발팀'),
                                     ('디자인팀'),
                                     ('기획팀'),
                                     ('운영팀');

-- 사용자 데이터 (비밀번호는 모두 'password1234'를 BCrypt로 해시화)
INSERT INTO TBL_USER (username, email, password, phone_number, position, team_id, last_activated_at) VALUES
                                                                                                         ('김개발', 'dev.kim@syncday.com', '$2a$10$wZfBafDu9jOO6y7O0WV7ie0TKsJaoCN2PxBXX1PIV.WXhlD6wQc5a', '010-1234-5678', '선임개발자', 1, NOW()),
                                                                                                         ('이디자인', 'design.lee@syncday.com', '$2a$10$wZfBafDu9jOO6y7O0WV7ie0TKsJaoCN2PxBXX1PIV.WXhlD6wQc5a', '010-2345-6789', '수석디자이너', 2, NOW()),
                                                                                                         ('박기획', 'plan.park@syncday.com', '$2a$10$wZfBafDu9jOO6y7O0WV7ie0TKsJaoCN2PxBXX1PIV.WXhlD6wQc5a', '010-3456-7890', '기획팀장', 3, NOW()),
                                                                                                         ('최운영', 'op.choi@syncday.com', '$2a$10$wZfBafDu9jOO6y7O0WV7ie0TKsJaoCN2PxBXX1PIV.WXhlD6wQc5a', '010-4567-8901', '운영매니저', 4, NOW());

-- 회의실 데이터
INSERT INTO TBL_MEETINGROOM (team_id, meetingroom_name) VALUES
                                                            (1, '개발팀 회의실'),
                                                            (2, '디자인팀 회의실'),
                                                            (3, '기획팀 회의실'),
                                                            (4, '대회의실');

-- 프로젝트 데이터
INSERT INTO TBL_PROJ (proj_name, start_time, end_time, created_at, progress_status, vcs_type, vcs_proj_url) VALUES
                                                                                                                ('SyncDay 웹 개발', '2024-01-01 00:00:00', '2024-12-31 23:59:59', NOW(), 30, NULL, NULL),
                                                                                                                ('모바일 앱 개발', '2024-03-01 00:00:00', '2024-09-30 23:59:59', NOW(), 10, NULL, NULL),
                                                                                                                ('디자인 시스템 구축', '2024-02-01 00:00:00', '2024-08-31 23:59:59', NOW(), 20, NULL, NULL);

-- 워크스페이스 데이터
INSERT INTO TBL_WORKSPACE (workspace_name, created_at, progress_status, proj_id, vcs_type, vcs_repo_url) VALUES
                                                                                                             ('SyncDay 백엔드', NOW(), 35, 1, NULL, NULL),
                                                                                                             ('SyncDay 프론트엔드', NOW(), 25, 1, NULL, NULL),
                                                                                                             ('모바일 UI/UX', NOW(), 15, 2, NULL, NULL);

-- 카드태그 데이터
INSERT INTO TBL_CARD_TAG (tag_name, color, workspace_id) VALUES
                                                             ('긴급', '#FF0000', 1),
                                                             ('보류', '#FFFF00', 1),
                                                             ('진행중', '#00FF00', 1),
                                                             ('검토필요', '#0000FF', 2);

-- 카드보드 데이터
INSERT INTO TBL_CARD_BOARD (title, created_at, start_time, end_time, progress_status, workspace_id) VALUES
                                                                                                        ('스프린트 1', NOW(), '2024-03-01 00:00:00', '2024-03-15 23:59:59', 40, 1),
                                                                                                        ('스프린트 2', NOW(), '2024-03-16 00:00:00', '2024-03-31 23:59:59', 20, 1),
                                                                                                        ('디자인 작업', NOW(), '2024-03-01 00:00:00', '2024-03-31 23:59:59', 30, 2);

-- 카드 데이터
INSERT INTO TBL_CARD (title, content, created_at, start_time, end_time, card_board_id, tag_id, created_by, assignee) VALUES
                                                                                                                         ('로그인 기능 구현', '스프링 시큐리티를 이용한 로그인 기능 구현', NOW(), '2024-03-01 00:00:00', '2024-03-07 23:59:59', 1, 1, 1, 1),
                                                                                                                         ('메인 페이지 디자인', '반응형 메인 페이지 디자인 작업', NOW(), '2024-03-08 00:00:00', '2024-03-14 23:59:59', 3, 3, 2, 2),
                                                                                                                         ('API 문서화', 'Swagger를 이용한 API 문서화 작업', NOW(), '2024-03-16 00:00:00', '2024-03-22 23:59:59', 2, 4, 1, 1);

-- 일정 데이터
INSERT INTO TBL_SCHEDULE (title, content, start_time, end_time, public_status, repeat_status, repeat_property, meetingroom_id, user_id) VALUES
                                                                                                                                            ('일일 스크럼', '일일 업무 공유 미팅', '2024-03-20 10:00:00', '2024-03-20 11:00:00', 'PUBLIC', 'DAILY', 'WEEKDAY', 1, 1),
                                                                                                                                            ('디자인 리뷰', '주간 디자인 검토 회의', '2024-03-21 14:00:00', '2024-03-21 16:00:00', 'PUBLIC', 'WEEKLY', 'THURSDAY', 2, 2),
                                                                                                                                            ('sprint planning', '다음 스프린트 계획 미팅', '2024-03-22 15:00:00', '2024-03-22 17:00:00', 'PUBLIC', 'NONE', NULL, 4, 1);

-- 회의록 데이터
INSERT INTO TBL_MEETING_NOTE (schedule_id, title, content) VALUES
                                                               (1, '일일 스크럼 회의록', '1. 진행상황 공유\n2. 블로커 이슈 논의\n3. 다음 작업 계획'),
                                                               (2, '디자인 리뷰 회의록', '1. 현재 디자인 검토\n2. 수정사항 논의\n3. 다음 작업 방향 설정');

-- 팀 게시판 데이터
INSERT INTO TBL_TEAM_BOARD (team_id, board_title) VALUES
                                                      (1, '개발팀 공지사항'),
                                                      (1, '기술 공유'),
                                                      (2, '디자인팀 공지사항');

-- 팀 게시글 데이터
INSERT INTO TBL_TEAM_POST (title, content, created_at, updated_at, user_id, team_board_id) VALUES
                                                                                               ('3월 일정 안내', '3월 주요 일정 안내입니다.', NOW(), NOW(), 1, 1),
                                                                                               ('Spring Security 가이드', '로그인 구현 가이드입니다.', NOW(), NOW(), 1, 2),
                                                                                               ('디자인 가이드라인 공유', '프로젝트 디자인 가이드라인입니다.', NOW(), NOW(), 2, 3);

-- 팀 업무 데이터
INSERT INTO TBL_TEAM_WORK (title, content, created_at, start_time, end_time, assignee_id, status, team_id, created_by) VALUES
                                                                                                                           ('로그인 페이지 구현', '로그인 페이지 프론트엔드 구현', NOW(), '2024-03-20 00:00:00', '2024-03-25 23:59:59', 1, 'IN_PROGRESS', 1, 1),
                                                                                                                           ('메인 페이지 디자인', '메인 페이지 디자인 작업', NOW(), '2024-03-21 00:00:00', '2024-03-26 23:59:59', 2, 'IN_PROGRESS', 2, 2),
                                                                                                                           ('요구사항 분석', '신규 기능 요구사항 분석', NOW(), '2024-03-22 00:00:00', '2024-03-24 23:59:59', 3, 'PENDING', 3, 3);

-- 북마크 데이터
INSERT INTO TBL_WORKSPACE_BOOKMARK (workspace_id, user_id) VALUES
                                                               (1, 1),
                                                               (2, 1),
                                                               (3, 2);

INSERT INTO TBL_CARD_BOOKMARK (user_id, card_id) VALUES
                                                     (1, 1),
                                                     (2, 2);

-- 연결 테이블 데이터
INSERT INTO tbl_proj_member (bookmark_status, participation_status, proj_id, user_id) VALUES
                                                                                        ('BOOKMARKED', 'ACTIVE', 1, 1),
                                                                                        ('NOT_BOOKMARKED', 'ACTIVE', 1, 2),
                                                                                        ('BOOKMARKED', 'ACTIVE', 2, 3);

INSERT INTO TBL_USER_SCHEDULE (user_id, schedule_id, status) VALUES
                                                                 (1, 1, 'CONFIRMED'),
                                                                 (2, 1, 'CONFIRMED'),
                                                                 (1, 2, 'PENDING');

INSERT INTO TBL_TEAM_SCHEDULE (team_id, schedule_id) VALUES
                                                         (1, 1),
                                                         (2, 2),
                                                         (1, 3);

INSERT INTO TBL_PROJ_SCHEDULE (project_id, schedule_id) VALUES
                                                            (1, 1),
                                                            (1, 2),
                                                            (1, 3);