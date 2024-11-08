-- Team 데이터 생성
INSERT INTO TBL_TEAM (team_name) VALUES
                                     ('개발팀'),
                                     ('디자인팀'),
                                     ('마케팅팀'),
                                     ('기획팀'),
                                     ('인사팀');

-- User 데이터 생성
INSERT INTO TBL_USER (username, email, password, phone_number, position, team_id, last_access_time) VALUES
                                                                                                        ('김개발', 'kim@syncday.com', SHA2('password123', 256), '010-1234-5678', '선임개발자', 1, NOW()),
                                                                                                        ('이디자인', 'lee@syncday.com', SHA2('password123', 256), '010-2345-6789', '수석디자이너', 2, NOW()),
                                                                                                        ('박마케팅', 'park@syncday.com', SHA2('password123', 256), '010-3456-7890', '마케팅 매니저', 3, NOW()),
                                                                                                        ('정기획', 'jung@syncday.com', SHA2('password123', 256), '010-4567-8901', '기획 팀장', 4, NOW()),
                                                                                                        ('최인사', 'choi@syncday.com', SHA2('password123', 256), '010-5678-9012', 'HR 매니저', 5, NOW());

-- Project 데이터 생성
INSERT INTO TBL_PROJ (proj_name, start_time, end_time, created_at, progress_status, user_id) VALUES
                                                                                                 ('SyncDay Mobile App', '2024-01-01 00:00:00', '2024-12-31 23:59:59', NOW(), 1, 1),
                                                                                                 ('웹사이트 리뉴얼', '2024-02-01 00:00:00', '2024-08-31 23:59:59', NOW(), 1, 2),
                                                                                                 ('2024 마케팅 캠페인', '2024-03-01 00:00:00', '2024-12-31 23:59:59', NOW(), 0, 3);

-- VCS Project 데이터 생성
INSERT INTO TBL_VCS_PROJ (title, url, proj_id, vcs_type) VALUES
                                                             ('syncday-mobile', 'https://github.com/syncday/mobile', 1, 'GITHUB'),
                                                             ('syncday-web', 'https://github.com/syncday/web', 2, 'GITHUB');

-- Workspace 데이터 생성
INSERT INTO TBL_WORKSPACE (workspace_name, created_at, progress_status, vcs_proj_id, proj_id) VALUES
                                                                                                  ('모바일 앱 개발', NOW(), 1, 1, 1),
                                                                                                  ('웹 개발', NOW(), 1, 2, 2),
                                                                                                  ('마케팅 기획', NOW(), 0, NULL, 3);

-- VCS Repository 데이터 생성
INSERT INTO TBL_VCS_REPO (repo_name, url, vcs_proj_id, workspace_id, vcs_type) VALUES
                                                                                   ('mobile-app', 'https://github.com/syncday/mobile-app', 1, 1, 'GITHUB'),
                                                                                   ('mobile-api', 'https://github.com/syncday/mobile-api', 1, 1, 'GITHUB'),
                                                                                   ('web-frontend', 'https://github.com/syncday/web-frontend', 2, 2, 'GITHUB');

-- VCS Milestone 데이터 생성
INSERT INTO TBL_VCS_MILESTONE (milestone_name, progress_status, url, repo_id) VALUES
                                                                                  ('v1.0.0', 0, 'https://github.com/syncday/mobile-app/milestone/1', 1),
                                                                                  ('v1.1.0', 0, 'https://github.com/syncday/mobile-app/milestone/2', 1),
                                                                                  ('v2.0.0', 0, 'https://github.com/syncday/web-frontend/milestone/1', 3);

-- VCS Account 데이터 생성
INSERT INTO TBL_VCS_ACCOUNT (vcs__user_id, vcs_email, vcs_username, vcs_access_token, user_id) VALUES
                                                                                                   ('gh_123456', 'kim@syncday.com', 'kimdev', 'ghp_xxxxxxxxxxxxxxxxxxxx', 1),
                                                                                                   ('gh_234567', 'lee@syncday.com', 'leedesign', 'ghp_xxxxxxxxxxxxxxxxxxxx', 2);

-- Card Board 데이터 생성
INSERT INTO TBL_CARD_BOARD (title, created_at, start_time, end_time, progress_status, milestone_id, workspace_id) VALUES
                                                                                                                      ('모바일 앱 개발 보드', NOW(), '2024-01-01 00:00:00', '2024-12-31 23:59:59', 1, 1, 1),
                                                                                                                      ('웹 개발 보드', NOW(), '2024-02-01 00:00:00', '2024-08-31 23:59:59', 1, 3, 2),
                                                                                                                      ('마케팅 캠페인 보드', NOW(), '2024-03-01 00:00:00', '2024-12-31 23:59:59', 0, NULL, 3);

-- Card Tag 데이터 생성
INSERT INTO TBL_CARD_TAG (tag_name, color, workspace_id) VALUES
                                                             ('버그', '#FF0000', 1),
                                                             ('기능개선', '#00FF00', 1),
                                                             ('디자인', '#0000FF', 2),
                                                             ('긴급', '#FF00FF', 3);

-- Card 데이터 생성
INSERT INTO TBL_CARD (title, content, created_at, card_board_id, tag_id, author, end_time, user_id) VALUES
                                                                                                        ('로그인 화면 구현', '사용자 로그인 화면 UI/UX 개발', NOW(), 1, 2, 1, '2024-01-31 23:59:59', 1),
                                                                                                        ('메인 페이지 디자인', '웹사이트 메인 페이지 디자인 작업', NOW(), 2, 3, 2, '2024-02-28 23:59:59', 2),
                                                                                                        ('SNS 광고 기획', '2024년 SNS 마케팅 전략 수립', NOW(), 3, NULL, 3, '2024-03-31 23:59:59', 3);

-- Meeting Room 데이터 생성
INSERT INTO TBL_MEETINGROOM (team_id, meetingroom_name) VALUES
                                                            (1, '개발팀 회의실'),
                                                            (2, '디자인팀 회의실'),
                                                            (3, '마케팅팀 회의실');

-- Schedule 데이터 생성
INSERT INTO TBL_SCHEDULE (title, content, start_time, end_time, public_status, repeat_status, meetingroom_id, user_id) VALUES
                                                                                                                           ('일일 스크럼', '개발팀 일일 스크럼 미팅', '2024-01-02 10:00:00', '2024-01-02 10:30:00', 'PUBLIC', 'DAILY', 1, 1),
                                                                                                                           ('디자인 리뷰', '웹사이트 디자인 검토', '2024-01-03 14:00:00', '2024-01-03 15:00:00', 'PUBLIC', 'NONE', 2, 2),
                                                                                                                           ('마케팅 전략 회의', '분기별 마케팅 전략 수립', '2024-01-04 15:00:00', '2024-01-04 17:00:00', 'PUBLIC', 'MONTHLY', 3, 3);

-- Team Board 데이터 생성
INSERT INTO TBL_TEAM_BOARD (team_id, board_title) VALUES
                                                      (1, '개발팀 공지사항'),
                                                      (2, '디자인팀 공지사항'),
                                                      (3, '마케팅팀 공지사항');

-- Team Post 데이터 생성
INSERT INTO TBL_TEAM_POST (title, content, created_at, updated_at, user_id, team_board_id) VALUES
                                                                                               ('1월 개발 일정', '1월 개발 일정 공유드립니다.', NOW(), NOW(), 1, 1),
                                                                                               ('디자인 가이드라인', '새로운 디자인 가이드라인입니다.', NOW(), NOW(), 2, 2),
                                                                                               ('마케팅 성과 보고', '12월 마케팅 성과 보고드립니다.', NOW(), NOW(), 3, 3);

-- Team Work 데이터 생성
INSERT INTO TBL_TEAM_WORK (title, content, created_at, start_time, end_time, assignee_id, status, team_id, user_id) VALUES
                                                                                                                        ('API 개발', 'REST API 개발 작업', NOW(), '2024-01-02 09:00:00', '2024-01-31 18:00:00', 1, 'IN_PROGRESS', 1, 1),
                                                                                                                        ('로고 디자인', '새로운 로고 디자인 작업', NOW(), '2024-01-03 09:00:00', '2024-01-10 18:00:00', 2, 'IN_PROGRESS', 2, 2),
                                                                                                                        ('SNS 콘텐츠 제작', '1월 SNS 콘텐츠 제작', NOW(), '2024-01-04 09:00:00', '2024-01-20 18:00:00', 3, 'TODO', 3, 3);

-- User Project 관계 데이터 생성
INSERT INTO TBL_USER_PROJ (user_id, proj_id, bookmark_status, participation_status) VALUES
                                                                                        (1, 1, 'BOOKMARK', 'PARTICIPATING'),
                                                                                        (2, 2, 'BOOKMARK', 'PARTICIPATING'),
                                                                                        (3, 3, 'BOOKMARK', 'PARTICIPATING');

-- User Schedule 관계 데이터 생성
INSERT INTO TBL_USER_SCHEDULE (user_id, schedule_id, participation_status) VALUES
                                                                               (1, 1, 'ACCEPTED'),
                                                                               (2, 2, 'ACCEPTED'),
                                                                               (3, 3, 'ACCEPTED');

-- Team Schedule 관계 데이터 생성
INSERT INTO TBL_TEAM_SCHEDULE (team_id, schedule_id) VALUES
                                                         (1, 1),
                                                         (2, 2),
                                                         (3, 3);

-- Workspace 북마크 데이터 생성
INSERT INTO `워크스페이스 북마크` (user_id, workspace_id) VALUES
                                                     (1, 1),
                                                     (2, 2),
                                                     (3, 3);

-- Project Schedule 관계 데이터 생성
INSERT INTO `프로젝트-일정` (project_id, schedule_id) VALUES
                                                    (1, 1),
                                                    (2, 2),
                                                    (3, 3);