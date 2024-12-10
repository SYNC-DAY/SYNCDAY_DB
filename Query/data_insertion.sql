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
                                                                                                                                   ('이코딩', 'lee.code@syncday.com', '$2a$10$cWItct.unCf7VWn22jy7Eumwf9Rc4uGmq6kdUL2pmWcWepnDtl3sS', '010-2234-5678', 'https://i.namu.wiki/i/rE4yAFoTCMaVqOEAX9WEoVD2AsWWvc7PQXQo2ONTA9N-R8ZClcL_ZwNYEBB9Q0nTI4TYtgCaDyILAjriIAZq0mCrg9bcVinn1OKsUW2lbd0T7COnHC3l8mYh3rroaX9GuG2hc2paWp72GfL84j3fvg.webp', '2021-06-15 09:00:00', '주니어개발자', 1, NOW()),
                                                                                                                                   ('박디자인', 'park.design@syncday.com', '$2a$10$cWItct.unCf7VWn22jy7Eumwf9Rc4uGmq6kdUL2pmWcWepnDtl3sS', '010-3234-5678', 'https://i.namu.wiki/i/Xpzcbe05b8p6Sz78z5zmNnn1at7vXk5pbYwJjBzv2AUxDCitJCxfbo5Q6YPVqriyVlkOhwS7HxeDgjJyEsOcAN8uEZThE0LiaIP6h1Iuj3MIXHK9ER6QiwGWO8SdIm_KCxcKynj0OtPEnP-itq79Lw.webp', '2022-09-01 09:00:00', '수석디자이너', 2, NOW()),
                                                                                                                                   ('정그래픽', 'jung.graphic@syncday.com', '$2a$10$cWItct.unCf7VWn22jy7Eumwf9Rc4uGmq6kdUL2pmWcWepnDtl3sS', '010-4234-5678', 'https://i.namu.wiki/i/AFTcNHcS0RjL4vM-V39AaW5dZvmdpjW14zEILTNELFmrXMEoJohlvgcjzL2U0AkyVLDAqqxINisGt2XpU7is5BS1h9Ho9fek1X0wOrfTPLWy6BT52zvPNBlGfupltfEvs8LbA_rLTNNkeW-WNMjapw.webp', '2021-11-08 09:00:00', '그래픽디자이너', 2, NOW()),
                                                                                                                                   ('최마케팅', 'choi.marketing@syncday.com', '$2a$10$cWItct.unCf7VWn22jy7Eumwf9Rc4uGmq6kdUL2pmWcWepnDtl3sS', '010-5234-5678', 'https://i.namu.wiki/i/mOrlkoV7VxPq2j-lBzvZL0vq9gsS_QEVD8XgE9UHGbZGMc97g_Ng_ITYUW4DQoBQMbm2d2VeJQ5UJ5PGG4z83FyHIYVITFLbQGoQ3JiUmlpcrFr2Ap592O6nIE-hhIeMYnNTpu8CW-VMprPEc2FVDg.webp', '2023-01-16 09:00:00', '마케팅 팀장', 3, NOW()),
                                                                                                                                   ('강기획', 'kang.plan@syncday.com', '$2a$10$cWItct.unCf7VWn22jy7Eumwf9Rc4uGmq6kdUL2pmWcWepnDtl3sS', '010-6234-5678', 'https://i.namu.wiki/i/tXYO2nIN-5wiKRQAqswM8pha3TFE2lJfKDhk6-zFz3sNQxXMPcshuzhB2IgDgwNIPgZBQ9OkWxNxk-HLIU7mZQsy46uPhyux847ct20JcmFhv_3XPN6Cxki2GpskAJCM4RLKLLeJeYBHRrh65t4RNQ.webp', '2020-03-02 09:00:00', '기획 팀장', 1, NOW()),
                                                                                                                                   ('윤인사', 'yoon.hr@syncday.com', '$2a$10$cWItct.unCf7VWn22jy7Eumwf9Rc4uGmq6kdUL2pmWcWepnDtl3sS', '010-7234-5678', 'https://i.namu.wiki/i/HBU17V4eu78SksQrNdiL6KaZnhVAy4KvC4TsI_Wkx1Y8hMEyTHr36I8_hxf0WJM6Y86iIPvT7KHEbBK_HiA5sasX92acrU1iOUXOAvlxd-g4RIA35NdnnrShdQppxNUAfDZp8eQ1YLVTaz6Rjmx8hA.webp', '2020-03-02 09:00:00', 'HR 매니저', 1, NOW()),
                                                                                                                                   ('임영업', 'im.sales@syncday.com', '$2a$10$cWItct.unCf7VWn22jy7Eumwf9Rc4uGmq6kdUL2pmWcWepnDtl3sS', '010-8234-5678', 'https://i.namu.wiki/i/4bASiForTrWZQbu6R6FXMqmxRnSIplsq-6vDK2AZhD3OncSBsK063KagO-pqQvQD-gOyGxTPEoaUA_OdhHHPuflMC0IN_rYSW_QOyW49Han9mShMysk-XwjuT2kBbhpb-aLMGq5kN70p_K6RhFn0JQ.webp', '2020-03-02 09:00:00', '영업 팀장', 2, NOW()),
                                                                                                                                   ('한지원', 'han.support@syncday.com', '$2a$10$cWItct.unCf7VWn22jy7Eumwf9Rc4uGmq6kdUL2pmWcWepnDtl3sS', '010-9234-5678', 'https://i.namu.wiki/i/1Vuf4ZNhXDbDoZRw0SY5Bptj4vnHrYLyYl9oxcoSLlY0GyoIYqDqxmvFWsMvSe5SZMf2e8c0yEipDb95KzwzbwFp4vsrM1O3FlBp-5TcjLTJF10dT7x7ekBVKzvcVnJKK_udetPMVv7nRvzFUnGHLw.webp', '2020-03-02 09:00:00', '고객지원 매니저', 3, NOW()),
                                                                                                                                   ('한지투', 'hantwo.support@syncday.com', '$2a$10$cWItct.unCf7VWn22jy7Eumwf9Rc4uGmq6kdUL2pmWcWepnDtl3sS', '010-9234-5679', 'https://i.namu.wiki/i/CYEW3q8rreyYNOKje-asDDdO3H-n7_ESsQiZXkMRibVJjr5qc3yFO_Ka5sI46HX8q82iHfpK1r-UyRRm30pYRWOPgcegiFCRKbSqoBcvj5lL1KCkwbupCuUoFug-yngc4ETD5B4jWpoaVX1qjUZCfw.webp', '2020-03-02 09:00:00', '고객지원 매니저', 3, NOW()),
                                                                                                                                   ('오재무', 'oh.finance@syncday.com', '$2a$10$cWItct.unCf7VWn22jy7Eumwf9Rc4uGmq6kdUL2pmWcWepnDtl3sS', '010-0234-5678', 'https://i.namu.wiki/i/xUy3QxIGppT5-TXVmPrixiqUYzcxUHorh0oDvqVIZtew0C4CsRdnkBX7KkuV1EUFjGnF2dKGVeb9SF6DzmZr892o9GGwJQlL5OKm_0w2paJZL6Vcx_kDOgGWu3gGO7qK8Qt0HdMfVfT3s_T13y1PsA.webp', '2020-03-02 09:00:00', '재무 팀장', 1, NOW());



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