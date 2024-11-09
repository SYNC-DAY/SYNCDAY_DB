drop database if exists syncdaydb;
create database syncdaydb;
use syncdaydb;


-- Create tables with UTF8 and auto increment
CREATE TABLE `TBL_TEAM` (
                            `team_id` BIGINT NOT NULL AUTO_INCREMENT,
                            `team_name` VARCHAR(255) NOT NULL,
                            PRIMARY KEY (`team_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;

CREATE TABLE `TBL_USER` (
                            `user_id` BIGINT NOT NULL AUTO_INCREMENT,
                            `username` VARCHAR(255) NOT NULL,
                            `email` VARCHAR(255) NOT NULL,
                            `password` VARCHAR(255) NOT NULL,
                            `phone_number` VARCHAR(255),
                            `position` VARCHAR(255),
                            `team_id` BIGINT NOT NULL,
                            `last_access_time` TIMESTAMP,
                            PRIMARY KEY (`user_id`),
                            CONSTRAINT `FK_USER_TEAM` FOREIGN KEY (`team_id`)
                                REFERENCES `TBL_TEAM` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;

CREATE TABLE `TBL_PROJ` (
                            `proj_id` BIGINT NOT NULL AUTO_INCREMENT,
                            `proj_name` VARCHAR(255) NOT NULL,
                            `start_time` TIMESTAMP,
                            `end_time` TIMESTAMP,
                            `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                            `progress_status` TINYINT NOT NULL DEFAULT 0,
                            `user_id` BIGINT NOT NULL,
                            PRIMARY KEY (`proj_id`),
                            CONSTRAINT `FK_PROJ_USER` FOREIGN KEY (`user_id`)
                                REFERENCES `TBL_USER` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;

CREATE TABLE `TBL_VCS_PROJ` (
                                `vcs_proj_id` BIGINT NOT NULL AUTO_INCREMENT,
                                `title` VARCHAR(255) NOT NULL,
                                `url` VARCHAR(1023) NOT NULL,
                                `proj_id` BIGINT NOT NULL,
                                `vcs_type` VARCHAR(255) NOT NULL,
                                PRIMARY KEY (`vcs_proj_id`),
                                CONSTRAINT `FK_VCS_PROJ_PROJ` FOREIGN KEY (`proj_id`)
                                    REFERENCES `TBL_PROJ` (`proj_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;

CREATE TABLE `TBL_WORKSPACE` (
                                 `workspace_id` BIGINT NOT NULL AUTO_INCREMENT,
                                 `workspace_name` VARCHAR(255) NOT NULL,
                                 `created_at` TIMESTAMP NOT NULL,
                                 `progress_status` TINYINT NOT NULL,
                                 `vcs_proj_id` BIGINT,
                                 `proj_id` BIGINT,
                                 PRIMARY KEY (`workspace_id`),
                                 CONSTRAINT `FK_WORKSPACE_VCS_PROJ` FOREIGN KEY (`vcs_proj_id`)
                                     REFERENCES `TBL_VCS_PROJ` (`vcs_proj_id`) ON DELETE SET NULL ON UPDATE CASCADE,
                                 CONSTRAINT `FK_WORKSPACE_PROJ` FOREIGN KEY (`proj_id`)
                                     REFERENCES `TBL_PROJ` (`proj_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;

CREATE TABLE `TBL_VCS_REPO` (
                                `repo_id` BIGINT NOT NULL AUTO_INCREMENT,
                                `repo_name` VARCHAR(255) NOT NULL,
                                `url` VARCHAR(1023) NOT NULL,
                                `vcs_proj_id` BIGINT NOT NULL,
                                `workspace_id` BIGINT NOT NULL,
                                `vcs_type` VARCHAR(255) NOT NULL,
                                PRIMARY KEY (`repo_id`),
                                CONSTRAINT `FK_REPO_VCS_PROJ` FOREIGN KEY (`vcs_proj_id`)
                                    REFERENCES `TBL_VCS_PROJ` (`vcs_proj_id`) ON DELETE CASCADE ON UPDATE CASCADE,
                                CONSTRAINT `FK_REPO_WORKSPACE` FOREIGN KEY (`workspace_id`)
                                    REFERENCES `TBL_WORKSPACE` (`workspace_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;

CREATE TABLE `TBL_VCS_MILESTONE` (
                                     `milestone_id` BIGINT NOT NULL AUTO_INCREMENT,
                                     `milestone_name` VARCHAR(255) NOT NULL,
                                     `progress_status` TINYINT NOT NULL,
                                     `url` VARCHAR(1023) NOT NULL,
                                     `repo_id` BIGINT NOT NULL,
                                     PRIMARY KEY (`milestone_id`),
                                     CONSTRAINT `FK_MILESTONE_REPO` FOREIGN KEY (`repo_id`)
                                         REFERENCES `TBL_VCS_REPO` (`repo_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;

CREATE TABLE `TBL_VCS_ACCOUNT` (
                                   `vcs__user_id` VARCHAR(255) NOT NULL,
                                   `vcs_email` VARCHAR(255) NOT NULL,
                                   `vcs_username` VARCHAR(255) NOT NULL,
                                   `vcs_access_token` VARCHAR(1023) NOT NULL,
                                   `user_id` BIGINT NOT NULL,
    `vcs_type` VARCHAR(255) NOT NULL,
                                   PRIMARY KEY (`vcs__user_id`),
                                   CONSTRAINT `FK_VCS_ACCOUNT_USER` FOREIGN KEY (`user_id`)
                                       REFERENCES `TBL_USER` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

CREATE TABLE `TBL_VCS_OBJ` (
                               `vcs_obj_id` BIGINT NOT NULL AUTO_INCREMENT,
                               `vcs_obj_type` VARCHAR(255) NOT NULL,
                               `vcs_obj_title` VARCHAR(255) NOT NULL,
                               `vcs_obj_content` VARCHAR(255) NOT NULL,
                               `url` VARCHAR(1023) NOT NULL,
                               `vcs_obj_status` VARCHAR(255) NOT NULL,
                               `repo_id` BIGINT NOT NULL,
                               `vcs_user_id` VARCHAR(255) NOT NULL,
                               PRIMARY KEY (`vcs_obj_id`),
                               CONSTRAINT `FK_VCS_OBJ_REPO` FOREIGN KEY (`repo_id`)
                                   REFERENCES `TBL_VCS_REPO` (`repo_id`) ON DELETE CASCADE ON UPDATE CASCADE,
                               CONSTRAINT `FK_VCS_OBJ_USER` FOREIGN KEY (`vcs_user_id`)
                                   REFERENCES `TBL_VCS_ACCOUNT` (`vcs__user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;

CREATE TABLE `TBL_CARD_BOARD` (
                                  `card_board_id` BIGINT NOT NULL AUTO_INCREMENT,
                                  `title` VARCHAR(255) NOT NULL,
                                  `created_at` TIMESTAMP NOT NULL,
                                  `start_time` TIMESTAMP,
                                  `end_time` TIMESTAMP,
                                  `progress_status` TINYINT NOT NULL,
                                  `milestone_id` BIGINT,
                                  `workspace_id` BIGINT NOT NULL,
                                  PRIMARY KEY (`card_board_id`),
                                  CONSTRAINT `FK_CARD_BOARD_MILESTONE` FOREIGN KEY (`milestone_id`)
                                      REFERENCES `TBL_VCS_MILESTONE` (`milestone_id`) ON DELETE SET NULL ON UPDATE CASCADE,
                                  CONSTRAINT `FK_CARD_BOARD_WORKSPACE` FOREIGN KEY (`workspace_id`)
                                      REFERENCES `TBL_WORKSPACE` (`workspace_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;

CREATE TABLE `TBL_TAG` (
                                `tag_id` BIGINT NOT NULL AUTO_INCREMENT,
                                `tag_name` VARCHAR(255) NOT NULL,
                                `color` VARCHAR(255) NOT NULL,
                                `workspace_id` BIGINT NOT NULL,
                                PRIMARY KEY (`tag_id`),
                                CONSTRAINT `FK_TAG_WORKSPACE` FOREIGN KEY (`workspace_id`)
                                    REFERENCES `TBL_WORKSPACE` (`workspace_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;

CREATE TABLE `TBL_CARD` (
                            `card_id` BIGINT NOT NULL AUTO_INCREMENT,
                            `title` VARCHAR(255) NOT NULL,
                            `content` VARCHAR(1023),
                            `created_at` TIMESTAMP NOT NULL,
                            `card_board_id` BIGINT NOT NULL,
                            `tag_id` BIGINT,
                            `vcs_obj_id` BIGINT,
                            `author` BIGINT NOT NULL,
                            `end_time` TIMESTAMP,
                            `user_id` BIGINT,
                            PRIMARY KEY (`card_id`),
                            CONSTRAINT `FK_CARD_BOARD` FOREIGN KEY (`card_board_id`)
                                REFERENCES `TBL_CARD_BOARD` (`card_board_id`) ON DELETE CASCADE ON UPDATE CASCADE,
                            CONSTRAINT `FK_CARD_TAG` FOREIGN KEY (`tag_id`)
                                REFERENCES `TBL_TAG` (`tag_id`) ON DELETE SET NULL ON UPDATE CASCADE,
                            CONSTRAINT `FK_CARD_VCS_OBJ` FOREIGN KEY (`vcs_obj_id`)
                                REFERENCES `TBL_VCS_OBJ` (`vcs_obj_id`) ON DELETE SET NULL ON UPDATE CASCADE,
                            CONSTRAINT `FK_CARD_AUTHOR` FOREIGN KEY (`author`)
                                REFERENCES `TBL_USER` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
                            CONSTRAINT `FK_CARD_USER` FOREIGN KEY (`user_id`)
                                REFERENCES `TBL_USER` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;

CREATE TABLE `TBL_CARD_ATTACHMENTS` (
                                        `attachment_id` BIGINT NOT NULL AUTO_INCREMENT,
                                        `description` VARCHAR(255),
                                        `content` TEXT NOT NULL,
                                        `card_id` BIGINT NOT NULL,
                                        PRIMARY KEY (`attachment_id`),
                                        CONSTRAINT `FK_ATTACHMENT_CARD` FOREIGN KEY (`card_id`)
                                            REFERENCES `TBL_CARD` (`card_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;

CREATE TABLE `TBL_CARD_BOOKMARK` (
                                     `user_id` BIGINT NOT NULL,
                                     `card_id` BIGINT NOT NULL,
                                     PRIMARY KEY (`user_id`, `card_id`),
                                     CONSTRAINT `FK_BOOKMARK_USER` FOREIGN KEY (`user_id`)
                                         REFERENCES `TBL_USER` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
                                     CONSTRAINT `FK_BOOKMARK_CARD` FOREIGN KEY (`card_id`)
                                         REFERENCES `TBL_CARD` (`card_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;


CREATE TABLE `TBL_CARD_COMMENT` (
                                    `card_comment_id` BIGINT NOT NULL AUTO_INCREMENT,
                                    `content` VARCHAR(1023) NOT NULL,
                                    `created_at` TIMESTAMP NOT NULL,
                                    `updated_at` TIMESTAMP NOT NULL,
                                    `user_id` BIGINT NOT NULL,
                                    `card_id` BIGINT NOT NULL,
                                    PRIMARY KEY (`card_comment_id`),
                                    CONSTRAINT `FK_COMMENT_USER` FOREIGN KEY (`user_id`)
                                        REFERENCES `TBL_USER` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
                                    CONSTRAINT `FK_COMMENT_CARD` FOREIGN KEY (`card_id`)
                                        REFERENCES `TBL_CARD` (`card_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;

CREATE TABLE `TBL_CHECKLIST` (
                                 `checklist_id` BIGINT NOT NULL AUTO_INCREMENT,
                                 `title` VARCHAR(255) NOT NULL,
                                 `card_id` BIGINT NOT NULL,
                                 PRIMARY KEY (`checklist_id`),
                                 CONSTRAINT `FK_CHECKLIST_CARD` FOREIGN KEY (`card_id`)
                                     REFERENCES `TBL_CARD` (`card_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;

CREATE TABLE `TBL_CHECKLIST_ITEM` (
                                      `item_number` TINYINT NOT NULL,
                                      `complete_status` VARCHAR(255) NOT NULL,
                                      `content` VARCHAR(511) NOT NULL,
                                      `card_id` BIGINT NOT NULL,
                                      PRIMARY KEY (`card_id`,`item_number`),
                                      CONSTRAINT `FK_CHECKLIST_ITEM_CARD` FOREIGN KEY (`card_id`)
                                          REFERENCES `TBL_CARD` (`card_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

CREATE TABLE `TBL_MEETINGROOM` (
                                   `meetingroom_id` BIGINT NOT NULL AUTO_INCREMENT,
                                   `team_id` BIGINT NOT NULL,
                                   `meetingroom_name` VARCHAR(255),
                                   PRIMARY KEY (`meetingroom_id`),
                                   CONSTRAINT `FK_MEETINGROOM_TEAM` FOREIGN KEY (`team_id`)
                                       REFERENCES `TBL_TEAM` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;

CREATE TABLE `TBL_SCHEDULE` (
                                `schedule_id` BIGINT NOT NULL AUTO_INCREMENT,
                                `title` VARCHAR(255) NOT NULL,
                                `content` VARCHAR(511),
                                `start_time` TIMESTAMP NOT NULL,
                                `end_time` TIMESTAMP NOT NULL,
                                `public_status` VARCHAR(255) NOT NULL,
                                `repeat_status` VARCHAR(255) NOT NULL,
                                `repeat_property` VARCHAR(255),
                                `meetingroom_id` BIGINT,
                                `user_id` BIGINT NOT NULL,
                                PRIMARY KEY (`schedule_id`),
                                CONSTRAINT `FK_SCHEDULE_MEETINGROOM` FOREIGN KEY (`meetingroom_id`)
                                    REFERENCES `TBL_MEETINGROOM` (`meetingroom_id`) ON DELETE SET NULL ON UPDATE CASCADE,
                                CONSTRAINT `FK_SCHEDULE_USER` FOREIGN KEY (`user_id`)
                                    REFERENCES `TBL_USER` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;

CREATE TABLE `TBL_MEETING_NOTE` (
                                    `schedule_id` BIGINT NOT NULL,
                                    `title` VARCHAR(1023),
                                    `content` TEXT,
                                    PRIMARY KEY (`schedule_id`),
                                    CONSTRAINT `FK_MEETING_NOTE_SCHEDULE` FOREIGN KEY (`schedule_id`)
                                        REFERENCES `TBL_SCHEDULE` (`schedule_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

CREATE TABLE `TBL_TEAM_BOARD` (
                                  `team_board_id` BIGINT NOT NULL AUTO_INCREMENT,
                                  `team_id` BIGINT NOT NULL,
                                  `board_title` VARCHAR(255) NOT NULL,
                                  PRIMARY KEY (`team_board_id`),
                                  CONSTRAINT `FK_TEAM_BOARD_TEAM` FOREIGN KEY (`team_id`)
                                      REFERENCES `TBL_TEAM` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;

CREATE TABLE `TBL_TEAM_POST` (
                                 `team_post_id` BIGINT NOT NULL AUTO_INCREMENT,
                                 `title` VARCHAR(255) NOT NULL,
                                 `content` TEXT NOT NULL,
                                 `created_at` TIMESTAMP NOT NULL,
                                 `updated_at` TIMESTAMP NOT NULL,
                                 `user_id` BIGINT NOT NULL,
                                 `team_board_id` BIGINT NOT NULL,
                                 PRIMARY KEY (`team_post_id`),
                                 CONSTRAINT `FK_TEAM_POST_USER` FOREIGN KEY (`user_id`)
                                     REFERENCES `TBL_USER` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
                                 CONSTRAINT `FK_TEAM_POST_BOARD` FOREIGN KEY (`team_board_id`)
                                     REFERENCES `TBL_TEAM_BOARD` (`team_board_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;

CREATE TABLE `TBL_TEAM_COMMENT` (
                                    `team_comment_id` BIGINT NOT NULL AUTO_INCREMENT,
                                    `created_at` TIMESTAMP NOT NULL,
                                    `updated_at` TIMESTAMP NOT NULL,
                                    `team_post_id` BIGINT NOT NULL,
                                    `author` BIGINT NOT NULL,
                                    PRIMARY KEY (`team_comment_id`),
                                    CONSTRAINT `FK_TEAM_COMMENT_POST` FOREIGN KEY (`team_post_id`)
                                        REFERENCES `TBL_TEAM_POST` (`team_post_id`) ON DELETE CASCADE ON UPDATE CASCADE,
                                    CONSTRAINT `FK_TEAM_COMMENT_AUTHOR` FOREIGN KEY (`author`)
                                        REFERENCES `TBL_USER` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;

CREATE TABLE `TBL_TEAM_SCHEDULE` (
                                     `team_id` BIGINT NOT NULL,
                                     `schedule_id` BIGINT NOT NULL,
                                     PRIMARY KEY (`team_id`, `schedule_id`),
                                     CONSTRAINT `FK_TEAM_SCHEDULE_TEAM` FOREIGN KEY (`team_id`)
                                         REFERENCES `TBL_TEAM` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE,
                                     CONSTRAINT `FK_TEAM_SCHEDULE_SCHEDULE` FOREIGN KEY (`schedule_id`)
                                         REFERENCES `TBL_SCHEDULE` (`schedule_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

CREATE TABLE `TBL_TEAM_WORK` (
                                 `team_work_id` BIGINT NOT NULL AUTO_INCREMENT,
                                 `title` VARCHAR(255) NOT NULL,
                                 `content` VARCHAR(1023) NOT NULL,
                                 `created_at` TIMESTAMP NOT NULL,
                                 `start_time` TIMESTAMP,
                                 `end_time` TIMESTAMP NOT NULL,
                                 `assignee_id` BIGINT,
                                 `status` VARCHAR(255) NOT NULL,
                                 `team_id` BIGINT NOT NULL,
                                 `user_id` BIGINT NOT NULL,
                                 PRIMARY KEY (`team_work_id`),
                                 CONSTRAINT `FK_TEAM_WORK_TEAM` FOREIGN KEY (`team_id`)
                                     REFERENCES `TBL_TEAM` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE,
                                 CONSTRAINT `FK_TEAM_WORK_USER` FOREIGN KEY (`user_id`)
                                     REFERENCES `TBL_USER` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
                                 CONSTRAINT `FK_TEAM_WORK_ASSIGNEE` FOREIGN KEY (`assignee_id`)
                                     REFERENCES `TBL_USER` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;

CREATE TABLE `TBL_USER_PROJ` (
                                 `user_id` BIGINT NOT NULL,
                                 `proj_id` BIGINT NOT NULL,
                                 `bookmark_status` VARCHAR(255) NOT NULL,
                                 `participation_status` VARCHAR(255),
                                 PRIMARY KEY (`user_id`, `proj_id`),
                                 CONSTRAINT `FK_USER_PROJ_USER` FOREIGN KEY (`user_id`)
                                     REFERENCES `TBL_USER` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
                                 CONSTRAINT `FK_USER_PROJ_PROJ` FOREIGN KEY (`proj_id`)
                                     REFERENCES `TBL_PROJ` (`proj_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

CREATE TABLE `TBL_USER_SCHEDULE` (
                                     `user_id` BIGINT NOT NULL,
                                     `schedule_id` BIGINT NOT NULL,
                                     `participation_status` VARCHAR(255),
                                     PRIMARY KEY (`user_id`, `schedule_id`),
                                     CONSTRAINT `FK_USER_SCHEDULE_USER` FOREIGN KEY (`user_id`)
                                         REFERENCES `TBL_USER` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
                                     CONSTRAINT `FK_USER_SCHEDULE_SCHEDULE` FOREIGN KEY (`schedule_id`)
                                         REFERENCES `TBL_SCHEDULE` (`schedule_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

CREATE TABLE `TBL_WORKSPACE_BOOKMARK` (
                              `user_id` BIGINT NOT NULL,
                              `workspace_id` BIGINT NOT NULL,
                              PRIMARY KEY (`user_id`, `workspace_id`),
                              CONSTRAINT `FK_WORKSPACE_BOOKMARK_USER` FOREIGN KEY (`user_id`)
                                  REFERENCES `TBL_USER` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
                              CONSTRAINT `FK_WORKSPACE_BOOKMARK_WORKSPACE` FOREIGN KEY (`workspace_id`)
                                  REFERENCES `TBL_WORKSPACE` (`workspace_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

CREATE TABLE `TBL_PROJ_SCHEDULE` (
                           `project_id` BIGINT NOT NULL,
                           `schedule_id` BIGINT NOT NULL,
                           PRIMARY KEY (`project_id`, `schedule_id`),
                           CONSTRAINT `FK_PROJ_SCHEDULE_PROJ` FOREIGN KEY (`project_id`)
                               REFERENCES `TBL_PROJ` (`proj_id`) ON DELETE CASCADE ON UPDATE CASCADE,
                           CONSTRAINT `FK_PROJ_SCHEDULE_SCHEDULE` FOREIGN KEY (`schedule_id`)
                               REFERENCES `TBL_SCHEDULE` (`schedule_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;
