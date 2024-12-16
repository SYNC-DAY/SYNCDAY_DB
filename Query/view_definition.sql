-- 1. Card View (카드 정보 + 작성자 + 담당자 + 태그 + 카드보드 정보)
CREATE OR REPLACE VIEW `V_CARD` AS
SELECT
    c.card_id,
    c.title,
    c.content,
    c.start_time,
    c.end_time,
    c.vcs_object_type,
    c.vcs_object_url,
    c.created_at,
    c.updated_at,
    -- 카드보드 정보
    cb.cardboard_id,
    cb.title AS cardboard_title,
    cb.workspace_id,
    -- 태그 정보
    ct.tag_id,
    ct.tag_name,
    ct.color_hex,
    -- 작성자 정보
    creator.user_id AS creator_id,
    creator.username AS creator_name,
    creator.email AS creator_email,
    creator.profile_url AS creator_profile_url,
    creator.position AS creator_position,
    -- 담당자 정보
    assignee.user_id AS assignee_id,
    assignee.username AS assignee_name,
    assignee.email AS assignee_email,
    assignee.profile_url AS assignee_profile_url,
    assignee.position AS assignee_position,
    -- workspace 정보
    w.workspace_name,
    w.proj_id
FROM
    TBL_CARD c
        LEFT JOIN TBL_CARDBOARD cb ON c.cardboard_id = cb.cardboard_id
        LEFT JOIN TBL_CARD_TAG ct ON c.tag_id = ct.tag_id
        LEFT JOIN TBL_USER creator ON c.created_by = creator.user_id
        LEFT JOIN TBL_USER assignee ON c.assignee = assignee.user_id
        LEFT JOIN TBL_WORKSPACE w ON cb.workspace_id = w.workspace_id;

-- 2. Project Member View (프로젝트 멤버 + 상세 사용자 정보)
CREATE OR REPLACE VIEW `V_PROJ_MEMBER` AS
SELECT
    pm.proj_member_id,
    pm.bookmark_status,
    pm.participation_status,
    pm.created_at,
    pm.updated_at,
    -- 프로젝트 정보
    p.proj_id,
    p.proj_name,
    -- 사용자 정보
    u.user_id,
    u.username,
    u.email,
    u.phone_number,
    u.profile_url,
    u.position,
    u.last_activated_at,
    -- 팀 정보
    t.team_id,
    t.team_name
FROM
    TBL_PROJ_MEMBER pm
        JOIN TBL_USER u ON pm.user_id = u.user_id
        JOIN TBL_TEAM t ON u.team_id = t.team_id
        JOIN TBL_PROJ p ON pm.proj_id = p.proj_id;

-- 3. Tag Info View (태그 사용 현황)
CREATE OR REPLACE VIEW `V_TAG_INFO` AS
SELECT
    ct.tag_id,
    ct.tag_name,
    ct.color_hex,
    ct.created_at,
    ct.updated_at,
    w.workspace_id,
    w.workspace_name,
    p.proj_id,
    p.proj_name,
    COUNT(c.card_id) as usage_count
FROM
    TBL_CARD_TAG ct
        LEFT JOIN TBL_CARD c ON ct.tag_id = c.tag_id
        LEFT JOIN TBL_CARDBOARD cb ON c.cardboard_id = cb.cardboard_id
        LEFT JOIN TBL_WORKSPACE w ON cb.workspace_id = w.workspace_id
        LEFT JOIN TBL_PROJ p ON w.proj_id = p.proj_id
GROUP BY
    ct.tag_id, w.workspace_id;