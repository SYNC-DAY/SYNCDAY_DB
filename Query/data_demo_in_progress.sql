-- 프로젝트 생성하고 ID 저장
INSERT INTO TBL_PROJ (proj_name, start_time, end_time, created_at, progress_status, vcs_proj_url)
VALUES ('MUDIUM', '2024-03-01 00:00:00', '2024-12-31 23:59:59', '2024-02-15 09:00:00', 25,
        'https://github.com/three-ping');

SET @project_id = LAST_INSERT_ID();

SET @first_member_id = 1;
SET @second_member_id = 2;
SET @third_member_id = 3;
SET @fourth_member_id = 4;


-- 프로젝트 멤버 추가
INSERT INTO TBL_PROJ_MEMBER (bookmark_status, participation_status, proj_id, user_id)
VALUES ('BOOKMARKED', 'OWNER', @project_id, @first_member_id),
       ('BOOKMARKED', 'MEMBER', @project_id, @second_member_id),
       ('NONE', 'MEMBER', @project_id, @third_member_id),
       ('NONE', 'MEMBER', @project_id, @fourth_member_id);

-- 워크스페이스 생성
INSERT INTO TBL_WORKSPACE (workspace_name, created_at, progress_status, proj_id, vcs_repo_name, vcs_repo_url)
VALUES ('MUDIUM_Frontend', '2024-01-02 09:00:00', 0, @project_id, 'MUDIUM_Frontend',
        'https://github.com/three-ping/MUDIUM_Frontend');

SET @frontend_workspace_id = LAST_INSERT_ID();

INSERT INTO TBL_WORKSPACE (workspace_name, created_at, progress_status, proj_id, vcs_repo_name, vcs_repo_url)
VALUES ('MUDIUM_Backend', '2024-01-02 09:00:00', 0, @project_id, 'MUDIUM_Backend',
        'https://github.com/three-ping/MUDIUM_Backend');

SET @backend_workspace_id = LAST_INSERT_ID();

INSERT INTO TBL_WORKSPACE (workspace_name, created_at, progress_status, proj_id, vcs_repo_name, vcs_repo_url)
VALUES ('MUDIUM_DB', '2024-01-02 09:00:00', 0, @project_id, 'MUDIUM_DB', 'https://github.com/three-ping/MUDIUM_DB');

SET @db_workspace_id = LAST_INSERT_ID();

-- 태그 생성
INSERT INTO TBL_CARD_TAG (tag_name, color, workspace_id)
VALUES
    -- 프론트엔드 태그
    ('리펙토링', '#FF0000', @frontend_workspace_id),
    ('버그', '#FFA500', @frontend_workspace_id),
    ('새기능', '#008000', @frontend_workspace_id),
    -- 백엔드 태그
    ('리펙토링', '#FF0000', @backend_workspace_id),
    ('버그', '#0000FF', @backend_workspace_id),
    ('새기능', '#800080', @backend_workspace_id),
    -- DB 태그
    ('최적화', '#FFD700', @db_workspace_id),
    ('성능개선', '#4B0082', @db_workspace_id),
    ('정규화', '#006400', @db_workspace_id);

-- 프론트엔드 워크스페이스의 카드보드
INSERT INTO TBL_CARDBOARD (title, created_at, start_time, end_time, progress_status, workspace_id)
VALUES ('사용자 인터페이스 개발', '2024-01-03 09:00:00', '2024-01-15', '2024-02-15', 70, @frontend_workspace_id),
       ('뮤지컬 목록/상세 페이지', '2024-02-01 09:00:00', '2024-02-15', '2024-03-15', 50, @frontend_workspace_id),
       ('뮤지컬 예약 기능', '2024-03-01 09:00:00', '2024-03-15', '2024-04-15', 30, @frontend_workspace_id),
       ('관리자 대시보드', '2024-04-01 09:00:00', '2024-04-15', '2024-05-15', 10, @frontend_workspace_id);

SET @frontend_cardboard_1 = LAST_INSERT_ID();
SET @frontend_cardboard_2 = LAST_INSERT_ID() + 1;
SET @frontend_cardboard_3 = LAST_INSERT_ID() + 2;
SET @frontend_cardboard_4 = LAST_INSERT_ID() + 3;

-- 백엔드 워크스페이스의 카드보드
INSERT INTO TBL_CARDBOARD (title, created_at, start_time, end_time, progress_status, workspace_id)
VALUES ('인증/인가 시스템', '2024-01-03 09:00:00', '2024-01-15', '2024-02-15', 80, @backend_workspace_id),
       ('뮤지컬 목록 관리 API', '2024-02-01 09:00:00', '2024-02-15', '2024-03-15', 60, @backend_workspace_id),
       ('뮤지컬 예매 시스템', '2024-03-01 09:00:00', '2024-03-15', '2024-04-15', 40, @backend_workspace_id),
       ('어드민 API', '2024-04-01 09:00:00', '2024-04-15', '2024-05-15', 20, @backend_workspace_id);

SET @backend_cardboard_1 = LAST_INSERT_ID();
SET @backend_cardboard_2 = LAST_INSERT_ID() + 1;
SET @backend_cardboard_3 = LAST_INSERT_ID() + 2;
SET @backend_cardboard_4 = LAST_INSERT_ID() + 3;

-- 인프라 워크스페이스의 카드보드
INSERT INTO TBL_CARDBOARD (title, created_at, start_time, end_time, progress_status, workspace_id)
VALUES ('DB모델링', '2024-01-03 09:00:00', '2024-01-15', '2024-02-15', 90, @db_workspace_id),
       ('트리거생성', '2024-02-01 09:00:00', '2024-02-15', '2024-03-15', 70, @db_workspace_id),
       ('쿼리작성', '2024-03-01 09:00:00', '2024-03-15', '2024-04-15', 50, @db_workspace_id),
       ('클라우드 연결', '2024-04-01 09:00:00', '2024-04-15', '2024-05-15', 30, @db_workspace_id);

SET @db_cardboard_1 = LAST_INSERT_ID();
SET @db_cardboard_2 = LAST_INSERT_ID() + 1;
SET @db_cardboard_3 = LAST_INSERT_ID() + 2;
SET @db_cardboard_4 = LAST_INSERT_ID() + 3;


-- 카드 생성

-- Frontend 워크스페이스의 카드들
-- 사용자 인터페이스 개발 카드보드
INSERT INTO TBL_CARD (title, content, created_at, start_time, end_time, cardboard_id, tag_id, created_by, assignee)
VALUES
    ('로그인 UI 구현',
     'React를 사용하여 로그인 폼 구현\n- 이메일/비밀번호 입력 필드\n- 유효성 검사\n- 로그인 버튼\n- 소셜 로그인 버튼',
     '2024-01-15 09:00:00', '2024-01-15 09:00:00', '2024-01-30 18:00:00',
     @frontend_cardboard_1,
     (SELECT tag_id FROM TBL_CARD_TAG WHERE tag_name = '새기능' AND workspace_id = @frontend_workspace_id),
     @first_member_id, @second_member_id),

    ('회원가입 페이지 구현',
     '회원가입 페이지 구현\n- 사용자 정보 입력 폼\n- 유효성 검사\n- 중복 확인\n- 가입 완료 처리',
     '2024-01-20 09:00:00', '2024-01-20 09:00:00', '2024-02-05 18:00:00',
     @frontend_cardboard_1,
     (SELECT tag_id FROM TBL_CARD_TAG WHERE tag_name = '새기능' AND workspace_id = @frontend_workspace_id),
     @first_member_id, @third_member_id);

-- 뮤지컬 목록/상세 페이지 카드보드
INSERT INTO TBL_CARD (title, content, created_at, start_time, end_time, cardboard_id, tag_id, created_by, assignee)
VALUES
    ('뮤지컬 목록 페이지 구현',
     '뮤지컬 목록을 그리드 형태로 표시\n- 필터링 기능\n- 정렬 기능\n- 페이지네이션\n- 검색 기능',
     '2024-02-15 09:00:00', '2024-02-15 09:00:00', '2024-02-28 18:00:00',
     @frontend_cardboard_2,
     (SELECT tag_id FROM TBL_CARD_TAG WHERE tag_name = '새기능' AND workspace_id = @frontend_workspace_id),
     @second_member_id, @fourth_member_id),

    ('뮤지컬 상세 페이지 구현',
     '뮤지컬 상세 정보 표시\n- 공연 정보\n- 캐스팅 정보\n- 좌석 선택\n- 예매 기능',
     '2024-02-20 09:00:00', '2024-02-20 09:00:00', '2024-03-10 18:00:00',
     @frontend_cardboard_2,
     (SELECT tag_id FROM TBL_CARD_TAG WHERE tag_name = '새기능' AND workspace_id = @frontend_workspace_id),
     @second_member_id, @third_member_id);

-- Backend 워크스페이스의 카드들
-- 인증/인가 시스템 카드보드
INSERT INTO TBL_CARD (title, content, created_at, start_time, end_time, cardboard_id, tag_id, created_by, assignee)
VALUES
    ('JWT 인증 구현',
     'JWT 기반 인증 시스템 구현\n- 토큰 생성/검증\n- 리프레시 토큰\n- 보안 설정\n- 예외 처리',
     '2024-01-15 09:00:00', '2024-01-15 09:00:00', '2024-01-30 18:00:00',
     @backend_cardboard_1,
     (SELECT tag_id FROM TBL_CARD_TAG WHERE tag_name = '새기능' AND workspace_id = @backend_workspace_id),
     @first_member_id, @second_member_id),

    ('소셜 로그인 연동',
     'OAuth2.0 기반 소셜 로그인 구현\n- 구글 로그인\n- 카카오 로그인\n- 네이버 로그인\n- 프로필 정보 동기화',
     '2024-01-20 09:00:00', '2024-01-20 09:00:00', '2024-02-05 18:00:00',
     @backend_cardboard_1,
     (SELECT tag_id FROM TBL_CARD_TAG WHERE tag_name = '새기능' AND workspace_id = @backend_workspace_id),
     @first_member_id, @third_member_id);

-- DB 워크스페이스의 카드들
-- DB모델링 카드보드
INSERT INTO TBL_CARD (title, content, created_at, start_time, end_time, cardboard_id, tag_id, created_by, assignee)
VALUES
    ('회원 테이블 설계',
     '회원 관련 테이블 설계\n- 회원 기본 정보\n- 소셜 로그인 정보\n- 권한 정보\n- 인덱스 설계',
     '2024-01-15 09:00:00', '2024-01-15 09:00:00', '2024-01-30 18:00:00',
     @db_cardboard_1,
     (SELECT tag_id FROM TBL_CARD_TAG WHERE tag_name = '정규화' AND workspace_id = @db_workspace_id),
     @first_member_id, @second_member_id),

    ('공연/예매 테이블 설계',
     '공연과 예매 관련 테이블 설계\n- 공연 정보\n- 좌석 정보\n- 예매 정보\n- 결제 정보',
     '2024-01-20 09:00:00', '2024-01-20 09:00:00', '2024-02-05 18:00:00',
     @db_cardboard_1,
     (SELECT tag_id FROM TBL_CARD_TAG WHERE tag_name = '정규화' AND workspace_id = @db_workspace_id),
     @first_member_id, @third_member_id);