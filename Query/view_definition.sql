SELECT
    -- Card info
    c.card_id,
    c.title AS card_title,
    c.content,
    c.created_at,
    c.start_time,
    c.end_time,
    c.vcs_object_type,
    c.vcs_object_url,

    -- Tag info
    t.tag_id,
    t.tag_name,
    t.color_hex,

    -- created_by (Project Member) info
    created_by_pm.proj_member_id AS created_by_member_id,
    created_by_pm.participation_status AS created_by_status,
    created_by_pm.bookmark_status AS created_by_bookmark_status,
    created_by_u.user_id AS created_by_id,
    created_by_u.username AS created_by_name,
    created_by_u.profile_url AS created_by_profile_url,

    -- Assignee (Project Member) info
    assignee_pm.proj_member_id AS assignee_member_id,
    assignee_pm.participation_status AS assignee_status,
    assignee_pm.bookmark_status AS assignee_bookmark_status,
    assignee_u.user_id AS assignee_id,
    assignee_u.username AS assignee_name,
    assignee_u.profile_url AS assignee_profile_url

FROM TBL_CARD c
-- Join for workspace and project context
         JOIN TBL_CARDBOARD cb ON c.cardboard_id = cb.cardboard_id
         JOIN TBL_WORKSPACE w ON cb.workspace_id = w.workspace_id
         JOIN TBL_PROJ p ON w.proj_id = p.proj_id

-- Tag information
         LEFT JOIN TBL_CARD_TAG t ON c.tag_id = t.tag_id

-- created_by information through project member
         LEFT JOIN TBL_USER created_by_u ON c.created_by = created_by_u.user_id
         LEFT JOIN TBL_PROJ_MEMBER created_by_pm ON created_by_u.user_id = created_by_pm.user_id
    AND created_by_pm.proj_id = p.proj_id

-- Assignee information through project member
         LEFT JOIN TBL_USER assignee_u ON c.assignee = assignee_u.user_id
         LEFT JOIN TBL_PROJ_MEMBER assignee_pm ON assignee_u.user_id = assignee_pm.user_id
    AND assignee_pm.proj_id = p.proj_id

WHERE c.cardboard_id = ? -- Parameter for filtering by specific cardboard
ORDER BY c.created_at DESC;