-- Create view for cards with tag and user information including profile URLs
CREATE OR REPLACE VIEW VW_CARD_INFO AS
SELECT
    c.card_id,
    c.title AS card_title,
    c.content AS card_content,
    c.created_at,
    c.start_time,
    c.end_time,
    c.vcs_object_type,
    c.vcs_object_url,
    c.cardboard_id,

    -- Tag information
    ct.tag_id,
    ct.tag_name,
    ct.color AS tag_color,

    -- Cardboard information
    cb.title AS cardboard_title,
    cb.workspace_id,

    -- Creator information
    creator.user_id AS creator_id,
    creator.username AS creator_name,
    creator.email AS creator_email,
    creator.profile_photo AS creator_profile_url,
    creator.team_id AS creator_team_id,

    -- Assignee information
    assignee.user_id AS assignee_id,
    assignee.username AS assignee_name,
    assignee.email AS assignee_email,
    assignee.profile_photo AS assignee_profile_url,
    assignee.team_id AS assignee_team_id,

    -- Team information for creator and assignee
    creator_team.team_name AS creator_team_name,
    assignee_team.team_name AS assignee_team_name
FROM
    TBL_CARD c
        LEFT JOIN TBL_CARD_TAG ct ON c.tag_id = ct.tag_id
        LEFT JOIN TBL_CARDBOARD cb ON c.cardboard_id = cb.cardboard_id
        LEFT JOIN TBL_USER creator ON c.created_by = creator.user_id
        LEFT JOIN TBL_USER assignee ON c.assignee = assignee.user_id
        LEFT JOIN TBL_TEAM creator_team ON creator.team_id = creator_team.team_id
        LEFT JOIN TBL_TEAM assignee_team ON assignee.team_id = assignee_team.team_id;