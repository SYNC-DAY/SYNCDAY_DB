
use syncdaydb;
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
INSERT INTO TBL_USER (username, email, password, phone_number, position, team_id, last_access_time) VALUES
                                                                                                        ('김개발', 'kim.dev@syncday.com', SHA2('password123', 256), '010-1234-5678', '선임개발자', 1, NOW()),
                                                                                                        ('이코딩', 'lee.code@syncday.com', SHA2('password123', 256), '010-2234-5678', '주니어개발자', 1, NOW()),
                                                                                                        ('박디자인', 'park.design@syncday.com', SHA2('password123', 256), '010-3234-5678', '수석디자이너', 2, NOW()),
                                                                                                        ('정그래픽', 'jung.graphic@syncday.com', SHA2('password123', 256), '010-4234-5678', '그래픽디자이너', 2, NOW()),
                                                                                                        ('최마케팅', 'choi.marketing@syncday.com', SHA2('password123', 256), '010-5234-5678', '마케팅 팀장', 3, NOW()),
                                                                                                        ('강기획', 'kang.plan@syncday.com', SHA2('password123', 256), '010-6234-5678', '기획 팀장', 4, NOW()),
                                                                                                        ('윤인사', 'yoon.hr@syncday.com', SHA2('password123', 256), '010-7234-5678', 'HR 매니저', 5, NOW()),
                                                                                                        ('임영업', 'im.sales@syncday.com', SHA2('password123', 256), '010-8234-5678', '영업 팀장', 6, NOW()),
                                                                                                        ('한지원', 'han.support@syncday.com', SHA2('password123', 256), '010-9234-5678', '고객지원 매니저', 7, NOW()),
                                                                                                        ('오재무', 'oh.finance@syncday.com', SHA2('password123', 256), '010-0234-5678', '재무 팀장', 8, NOW());

-- Project 데이터 생성
INSERT INTO TBL_PROJ (proj_name, start_time, end_time, created_at, progress_status, user_id) VALUES
                                                                                                 ('SyncDay 모바일 앱 개발', '2024-01-01', '2024-06-30', NOW(), 1, 1),
                                                                                                 ('웹사이트 리뉴얼', '2024-02-01', '2024-08-31', NOW(), 1, 3),
                                                                                                 ('2024 마케팅 캠페인', '2024-03-01', '2024-12-31', NOW(), 0, 5),
                                                                                                 ('신규 서비스 기획', '2024-04-01', '2024-09-30', NOW(), 0, 6),
                                                                                                 ('직원 복지 개선 프로젝트', '2024-01-15', '2024-12-31', NOW(), 1, 7);

-- Workspace 데이터 생성
INSERT INTO TBL_WORKSPACE (workspace_name, created_at, progress_status, proj_id) VALUES
                                                                                     ('모바일 앱 개발', NOW(), 1, 1),
                                                                                     ('API 개발', NOW(), 0, 1),
                                                                                     ('웹 프론트엔드', NOW(), 1, 2),
                                                                                     ('웹 백엔드', NOW(), 0, 2),
                                                                                     ('마케팅 기획', NOW(), 1, 3),
                                                                                     ('콘텐츠 제작', NOW(), 0, 3),
                                                                                     ('서비스 기획', NOW(), 1, 4),
                                                                                     ('HR 프로젝트', NOW(), 0, 5);

-- Card Board 데이터 생성
INSERT INTO TBL_CARDBOARD (title, created_at, start_time, end_time, progress_status, workspace_id) VALUES
                                                                                                        ('앱 개발 스프린트 1', NOW(), '2024-01-01', '2024-01-31', 1, 1),
                                                                                                        ('앱 개발 스프린트 2', NOW(), '2024-02-01', '2024-02-29', 0, 1),
                                                                                                        ('API 개발 보드', NOW(), '2024-01-01', '2024-03-31', 1, 2),
                                                                                                        ('프론트엔드 개발', NOW(), '2024-02-01', '2024-04-30', 0, 3),
                                                                                                        ('백엔드 개발', NOW(), '2024-02-01', '2024-04-30', 0, 4),
                                                                                                        ('Q1 마케팅 계획', NOW(), '2024-01-01', '2024-03-31', 1, 5),
                                                                                                        ('콘텐츠 캘린더', NOW(), '2024-01-01', '2024-12-31', 0, 6),
                                                                                                        ('서비스 기획', NOW(), '2024-04-01', '2024-06-30', 0, 7),
                                                                                                        ('복지 제도 개선', NOW(), '2024-01-15', '2024-06-30', 1, 8);

-- Card Tag 데이터 생성
INSERT INTO TBL_TAG (tag_name, color, workspace_id) VALUES
                                                             ('기능개발', '#4CAF50', 1),
                                                             ('버그수정', '#F44336', 1),
                                                             ('디자인', '#2196F3', 1),
                                                             ('문서화', '#FF9800', 1),
                                                             ('API', '#9C27B0', 2),
                                                             ('프론트엔드', '#3F51B5', 3),
                                                             ('백엔드', '#795548', 4),
                                                             ('마케팅', '#009688', 5),
                                                             ('콘텐츠', '#FF4081', 6),
                                                             ('기획', '#607D8B', 7),
                                                             ('HR', '#FFC107', 8);

-- Card 데이터 생성
INSERT INTO TBL_CARD (title, content, created_at, cardboard_id, tag_id, author, end_time, user_id) VALUES
                                                                                                        ('로그인 기능 구현', '사용자 인증 및 로그인 프로세스 개발', NOW(), 1, 1, 1, '2024-01-15', 2),
                                                                                                        ('메인 화면 UI 개발', '앱 메인 화면 UI 컴포넌트 개발', NOW(), 1, 3, 1, '2024-01-20', 1),
                                                                                                        ('API 엔드포인트 설계', 'REST API 엔드포인트 설계 및 문서화', NOW(), 3, 5, 1, '2024-01-31', 1),
                                                                                                        ('반응형 레이아웃 구현', '모바일 대응 반응형 레이아웃 개발', NOW(), 4, 6, 3, '2024-02-15', 3),
                                                                                                        ('SNS 마케팅 전략', '각 채널별 마케팅 전략 수립', NOW(), 6, 8, 5, '2024-01-31', 5);

-- Card Attachments 데이터 생성
INSERT INTO TBL_CARD_ATTACHMENTS (description, content, card_id) VALUES
                                                                     ('기능 명세서', '로그인 기능 상세 명세 내용...', 1),
                                                                     ('UI 디자인', '메인 화면 UI 시안 및 상세 규격...', 2),
                                                                     ('API 문서', 'REST API 상세 설계 문서...', 3);

-- Card Bookmark 데이터 생성
INSERT INTO TBL_CARD_BOOKMARK (user_id, card_id) VALUES
                                                     (1, 1),
                                                     (2, 1),
                                                     (1, 2),
                                                     (3, 2),
                                                     (1, 3);

-- Card Comment 데이터 생성
INSERT INTO TBL_CARD_COMMENT (content, created_at, updated_at, user_id, card_id) VALUES
                                                                                     ('로그인 프로세스 검토 완료했습니다.', NOW(), NOW(), 2, 1),
                                                                                     ('UI 디자인 수정사항 있습니다.', NOW(), NOW(), 3, 2),
                                                                                     ('API 설계 리뷰 필요합니다.', NOW(), NOW(), 1, 3);

-- Checklist 데이터 생성
INSERT INTO TBL_CHECKLIST (title, card_id) VALUES
                                               ('로그인 기능 체크리스트', 1),
                                               ('UI 개발 체크리스트', 2),
                                               ('API 개발 체크리스트', 3);

-- Checklist Item 데이터 생성
INSERT INTO TBL_CHECKLIST_ITEM (item_number, complete_status, content, card_id) VALUES
                                                                                    (1, 'COMPLETE', '로그인 UI 구현', 1),
                                                                                    (2, 'INCOMPLETE', '유효성 검사 구현', 1),
                                                                                    (3, 'INCOMPLETE', '에러 처리 구현', 1),
                                                                                    (1, 'COMPLETE', '레이아웃 구현', 2),
                                                                                    (2, 'INCOMPLETE', '반응형 대응', 2),
                                                                                    (1, 'COMPLETE', 'API 문서 작성', 3),
                                                                                    (2, 'INCOMPLETE', '엔드포인트 구현', 3);

-- Meetingroom 데이터 생성
INSERT INTO TBL_MEETINGROOM (team_id, meetingroom_name) VALUES
                                                            (1, '개발팀 회의실'),
                                                            (2, '디자인팀 회의실'),
                                                            (3, '마케팅팀 회의실'),
                                                            (4, '기획팀 회의실'),
                                                            (5, '인사팀 회의실');

-- Schedule 데이터 생성
INSERT INTO TBL_SCHEDULE (title, content, start_time, end_time, public_status, repeat_status, repeat_property, meetingroom_id, user_id) VALUES
                                                                                                                                            ('일일 스크럼', '개발팀 데일리 스크럼 미팅', '2024-01-02 10:00:00', '2024-01-02 10:30:00', 'PUBLIC', 'DAILY', 'WEEKDAY', 1, 1),
                                                                                                                                            ('디자인 리뷰', '앱 디자인 검토 회의', '2024-01-03 14:00:00', '2024-01-03 15:00:00', 'PUBLIC', 'WEEKLY', 'WEDNESDAY', 2, 3),
                                                                                                                                            ('마케팅 전략 회의', '분기별 마케팅 전략 회의', '2024-01-04 15:00:00', '2024-01-04 17:00:00', 'PUBLIC', 'MONTHLY', 'FIRST_MONDAY', 3, 5),
                                                                                                                                            ('팀 정기 미팅', '기획팀 정기 회의', '2024-01-05 11:00:00', '2024-01-05 12:00:00', 'PRIVATE', 'WEEKLY', 'FRIDAY', 4, 6),
                                                                                                                                            ('복지제도 회의', '직원 복지 개선 회의', '2024-01-08 13:00:00', '2024-01-08 14:00:00', 'PRIVATE', 'NONE', NULL, 5, 7);

-- Meeting Note 데이터 생성
INSERT INTO TBL_MEETING_NOTE (schedule_id, title, content) VALUES
                                                               (1, '2024-01-02 데일리 스크럼', '1. 진행상황 공유\n2. 이슈 사항 논의\n3. 다음 작업 계획'),
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
INSERT INTO TBL_TEAM_WORK (title, content, created_at, start_time, end_time, assignee_id, status, team_id, user_id) VALUES
                                                                                                                        ('메인 페이지 디자인', '웹사이트 메인 페이지 디자인 작업', NOW(), '2024-01-03', '2024-01-20', 3, 'IN_PROGRESS', 2, 3),
                                                                                                                        ('SNS 콘텐츠 제작', '1월 SNS 콘텐츠 기획 및 제작', NOW(), '2024-01-04', '2024-01-25', 5, 'TODO', 3, 5),
                                                                                                                        ('서비스 기획안 작성', '신규 서비스 기획 문서 작성', NOW(), '2024-01-05', '2024-01-31', 6, 'TODO', 4, 6),
                                                                                                                        ('직원 만족도 조사', '분기별 직원 만족도 조사 실시', NOW(), '2024-01-08', '2024-01-19', 7, 'TODO', 5, 7),
                                                                                                                        ('영업 보고서 작성', '12월 영업 실적 보고서 작성', NOW(), '2024-01-02', '2024-01-10', 8, 'IN_PROGRESS', 6, 8),
                                                                                                                        ('고객 피드백 분석', '4분기 고객 피드백 분석 보고서', NOW(), '2024-01-03', '2024-01-17', 9, 'TODO', 7, 9),
                                                                                                                        ('연간 예산 계획', '2024년 예산 계획 수립', NOW(), '2024-01-02', '2024-01-31', 10, 'IN_PROGRESS', 8, 10);

-- User Project 관계 데이터 생성
INSERT INTO tbl_proj_member (user_id, proj_id, bookmark_status, participation_status, proj_role) VALUES
                                                                                        (1, 1, 'BOOKMARK', 'PARTICIPATING', 'OWNER'),
                                                                                        (2, 1, 'NONE', 'PARTICIPATING','MEMBER'),
                                                                                        (3, 2, 'BOOKMARK', 'PARTICIPATING','OWNER'),
                                                                                        (4, 2, 'NONE', 'PARTICIPATING','MEMBER'),
                                                                                        (5, 3, 'BOOKMARK', 'PARTICIPATING','OWNER'),
                                                                                        (6, 4, 'BOOKMARK', 'PARTICIPATING','OWNER'),
                                                                                        (7, 5, 'BOOKMARK', 'PARTICIPATING','OWNER'),
                                                                                        (8, 3, 'NONE', 'PARTICIPATING','MEMBER'),
                                                                                        (9, 4, 'NONE', 'PARTICIPATING','MEMBER'),
                                                                                        (10, 5, 'NONE', 'PARTICIPATING','MEMBER');

-- User Schedule 관계 데이터 생성
INSERT INTO tbl_schedule_participant (user_id, schedule_id, participation_status) VALUES
                                                                               (1, 1, 'ACCEPTED'),
                                                                               (2, 1, 'ACCEPTED'),
                                                                               (3, 2, 'ACCEPTED'),
                                                                               (4, 2, 'ACCEPTED'),
                                                                               (5, 3, 'ACCEPTED'),
                                                                               (6, 4, 'ACCEPTED'),
                                                                               (7, 5, 'ACCEPTED'),
                                                                               (8, 3, 'PENDING'),
                                                                               (9, 4, 'PENDING'),
                                                                               (10, 5, 'ACCEPTED');

-- Team Schedule 관계 데이터 생성
INSERT INTO TBL_TEAM_SCHEDULE (team_id, schedule_id) VALUES
                                                         (1, 1),
                                                         (2, 2),
                                                         (3, 3),
                                                         (4, 4),
                                                         (5, 5);

-- Workspace 북마크 데이터 생성
INSERT INTO `tbl_workspace_bookmark` (user_id, workspace_id) VALUES
                                                     (1, 1),
                                                     (1, 2),
                                                     (2, 1),
                                                     (3, 3),
                                                     (3, 4),
                                                     (4, 3),
                                                     (5, 5),
                                                     (5, 6),
                                                     (6, 7),
                                                     (7, 8);

-- Project Schedule 관계 데이터 생성
INSERT INTO `tbl_proj_schedule` (project_id, schedule_id) VALUES
                                                    (1, 1),
                                                    (1, 2),
                                                    (2, 2),
                                                    (2, 3),
                                                    (3, 3),
                                                    (3, 4),
                                                    (4, 4),
                                                    (4, 5),
                                                    (5, 5);


-- Team Work 데이터 생성 (이어서)
INSERT INTO TBL_TEAM_WORK (title, content, created_at, start_time, end_time, assignee_id, status, team_id, user_id) VALUES
                                                                                                                        ('메인 페이지 디자인', '웹사이트 메인 페이지 디자인 작업', NOW(), '2024-01-03', '2024-01-20', 3, 'IN_PROGRESS', 2, 3),
                                                                                                                        ('SNS 콘텐츠 제작', '1월 SNS 콘텐츠 기획 및 제작', NOW(), '2024-01-04', '2024-01-25', 5, 'TODO', 3, 5),
                                                                                                                        ('서비스 기획안 작성', '신규 서비스 기획 문서 작성', NOW(), '2024-01-05', '2024-01-31', 6, 'TODO', 4, 6),
                                                                                                                        ('직원 만족도 조사', '분기별 직원 만족도 조사 실시', NOW(), '2024-01-08', '2024-01-19', 7, 'TODO', 5, 7),
                                                                                                                        ('영업 보고서 작성', '12월 영업 실적 보고서 작성', NOW(), '2024-01-02', '2024-01-10', 8, 'IN_PROGRESS', 6, 8),
                                                                                                                        ('고객 피드백 분석', '4분기 고객 피드백 분석 보고서', NOW(), '2024-01-03', '2024-01-17', 9, 'TODO', 7, 9),
                                                                                                                        ('연간 예산 계획', '2024년 예산 계획 수립', NOW(), '2024-01-02', '2024-01-31', 10, 'IN_PROGRESS', 8, 10);
