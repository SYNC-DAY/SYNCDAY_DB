
-- Card Indexes
CREATE INDEX idx_card_dates ON TBL_CARD(start_time, end_time);
CREATE INDEX idx_card_board ON TBL_CARD(cardboard_id);
CREATE INDEX idx_card_assignee ON TBL_CARD(assignee);

-- Project Indexes
CREATE INDEX idx_proj_dates ON TBL_PROJ(start_time, end_time);
CREATE INDEX idx_proj_status ON TBL_PROJ(progress_status);

-- Additional Triggers

-- Update Project Progress Status based on Workspace Progress
DELIMITER $$
CREATE TRIGGER trg_update_project_progress
    AFTER UPDATE ON TBL_WORKSPACE
    FOR EACH ROW
BEGIN
    UPDATE TBL_PROJ p
    SET p.progress_status = (
        SELECT AVG(progress_status)
        FROM TBL_WORKSPACE
        WHERE proj_id = p.proj_id
    )
    WHERE p.proj_id = NEW.proj_id;
    END$$
    DELIMITER ;

-- Update Workspace Progress Status based on Cardboard Progress
DELIMITER $$
    CREATE TRIGGER trg_update_workspace_progress
        AFTER UPDATE ON TBL_CARDBOARD
        FOR EACH ROW
    BEGIN
        UPDATE TBL_WORKSPACE w
        SET w.progress_status = (
            SELECT AVG(progress_status)
            FROM TBL_CARDBOARD
            WHERE workspace_id = w.workspace_id
        )
        WHERE w.workspace_id = NEW.workspace_id;
        END$$
        DELIMITER ;