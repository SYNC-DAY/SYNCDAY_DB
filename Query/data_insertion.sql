-- 1. 팀 데이터
INSERT INTO TBL_TEAM (team_name) VALUES
                                     ('개발팀'),
                                     ('디자인팀'),
                                     ('기획팀'),
                                     ('마케팅팀');

-- 2. 회의실 데이터
INSERT INTO TBL_MEETINGROOM (meetingroom_place, meetingroom_name, meetingroom_capacity) VALUES
                                                                                            ('7층', '태양 회의실', 8),
                                                                                            ('7층', '달 회의실', 6),
                                                                                            ('8층', '별 회의실', 12),
                                                                                            ('8층', '은하수 회의실', 20);

-- 3. 사용자 데이터
INSERT INTO TBL_USER (username, email, password, phone_number, profile_photo, join_year, position, team_id, last_activated_at) VALUES
                                                                                                                                  ('김개발', 'kim.dev@syncday.com', '$2a$10$cWItct.unCf7VWn22jy7Eumwf9Rc4uGmq6kdUL2pmWcWepnDtl3sS', '010-1234-5678', 'https://i.namu.wiki/i/oHdOqQW1Sjf4S0NH3n_o1VfeiWjJdP6ohZVbzdUkYKPFws6t9eFOxo3JS3n4KxzMeSd5fJOxHqba9SqnyrIQNA.webp', '2020-03-02 09:00:00', '선임개발자', 1, NOW()),
                                                                                                                                  ('이코딩', 'lee.code@syncday.com', '$2a$10$cWItct.unCf7VWn22jy7Eumwf9Rc4uGmq6kdUL2pmWcWepnDtl3sS', '010-2234-5678', 'https://i.namu.wiki/i/7b972-jyc12aqgoBbPt0EIMYplnF0570Uxn_5G32-3r1fhHuJLr3uIdP1Q_8jiycoHa9ZjD1aThcxemxHwyhsTTp3vJtw4SirwhZ-y8T2rwdn7MU6-xjimTj4dCGbjdDFcrG4HiuFY6MduyLPAUiKQ.webp', '2021-06-15 09:00:00', '주니어개발자', 1, NOW()),
                                                                                                                                  ('박디자인', 'park.design@syncday.com', '$2a$10$cWItct.unCf7VWn22jy7Eumwf9Rc4uGmq6kdUL2pmWcWepnDtl3sS', '010-3234-5678', 'https://i.namu.wiki/i/EN5llJjxki4j9ZFteGARZviU-ES64FmDWO6mTXFCpN4jc-6BZ61142eedJZvFVgA3e7J-D8j4V-D48ka2HEDmTqSrrcoGXSnkKzrRLLrsnCdG1yiS_1CON0vuOXrDknJW5nDrJ99EvSht5RNWVwi0A.webp', '2022-09-01 09:00:00', '수석디자이너', 2, NOW()),
                                                                                                                                  ('정그래픽', 'jung.graphic@syncday.com', '$2a$10$cWItct.unCf7VWn22jy7Eumwf9Rc4uGmq6kdUL2pmWcWepnDtl3sS', '010-4234-5678', 'https://i.namu.wiki/i/ItxcDH3fIMndf5FTXYsOhCLEv6wXbflb-LxQpXzCNqo3z8r-5vOVpmhbrpheJoOuBtgLfI1u8FxxywXpOHDn-SsPfflpcl3xTyeWXD3qi4hB-zbwY20CoMrJLIe70kKNN3lTDp7Cma3EKScJSPdbnA.webp', '2021-11-08 09:00:00', '그래픽디자이너', 2, NOW()),
                                                                                                                                  ('최마케팅', 'choi.marketing@syncday.com', '$2a$10$cWItct.unCf7VWn22jy7Eumwf9Rc4uGmq6kdUL2pmWcWepnDtl3sS', '010-5234-5678', 'https://i.namu.wiki/i/TdxqW16FlJKunFTp3Qt-e2RSi_aQxm3qWPZd0zhcRbQnVPzeAGA_8AKKxcL0xaAfEvFeX-AILB2PSuy7Xbqy1qMf0KJDXWn4vw1dYE8tG3Cvx_Rfm7AXOdobqXZ_4TPmknCFSXW-pAIn-7lsd70ADQ.webp', '2023-01-16 09:00:00', '마케팅 팀장', 3, NOW()),
                                                                                                                                  ('강기획', 'kang.plan@syncday.com', '$2a$10$cWItct.unCf7VWn22jy7Eumwf9Rc4uGmq6kdUL2pmWcWepnDtl3sS', '010-6234-5678', 'https://i.namu.wiki/i/Kvz8qpAPelibP5ze5oLc4D1bN3BsNzhrmHH-vUcb7I4x2RsGgkjyoZFBmhyWuw_tYxBw7BmNbOSF-RsidX5C-4I9Ve19GKX3xwBbUpQMazlRMKz-eexlm3hWHq3JVovkvvqeC8X7FFEdcCitl8-mfQ.webp', '2020-03-02 09:00:00', '기획 팀장', 1, NOW()),
                                                                                                                                  ('윤인사', 'yoon.hr@syncday.com', '$2a$10$cWItct.unCf7VWn22jy7Eumwf9Rc4uGmq6kdUL2pmWcWepnDtl3sS', '010-7234-5678', 'https://i.namu.wiki/i/Kvz8qpAPelibP5ze5oLc4D1bN3BsNzhrmHH-vUcb7I4x2RsGgkjyoZFBmhyWuw_tYxBw7BmNbOSF-RsidX5C-4I9Ve19GKX3xwBbUpQMazlRMKz-eexlm3hWHq3JVovkvvqeC8X7FFEdcCitl8-mfQ.webp', '2020-03-02 09:00:00', 'HR 매니저', 1, NOW()),
                                                                                                                                  ('임영업', 'im.sales@syncday.com', '$2a$10$cWItct.unCf7VWn22jy7Eumwf9Rc4uGmq6kdUL2pmWcWepnDtl3sS', '010-8234-5678', 'https://i.namu.wiki/i/Kvz8qpAPelibP5ze5oLc4D1bN3BsNzhrmHH-vUcb7I4x2RsGgkjyoZFBmhyWuw_tYxBw7BmNbOSF-RsidX5C-4I9Ve19GKX3xwBbUpQMazlRMKz-eexlm3hWHq3JVovkvvqeC8X7FFEdcCitl8-mfQ.webp', '2020-03-02 09:00:00', '영업 팀장', 2, NOW()),
                                                                                                                                  ('한지원', 'han.support@syncday.com', '$2a$10$cWItct.unCf7VWn22jy7Eumwf9Rc4uGmq6kdUL2pmWcWepnDtl3sS', '010-9234-5678', 'https://i.namu.wiki/i/Kvz8qpAPelibP5ze5oLc4D1bN3BsNzhrmHH-vUcb7I4x2RsGgkjyoZFBmhyWuw_tYxBw7BmNbOSF-RsidX5C-4I9Ve19GKX3xwBbUpQMazlRMKz-eexlm3hWHq3JVovkvvqeC8X7FFEdcCitl8-mfQ.webp', '2020-03-02 09:00:00', '고객지원 매니저', 3, NOW()),
                                                                                                                                  ('한지투', 'hantwo.support@syncday.com', '$2a$10$cWItct.unCf7VWn22jy7Eumwf9Rc4uGmq6kdUL2pmWcWepnDtl3sS', '010-9234-5679', 'https://i.namu.wiki/i/Kvz8qpAPelibP5ze5oLc4D1bN3BsNzhrmHH-vUcb7I4x2RsGgkjyoZFBmhyWuw_tYxBw7BmNbOSF-RsidX5C-4I9Ve19GKX3xwBbUpQMazlRMKz-eexlm3hWHq3JVovkvvqeC8X7FFEdcCitl8-mfQ.webp', '2020-03-02 09:00:00', '고객지원 매니저', 3, NOW()),
                                                                                                                                  ('오재무', 'oh.finance@syncday.com', '$2a$10$cWItct.unCf7VWn22jy7Eumwf9Rc4uGmq6kdUL2pmWcWepnDtl3sS', '010-0234-5678', 'https://i.namu.wiki/i/Kvz8qpAPelibP5ze5oLc4D1bN3BsNzhrmHH-vUcb7I4x2RsGgkjyoZFBmhyWuw_tYxBw7BmNbOSF-RsidX5C-4I9Ve19GKX3xwBbUpQMazlRMKz-eexlm3hWHq3JVovkvvqeC8X7FFEdcCitl8-mfQ.webp', '2020-03-02 09:00:00', '재무 팀장', 1, NOW());



-- 4. 프로젝트 데이터
INSERT INTO TBL_PROJ (proj_name, start_time, end_time, created_at, progress_status) VALUES
                                                                                        ('모바일 앱 개발', '2024-01-01', '2024-06-30', '2023-12-15', 30),
                                                                                        ('웹사이트 리뉴얼', '2024-02-01', '2024-08-31', '2024-01-15', 20),
                                                                                        ('신규 서비스 기획', '2024-03-01', '2024-09-30', '2024-02-15', 10);

-- 5. 워크스페이스 데이터
INSERT INTO TBL_WORKSPACE (workspace_name, created_at, progress_status, proj_id) VALUES
                                                                                     ('프론트엔드 개발', '2024-01-02', 35, 1),
                                                                                     ('백엔드 개발', '2024-01-02', 25, 1),
                                                                                     ('UI/UX 디자인', '2024-02-02', 40, 2),
                                                                                     ('서비스 기획', '2024-03-02', 15, 3);

-- 6. 카드보드 데이터
INSERT INTO TBL_CARDBOARD (title, created_at, start_time, end_time, progress_status, workspace_id) VALUES
                                                                                                       ('Sprint 1', '2024-01-03', '2024-01-15', '2024-01-29', 100, 1),
                                                                                                       ('Sprint 2', '2024-01-30', '2024-02-01', '2024-02-15', 50, 1),
                                                                                                       ('디자인 작업', '2024-02-03', '2024-02-15', '2024-03-15', 30, 3);

-- 7. 카드 태그 데이터
INSERT INTO TBL_CARD_TAG (tag_name, color, workspace_id) VALUES
                                                             ('버그', '#FF0000', 1),
                                                             ('기능개발', '#00FF00', 1),
                                                             ('디자인', '#0000FF', 3),
                                                             ('리뷰필요', '#FFFF00', 2);

-- 8. 카드 데이터
INSERT INTO TBL_CARD (title, content, created_at, start_time, end_time, cardboard_id, tag_id, created_by, assignee) VALUES
                                                                                                                        ('로그인 기능 구현', '사용자 로그인 기능 개발', '2024-01-04', '2024-01-15', '2024-01-20', 1, 2, 1, 2),
                                                                                                                        ('메인 페이지 디자인', '랜딩 페이지 디자인 작업', '2024-02-04', '2024-02-15', '2024-02-20', 3, 3, 3, 3),
                                                                                                                        ('API 설계', 'RESTful API 설계 및 문서화', '2024-01-05', '2024-01-15', '2024-01-25', 2, 2, 2, 1);

-- 9. 일정 데이터
INSERT INTO TBL_SCHEDULE (title, content, start_time, end_time, update_time, public_status, meeting_status, meetingroom_id, user_id) VALUES
                                                                                                                                         ('주간 회의', '프로젝트 진행상황 점검', '2024-01-15 10:00:00', '2024-01-15 11:00:00', '2024-01-14 09:00:00', 'PUBLIC', 'ACTIVE', 1, 1),
                                                                                                                                         ('디자인 리뷰', '메인 페이지 디자인 검토', '2024-02-20 14:00:00', '2024-02-20 15:00:00', '2024-02-19 13:00:00', 'PUBLIC', 'ACTIVE', 2, 3),
                                                                                                                                         ('기획 회의', '신규 서비스 기획안 논의', '2024-03-05 15:00:00', '2024-03-05 16:00:00', '2024-03-04 14:00:00', 'PUBLIC', 'ACTIVE', 3, 4);

-- 10. 팀 게시판 데이터
INSERT INTO TBL_TEAM_BOARD (team_id, board_title) VALUES
                                                      (1, '개발팀 공지사항'),
                                                      (1, '기술 공유'),
                                                      (2, '디자인팀 공지사항'),
                                                      (3, '기획팀 공지사항');

-- 11. 팀 게시글 데이터
INSERT INTO TBL_TEAM_POST (title, content, created_at, updated_at, user_id, team_board_id) VALUES
                                                                                               ('1월 업무 공지', '이번 달 주요 업무 안내입니다.', '2024-01-02 09:00:00', '2024-01-02 09:00:00', 1, 1),
                                                                                               ('CSS 팁 공유', '유용한 CSS 팁을 공유합니다.', '2024-01-05 14:00:00', '2024-01-05 14:00:00', 2, 2),
                                                                                               ('디자인 가이드라인', '프로젝트 디자인 가이드라인입니다.', '2024-02-01 10:00:00', '2024-02-01 10:00:00', 3, 3);

-- 12. 팀 댓글 데이터
INSERT INTO TBL_TEAM_COMMENT (content, created_at, updated_at, team_post_id, user_id) VALUES
                                                                                          ('확인했습니다.', '2024-01-02 09:30:00', '2024-01-02 09:30:00', 1, 2),
                                                                                          ('매우 유용한 정보네요!', '2024-01-05 15:00:00', '2024-01-05 15:00:00', 2, 1),
                                                                                          ('가이드라인 잘 보았습니다.', '2024-02-01 11:00:00', '2024-02-01 11:00:00', 3, 1);

-- 13. 프로젝트 멤버 데이터
INSERT INTO TBL_PROJ_MEMBER (bookmark_status, participation_status, proj_id, user_id) VALUES
                                                                                          ('BOOKMARKED', 'OWNER', 1, 1),
                                                                                          ('NONE', 'MEMBER', 1, 2),
                                                                                          ('BOOKMARKED', 'MEMBER', 2, 3),
                                                                                          ('NONE', 'OWNER', 3, 4);

-- 14. 팀 업무 데이터
INSERT INTO TBL_TEAM_WORK (title, content, created_at, start_time, end_time, assignee_id, status, team_id, user_id) VALUES
                                                                                                                        ('코드 리뷰', '신규 기능 코드 리뷰', '2024-01-10', '2024-01-11', '2024-01-12', 2, 'IN_PROGRESS', 1, 1),
                                                                                                                        ('디자인 시안 작성', '메인 페이지 디자인 시안 작성', '2024-02-05', '2024-02-06', '2024-02-10', 3, 'TODO', 2, 3),
                                                                                                                        ('기획안 검토', '신규 서비스 기획안 검토', '2024-03-01', '2024-03-02', '2024-03-05', 4, 'TODO', 3, 4);