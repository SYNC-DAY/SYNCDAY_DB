-- TBL_TEAM 데이터
INSERT INTO TBL_TEAM (team_id, team_name) VALUES
                                              (1, '개발1팀'),
                                              (2, '개발2팀'),
                                              (3, '디자인팀'),
                                              (4, 'PM팀'),
                                              (5, '인프라팀');

-- TBL_USER 데이터 (BCrypt로 암호화된 비밀번호 - 원래 비밀번호는 'password1234')
INSERT INTO TBL_USER (user_id, username, email, password, phone_number, position, team_id) VALUES
                                                                                               (1, '김철수', 'kim@syncday.com', '$2a$10$1xYkvG6JpJpNS3qpBTGI7.RKZF/UADsXLEdcYtOXaGWW0xYhLW/Sm', '010-1234-5678', '팀장', 1),
                                                                                               (2, '이영희', 'lee@syncday.com', '$2a$10$1xYkvG6JpJpNS3qpBTGI7.RKZF/UADsXLEdcYtOXaGWW0xYhLW/Sm', '010-2345-6789', '선임개발자', 1),
                                                                                               (3, '박지민', 'park@syncday.com', '$2a$10$1xYkvG6JpJpNS3qpBTGI7.RKZF/UADsXLEdcYtOXaGWW0xYhLW/Sm', '010-3456-7890', '디자이너', 3),
                                                                                               (4, '최동훈', 'choi@syncday.com', '$2a$10$1xYkvG6JpJpNS3qpBTGI7.RKZF/UADsXLEdcYtOXaGWW0xYhLW/Sm', '010-4567-8901', 'PM', 4),
                                                                                               (5, '정수진', 'jung@syncday.com', '$2a$10$1xYkvG6JpJpNS3qpBTGI7.RKZF/UADsXLEdcYtOXaGWW0xYhLW/Sm', '010-5678-9012', '인프라엔지니어', 5);

-- TBL_PROJ 데이터
INSERT INTO TBL_PROJ (proj_id, proj_name, proj_start_time, proj_end_time, proj_created_at, progress_status, user_id) VALUES
                                                                                                                         (1, 'SyncDay 플랫폼 개발', '2024-01-01', '2024-12-31', '2023-12-15', 30, 1),
                                                                                                                         (2, '모바일 앱 개발', '2024-02-01', '2024-08-31', '2024-01-15', 20, 2),
                                                                                                                         (3, 'UI/UX 개선 프로젝트', '2024-03-01', '2024-06-30', '2024-02-15', 45, 3);

-- TBL_WORKSPACE 데이터
INSERT INTO TBL_WORKSPACE (workspace_id, workspace_name, created_at, progress_status, proj_id) VALUES
                                                                                                   (1, '백엔드 개발', '2024-01-02', 35, 1),
                                                                                                   (2, '프론트엔드 개발', '2024-01-02', 25, 1),
                                                                                                   (3, '안드로이드 개발', '2024-02-02', 15, 2),
                                                                                                   (4, 'iOS 개발', '2024-02-02', 20, 2),
                                                                                                   (5, 'UI 디자인', '2024-03-02', 40, 3);

-- TBL_CARD_TAG 데이터
INSERT INTO TBL_CARD_TAG (tag_id, tag_name, color, workspace_id) VALUES
                                                                     (1, '긴급', '#FF0000', 1),
                                                                     (2, '버그', '#FF6B6B', 1),
                                                                     (3, '개선', '#4CAF50', 2),
                                                                     (4, '문서화', '#2196F3', 2),
                                                                     (5, '디자인', '#9C27B0', 5);

-- TBL_CARD_BOARD 데이터
INSERT INTO TBL_CARD_BOARD (card_board_id, title, created_at, start_time, end_time, progress_status, workspace_id) VALUES
                                                                                                                       (1, '스프린트 1', '2024-01-03', '2024-01-15', '2024-01-29', 100, 1),
                                                                                                                       (2, '스프린트 2', '2024-01-30', '2024-02-01', '2024-02-15', 75, 1),
                                                                                                                       (3, '앱 개발 1차', '2024-02-03', '2024-02-15', '2024-03-15', 30, 3),
                                                                                                                       (4, 'UI 컴포넌트', '2024-03-03', '2024-03-15', '2024-04-15', 45, 5);

-- TBL_CARD 데이터
INSERT INTO TBL_CARD (card_id, title, content, status, start_time, end_time, assignee_id, created_at, card_board_id, tag_id, author) VALUES
                                                                                                                                         (1, 'API 개발', '사용자 인증 API 개발', 'IN_PROGRESS', '2024-01-15', '2024-01-20', 2, '2024-01-15', 1, 1, 1),
                                                                                                                                         (2, '로그인 페이지', '로그인 페이지 구현', 'DONE', '2024-01-16', '2024-01-19', 3, '2024-01-16', 1, 3, 4),
                                                                                                                                         (3, '버그 수정', '로그인 실패 시 에러 처리', 'TODO', '2024-02-01', '2024-02-03', 2, '2024-02-01', 2, 2, 1);

-- TBL_CARD_COMMENT 데이터
INSERT INTO TBL_CARD_COMMENT (card_comment_id, content, created_at, updated_at, user_id, card_id) VALUES
                                                                                                      (1, 'OAuth 추가 필요합니다', '2024-01-15 14:30:00', '2024-01-15 14:30:00', 2, 1),
                                                                                                      (2, '완료했습니다. 리뷰 부탁드립니다.', '2024-01-19 17:00:00', '2024-01-19 17:00:00', 3, 2);

-- TBL_CARD_ATTACHMENTS 데이터
INSERT INTO TBL_CARD_ATTACHMENTS (description, content, card_id) VALUES
                                                                     ('API 문서', 0x89504E470D0A1A0A, 1),
                                                                     ('스크린샷', 0x89504E470D0A1A0A, 2);

-- TBL_CHECKLIST 데이터
INSERT INTO TBL_CHECKLIST (title, card_id) VALUES
                                               ('API 개발 체크리스트', 1),
                                               ('Frontend 체크리스트', 2);

-- TBL_CHECKLIST_ITEM 데이터
INSERT INTO TBL_CHECKLIST_ITEM (item_number, complete_status, content, card_id) VALUES
                                                                                    (1, 'COMPLETE', 'API 스펙 정의', 1),
                                                                                    (2, 'INCOMPLETE', '테스트 코드 작성', 1),
                                                                                    (1, 'COMPLETE', '디자인 구현', 2),
                                                                                    (2, 'COMPLETE', '반응형 처리', 2);

-- TBL_MEETINGROOM 데이터
INSERT INTO TBL_MEETINGROOM (meetingroom_id, team_id) VALUES
                                                          (1, 1),
                                                          (2, 2),
                                                          (3, 3);

-- TBL_SCHEDULE 데이터
INSERT INTO TBL_SCHEDULE (schedule_id, title, content, start_time, end_time, public_status, repeat_status, repeat_property, meetingroom_id, user_id, team_id, proj_id) VALUES
                                                                                                                                                                           (1, '일일 스크럼', '데일리 스크럼 미팅', '2024-01-15 10:00:00', '2024-01-15 10:30:00', 'PUBLIC', 'DAILY', 'WEEKDAY', 1, 1, 1, 1),
                                                                                                                                                                           (2, '스프린트 회고', '스프린트 1 회고', '2024-01-29 14:00:00', '2024-01-29 16:00:00', 'TEAM', 'NONE', NULL, 1, 1, 1, 1),
                                                                                                                                                                           (3, '디자인 리뷰', 'UI/UX 디자인 리뷰', '2024-03-15 15:00:00', '2024-03-15 16:00:00', 'PUBLIC', 'NONE', NULL, 3, 3, 3, 3);

-- TBL_USER_SCHEDULE 데이터
INSERT INTO TBL_USER_SCHEDULE (user_id, schedule_id) VALUES
                                                         (1, 1),
                                                         (2, 1),
                                                         (1, 2),
                                                         (2, 2),
                                                         (3, 3),
                                                         (4, 3);

-- TBL_USER_PROJ 데이터
INSERT INTO TBL_USER_PROJ (bookmark_status, user_id, proj_id) VALUES
                                                                  ('YES', 1, 1),
                                                                  ('NO', 2, 1),
                                                                  ('YES', 3, 3);

-- TBL_CARD_LIKE&BOOKMARK 데이터
INSERT INTO `TBL_CARD_LIKE&BOOKMARK` (flag, user_id, card_id) VALUES
                                                                  ('LIKE', 1, 1),
                                                                  ('BOOKMARK', 2, 1),
                                                                  ('LIKE', 3, 2);

-- TBL_WORKSPACE_BOOKMARK 데이터
INSERT INTO TBL_WORKSPACE_BOOKMARK (user_id, workspace_id) VALUES
                                                               (1, 1),
                                                               (2, 1),
                                                               (3, 5);

-- TBL_TEAM_BOARD 데이터
INSERT INTO TBL_TEAM_BOARD (team_board_id, team_id) VALUES
                                                        (1, 1),
                                                        (2, 2),
                                                        (3, 3);

-- TBL_TEAM_POST 데이터
INSERT INTO TBL_TEAM_POST (team_post_id, title, content, created_at, updated_at, user_id, team_board_id) VALUES
                                                                                                             (1, '1월 팀 목표', '이번 달 목표입니다...', '2024-01-02 09:00:00', '2024-01-02 09:00:00', 1, 1),
                                                                                                             (2, '코드 리뷰 가이드', '코드 리뷰 방법 안내...', '2024-01-03 10:00:00', '2024-01-03 10:00:00', 2, 1);

-- TBL_TEAM_COMMENT 데이터
INSERT INTO TBL_TEAM_COMMENT (team_comment_id, created_at, updated_at, team_post_id, author) VALUES
                                                                                                 (1, '2024-01-02 09:30:00', '2024-01-02 09:30:00', 1, 2),
                                                                                                 (2, '2024-01-03 10:30:00', '2024-01-03 10:30:00', 2, 1);

-- TBL_TEAM_WORK 데이터
INSERT INTO TBL_TEAM_WORK (title, content, created_at, start_time, end_time, assignee_id, status, team_id, user_id) VALUES
                                                                                                                        ('코드 리팩토링', '레거시 코드 개선', '2024-01-15 09:00:00', '2024-01-16', '2024-01-20', 2, 'IN_PROGRESS', 1, 1),
                                                                                                                        ('테스트 코드 작성', '단위 테스트 추가', '2024-01-16 09:00:00', '2024-01-17', '2024-01-19', 2, 'DONE', 1, 1);

-- TBL_ALERT 데이터
INSERT INTO TBL_ALERT (related_domain, alert_time, read_status, alert_type, related_id, sender_id, receiver_id) VALUES
                                                                                                                    ('CARD', '2024-01-15 14:30:00', 'UNREAD', 'MENTION', 1, 2, 1),
                                                                                                                    ('SCHEDULE', '2024-01-15 10:00:00', 'READ', 'INVITATION', 1, 1, 2);