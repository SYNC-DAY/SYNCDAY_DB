-- Indexes for Foreign Keys and Frequently Used Columns

-- TBL_USER indexes
CREATE INDEX idx_user_email ON TBL_USER(email);
CREATE INDEX idx_user_team ON TBL_USER(team_id);

-- Schedule related indexes
CREATE INDEX idx_schedule_time ON TBL_SCHEDULE(start_time, end_time);
CREATE INDEX idx_schedule_user ON TBL_SCHEDULE(user_id);
CREATE INDEX idx_schedule_meeting ON TBL_SCHEDULE(meetingroom_id);

-- Project related indexes
CREATE INDEX idx_proj_time ON TBL_PROJ(start_time, end_time);
CREATE INDEX idx_workspace_proj ON TBL_WORKSPACE(proj_id);
CREATE INDEX idx_card_workspace ON TBL_CARD(cardboard_id);
CREATE INDEX idx_card_assignee ON TBL_CARD(assignee);

-- Team related indexes
CREATE INDEX idx_team_post_time ON TBL_TEAM_POST(created_at);
CREATE INDEX idx_team_comment_post ON TBL_TEAM_COMMENT(team_post_id);

-- Triggers for Progress Status Calculation

-- Progress Status Trigger for Cardboard
DELIMITER $$

CREATE TRIGGER trg_card_progress_update
    AFTER INSERT ON TBL_CARD
    FOR EACH ROW
BEGIN
    DECLARE total_cards INT;
    DECLARE completed_cards INT;
    DECLARE progress TINYINT;

    -- Count total and completed cards
    SELECT COUNT(*),
           COUNT(CASE WHEN tag_id IN (SELECT tag_id FROM TBL_CARD_TAG WHERE tag_name LIKE '%완료%' OR tag_name LIKE '%done%') THEN 1 END)
    INTO total_cards, completed_cards
    FROM TBL_CARD
    WHERE cardboard_id = NEW.cardboard_id;

    -- Calculate progress (0-100)
    IF total_cards = 0 THEN
        SET progress = 0;
    ELSE
        SET progress = FLOOR((completed_cards * 100) / total_cards);
END IF;

-- Update cardboard progress
UPDATE TBL_CARDBOARD
SET progress_status = progress
WHERE cardboard_id = NEW.cardboard_id;
END$$

CREATE TRIGGER trg_card_progress_update_after_delete
    AFTER DELETE ON TBL_CARD
    FOR EACH ROW
BEGIN
    DECLARE total_cards INT;
    DECLARE completed_cards INT;
    DECLARE progress TINYINT;

    -- Count total and completed cards
    SELECT COUNT(*),
           COUNT(CASE WHEN tag_id IN (SELECT tag_id FROM TBL_CARD_TAG WHERE tag_name LIKE '%완료%' OR tag_name LIKE '%done%') THEN 1 END)
    INTO total_cards, completed_cards
    FROM TBL_CARD
    WHERE cardboard_id = OLD.cardboard_id;

    -- Calculate progress (0-100)
    IF total_cards = 0 THEN
        SET progress = 0;
    ELSE
        SET progress = FLOOR((completed_cards * 100) / total_cards);
END IF;

-- Update cardboard progress
UPDATE TBL_CARDBOARD
SET progress_status = progress
WHERE cardboard_id = OLD.cardboard_id;
END$$

-- Workspace Progress Trigger
CREATE TRIGGER trg_workspace_progress_update
    AFTER UPDATE ON TBL_CARDBOARD
    FOR EACH ROW
BEGIN
    DECLARE total_cardboards INT;
    DECLARE total_progress INT;
    DECLARE avg_progress TINYINT;

    -- Calculate average progress of all cardboards in workspace
    SELECT COUNT(*), COALESCE(SUM(progress_status), 0)
    INTO total_cardboards, total_progress
    FROM TBL_CARDBOARD
    WHERE workspace_id = NEW.workspace_id;

    IF total_cardboards = 0 THEN
        SET avg_progress = 0;
    ELSE
        SET avg_progress = FLOOR(total_progress / total_cardboards);
END IF;

-- Update workspace progress
UPDATE TBL_WORKSPACE
SET progress_status = avg_progress
WHERE workspace_id = NEW.workspace_id;
END$$

-- Project Progress Trigger
CREATE TRIGGER trg_project_progress_update
    AFTER UPDATE ON TBL_WORKSPACE
    FOR EACH ROW
BEGIN
    DECLARE total_workspaces INT;
    DECLARE total_progress INT;
    DECLARE avg_progress TINYINT;

    -- Calculate average progress of all workspaces in project
    SELECT COUNT(*), COALESCE(SUM(progress_status), 0)
    INTO total_workspaces, total_progress
    FROM TBL_WORKSPACE
    WHERE proj_id = (SELECT proj_id FROM TBL_WORKSPACE WHERE workspace_id = NEW.workspace_id);

    IF total_workspaces = 0 THEN
        SET avg_progress = 0;
    ELSE
        SET avg_progress = FLOOR(total_progress / total_workspaces);
END IF;

-- Update project progress
UPDATE TBL_PROJ
SET progress_status = avg_progress
WHERE proj_id = (SELECT proj_id FROM TBL_WORKSPACE WHERE workspace_id = NEW.workspace_id);
END$$

DELIMITER ;