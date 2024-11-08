drop database if exists syncdaydb;
create database syncdaydb;

use syncdaydb;

-- Create tables
CREATE TABLE `TBL_CARD`
(
    `card_id`    BIGINT NOT NULL,
    `title`    VARCHAR(255) NOT NULL,
    `content`    VARCHAR(1023),
    `created_at`    TIMESTAMP NOT NULL,
    `card_board_id`    BIGINT NOT NULL,
    `tag_id`    BIGINT,
    `vcs_obj_id`    BIGINT,
    `author`    BIGINT NOT NULL,
    `end_time` TIMESTAMP,
    `user_id`    BIGINT,
    PRIMARY KEY (`card_id`)
);

CREATE TABLE `TBL_CARD_ATTACHMENTS`
(
    `description` VARCHAR(255),
    `content` TEXT NOT NULL,
    `card_id` BIGINT NOT NULL
);

CREATE TABLE `TBL_CARD_BOARD`
(
    `card_board_id`    BIGINT NOT NULL,
    `title`    VARCHAR(255) NOT NULL,
    `created_at`    TIMESTAMP NOT NULL,
    `start_time`    TIMESTAMP,
    `end_time`    TIMESTAMP,
    `progress_status`    TINYINT NOT NULL,
    `milestone_id`    BIGINT,
    `workspace_id`    BIGINT NOT NULL,
    PRIMARY KEY (`card_board_id`)
);

CREATE TABLE `TBL_CARD_BOOKMARK`
(
    `user_id`    BIGINT NOT NULL,
    `card_id`    BIGINT NOT NULL
);

CREATE TABLE `TBL_CARD_COMMENT`
(
    `card_comment_id`    BIGINT NOT NULL,
    `content`    VARCHAR(1023) NOT NULL,
    `created_at`    TIMESTAMP NOT NULL,
    `updated_at`    TIMESTAMP NOT NULL,
    `user_id`    BIGINT NOT NULL,
    `card_id`    BIGINT NOT NULL,
    PRIMARY KEY (`card_comment_id`)
);

CREATE TABLE `TBL_CARD_TAG`
(
    `tag_id`    BIGINT NOT NULL,
    `tag_name`    VARCHAR(255) NOT NULL,
    `color`    VARCHAR(255) NOT NULL,
    `workspace_id`    BIGINT NOT NULL,
    PRIMARY KEY (`tag_id`)
);

CREATE TABLE `TBL_CHECKLIST`
(
    `title`    VARCHAR(255) NOT NULL,
    `card_id`    BIGINT NOT NULL,
    PRIMARY KEY (`card_id`)
);

CREATE TABLE `TBL_CHECKLIST_ITEM`
(
    `item_number`    TINYINT NOT NULL,
    `complete_status`    VARCHAR(255) NOT NULL,
    `content`    VARCHAR(511) NOT NULL,
    `card_id`    BIGINT NOT NULL,
    PRIMARY KEY (`card_id`,`item_number`)
);

CREATE TABLE `TBL_MEETING_NOTE`
(
    `schedule_id`    BIGINT NOT NULL,
    `title`    VARCHAR(1023),
    `content`    TEXT,
    PRIMARY KEY (`schedule_id`)
);

CREATE TABLE `TBL_MEETINGROOM`
(
    `meetingroom_id`    BIGINT NOT NULL,
    `team_id`    BIGINT NOT NULL,
    `meetingroom_name`    VARCHAR(255),
    PRIMARY KEY (`meetingroom_id`)
);

CREATE TABLE `TBL_PROJ`
(
    `proj_id`    BIGINT NOT NULL,
    `proj_name`    VARCHAR(255) NOT NULL,
    `start_time`    TIMESTAMP,
    `end_time`    TIMESTAMP,
    `created_at`    TIMESTAMP NOT NULL,
    `progress_status`    TINYINT NOT NULL,
    `user_id`    BIGINT NOT NULL,
    PRIMARY KEY (`proj_id`)
);

CREATE TABLE `TBL_SCHEDULE`
(
    `schedule_id`    BIGINT NOT NULL,
    `title`    VARCHAR(255) NOT NULL,
    `content`    VARCHAR(511),
    `start_time`    TIMESTAMP NOT NULL,
    `end_time`    TIMESTAMP NOT NULL,
    `public_status`    VARCHAR(255) NOT NULL,
    `repeat_status`    VARCHAR(255) NOT NULL,
    `repeat_property`    VARCHAR(255),
    `meetingroom_id`    BIGINT,
    `user_id`    BIGINT NOT NULL,
    PRIMARY KEY (`schedule_id`)
);

CREATE TABLE `TBL_TEAM`
(
    `team_id`    BIGINT NOT NULL,
    `team_name`    VARCHAR(255) NOT NULL,
    PRIMARY KEY (`team_id`)
);

CREATE TABLE `TBL_TEAM_BOARD`
(
    `team_board_id`    BIGINT NOT NULL,
    `team_id`    BIGINT NOT NULL,
    `board_title`    VARCHAR(255) NOT NULL,
    PRIMARY KEY (`team_board_id`)
);

CREATE TABLE `TBL_TEAM_COMMENT`
(
    `team_comment_id`    BIGINT NOT NULL,
    `created_at`    TIMESTAMP NOT NULL,
    `updated_at`    TIMESTAMP NOT NULL,
    `team_post_id`    BIGINT NOT NULL,
    `author`    BIGINT NOT NULL,
    PRIMARY KEY (`team_comment_id`)
);

CREATE TABLE `TBL_TEAM_POST`
(
    `team_post_id`    BIGINT NOT NULL,
    `title`    VARCHAR(255) NOT NULL,
    `content`    TEXT NOT NULL,
    `created_at`    TIMESTAMP NOT NULL,
    `updated_at`    TIMESTAMP NOT NULL,
    `user_id`    BIGINT NOT NULL,
    `team_board_id`    BIGINT NOT NULL,
    PRIMARY KEY (`team_post_id`)
);

CREATE TABLE `TBL_TEAM_SCHEDULE`
(
    `team_id`    BIGINT NOT NULL,
    `schedule_id`    BIGINT NOT NULL
);

CREATE TABLE `TBL_TEAM_WORK`
(
    `title`    VARCHAR(255) NOT NULL,
    `content`    VARCHAR(1023) NOT NULL,
    `created_at`    TIMESTAMP NOT NULL,
    `start_time`    TIMESTAMP,
    `end_time`    TIMESTAMP NOT NULL,
    `assignee_id`    BIGINT,
    `status`    VARCHAR(255) NOT NULL,
    `team_id`    BIGINT NOT NULL,
    `user_id`    BIGINT NOT NULL
);

CREATE TABLE `TBL_USER`
(
    `user_id`    BIGINT NOT NULL,
    `username`    VARCHAR(255) NOT NULL,
    `email`    VARCHAR(255) NOT NULL,
    `password`    VARCHAR(255) NOT NULL,
    `phone_number`    VARCHAR(255),
    `position`    VARCHAR(255),
    `team_id`    BIGINT NOT NULL,
    `last_access_time` TIMESTAMP,
    PRIMARY KEY (`user_id`)
);

CREATE TABLE `TBL_USER_PROJ`
(
    `bookmark_status`    VARCHAR(255) NOT NULL,
    `user_id`    BIGINT NOT NULL,
    `proj_id`    BIGINT NOT NULL,
    `participation_status` VARCHAR(255)
);

CREATE TABLE `TBL_USER_SCHEDULE`
(
    `user_id`    BIGINT NOT NULL,
    `schedule_id`    BIGINT NOT NULL,
    `participation_status` VARCHAR(255)
);

CREATE TABLE `TBL_VCS_ACCOUNT`
(
    `vcs__user_id`    VARCHAR(255) NOT NULL,
    `vcs_email`    VARCHAR(255) NOT NULL,
    `vcs_username`    VARCHAR(255) NOT NULL,
    `vcs_access_token`    VARCHAR(1023) NOT NULL,
    `user_id`    BIGINT NOT NULL,
    PRIMARY KEY (`vcs__user_id`)
);

CREATE TABLE `TBL_VCS_MILESTONE`
(
    `milestone_id`    BIGINT NOT NULL,
    `milestone_name`    VARCHAR(255) NOT NULL,
    `progress_status`    TINYINT NOT NULL,
    `url`    VARCHAR(1023) NOT NULL,
    `repo_id`    BIGINT NOT NULL,
    PRIMARY KEY (`milestone_id`)
);

CREATE TABLE `TBL_VCS_OBJ`
(
    `vcs_obj_id`    BIGINT NOT NULL,
    `vcs_obj_type`    VARCHAR(255) NOT NULL,
    `vcs_obj_title`    VARCHAR(255) NOT NULL,
    `vcs_obj_content`    VARCHAR(255) NOT NULL,
    `url`    VARCHAR(1023) NOT NULL,
    `vcs_obj_status`    VARCHAR(255) NOT NULL,
    `repo_id`    BIGINT NOT NULL,
    `vcs_user_id`    VARCHAR(255) NOT NULL,
    PRIMARY KEY (`vcs_obj_id`)
);

CREATE TABLE `TBL_VCS_PROJ`
(
    `vcs_proj_id`    BIGINT NOT NULL,
    `title`    VARCHAR(255) NOT NULL,
    `url`    VARCHAR(1023) NOT NULL,
    `proj_id`    BIGINT NOT NULL,
    `vcs_type` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`vcs_proj_id`)
);

CREATE TABLE `TBL_VCS_REPO`
(
    `repo_id`    BIGINT NOT NULL,
    `repo_name`    VARCHAR(255) NOT NULL,
    `url`    VARCHAR(1023) NOT NULL,
    `vcs_proj_id`    BIGINT NOT NULL,
    `workspace_id`    BIGINT NOT NULL,
    `vcs_type`    VARCHAR(255) NOT NULL,
    PRIMARY KEY (`repo_id`)
);

CREATE TABLE `TBL_WORKSPACE`
(
    `workspace_id`    BIGINT NOT NULL,
    `workspace_name`    VARCHAR(255) NOT NULL,
    `created_at`    TIMESTAMP NOT NULL,
    `progress_status`    TINYINT NOT NULL,
    `vcs_proj_id`    BIGINT,
    `proj_id`    BIGINT,
    PRIMARY KEY (`workspace_id`)
);

CREATE TABLE `워크스페이스 북마크`
(
    `user_id`    BIGINT NOT NULL,
    `workspace_id`    BIGINT NOT NULL
);

CREATE TABLE `프로젝트-일정`
(
    `project_id`    BIGINT NOT NULL,
    `schedule_id`    BIGINT NOT NULL
);

