CREATE OR REPLACE VIEW V_CARD AS
SELECT
    -- Card basic information
    c.card_id,
    c.title AS card_title,
    c.content,
    c.created_at,
    c.start_time,
    c.end_time,
    c.vcs_object_type,
    c.vcs_object_url,
    c.cardboard_id,

    -- Tag information
    t.tag_id,
    t.tag_name,
    t.color_hex,

    -- Creator information
    creator_pm.proj_member_id AS creator_member_id,
    creator_pm.participation_status AS creator_status,
    creator_pm.bookmark_status AS creator_bookmark_status,
    creator_u.user_id AS creator_id,
    creator_u.username AS creator_name,
    creator_u.profile_url AS creator_profile_url,

    -- Assignee information
    assignee_pm.proj_member_id AS assignee_member_id,
    assignee_pm.participation_status AS assignee_status,
    assignee_pm.bookmark_status AS assignee_bookmark_status,
    assignee_u.user_id AS assignee_id,
    assignee_u.username AS assignee_name,
    assignee_u.profile_url AS assignee_profile_url,

    -- Project context
    w.workspace_id,
    w.workspace_name,
    p.proj_id,
    p.proj_name

FROM TBL_CARD c
-- Join for workspace and project context
         JOIN TBL_CARDBOARD cb ON c.cardboard_id = cb.cardboard_id
         JOIN TBL_WORKSPACE w ON cb.workspace_id = w.workspace_id
         JOIN TBL_PROJ p ON w.proj_id = p.proj_id

-- Tag information
         LEFT JOIN TBL_CARD_TAG t ON c.tag_id = t.tag_id

-- Creator information through project member
         LEFT JOIN TBL_USER creator_u ON c.created_by = creator_u.user_id
         LEFT JOIN TBL_PROJ_MEMBER creator_pm ON creator_u.user_id = creator_pm.user_id
    AND creator_pm.proj_id = p.proj_id

-- Assignee information through project member
         LEFT JOIN TBL_USER assignee_u ON c.assignee = assignee_u.user_id
         LEFT JOIN TBL_PROJ_MEMBER assignee_pm ON assignee_u.user_id = assignee_pm.user_id
    AND assignee_pm.proj_id = p.proj_id;