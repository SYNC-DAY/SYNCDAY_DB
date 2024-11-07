
-- syncdaydb
drop database if exists syncdaydb;
create database syncdaydb;
use syncdaydb;


-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS=0;

-- Drop tables if they exist
DROP TABLE IF EXISTS `TBL_ALERT`;
DROP TABLE IF EXISTS `TBL_CARD`;
DROP TABLE IF EXISTS `TBL_CARD_ATTACHMENTS`;
DROP TABLE IF EXISTS `TBL_CARD_BOARD`;
DROP TABLE IF EXISTS `TBL_CARD_COMMENT`;
DROP TABLE IF EXISTS `TBL_CARD_TAG`;
DROP TABLE IF EXISTS `TBL_CHECKLIST`;
DROP TABLE IF EXISTS `TBL_CHECKLIST_ITEM`;
DROP TABLE IF EXISTS `TBL_CARD_LIKE&BOOKMARK`;
DROP TABLE IF EXISTS `TBL_MEETINGROOM`;
DROP TABLE IF EXISTS `TBL_PROJ`;
DROP TABLE IF EXISTS `TBL_SCHEDULE`;
DROP TABLE IF EXISTS `TBL_TEAM`;
DROP TABLE IF EXISTS `TBL_TEAM_BOARD`;
DROP TABLE IF EXISTS `TBL_TEAM_COMMENT`;
DROP TABLE IF EXISTS `TBL_TEAM_POST`;
DROP TABLE IF EXISTS `TBL_TEAM_WORK`;
DROP TABLE IF EXISTS `TBL_USER`;
DROP TABLE IF EXISTS `TBL_USER_PROJ`;
DROP TABLE IF EXISTS `TBL_USER_SCHEDULE`;
DROP TABLE IF EXISTS `TBL_VCS_ACCOUNT`;
DROP TABLE IF EXISTS `TBL_VCS_MILESTONE`;
DROP TABLE IF EXISTS `TBL_VCS_OBJ`;
DROP TABLE IF EXISTS `TBL_VCS_PROJ`;
DROP TABLE IF EXISTS `TBL_VCS_REPO`;
DROP TABLE IF EXISTS `TBL_WORKSPACE`;

-- Enable foreign key checks
SET FOREIGN_KEY_CHECKS=1;

-- Create tables
CREATE TABLE `TBL_ALERT` (
                             `related_domain` VARCHAR(255) NOT NULL COMMENT '출처구분',
                             `alert_time` TIMESTAMP NOT NULL COMMENT '알림시각',
                             `read_status` VARCHAR(255) NOT NULL COMMENT '읽음상태',
                             `alert_type` VARCHAR(255) NOT NULL COMMENT '알림종류',
                             `related_id` BIGINT NOT NULL COMMENT '출처ID',
                             `sender_id` BIGINT COMMENT '발신자ID',
                             `receiver_id` BIGINT NOT NULL COMMENT '수신자ID'
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8  COMMENT='알림';

CREATE TABLE `TBL_CARD` (
                            `card_id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '카드ID',
                            `title` VARCHAR(255) NOT NULL COMMENT '제목',
                            `content` VARCHAR(1023) COMMENT '내용',
                            `status` VARCHAR(255) COMMENT '업무',
                            `start_time` TIMESTAMP COMMENT '시작시각',
                            `end_time` TIMESTAMP COMMENT '종료시각',
                            `assignee_id` BIGINT COMMENT '담당자ID',
                            `created_at` TIMESTAMP NOT NULL COMMENT '생성시각',
                            `card_board_id` BIGINT NOT NULL COMMENT '카드보드ID',
                            `tag_id` BIGINT COMMENT '태그ID',
                            `vcs_obj_id` BIGINT COMMENT 'VCS 객체 ID',
                            `author` BIGINT NOT NULL COMMENT '작성자ID',
                            PRIMARY KEY (`card_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8  COMMENT='카드';

CREATE TABLE `TBL_CARD_ATTACHMENTS` (
                                        `description` VARCHAR(255) COMMENT '설명',
                                        `content` BLOB NOT NULL COMMENT '내용',
                                        `card_id` BIGINT NOT NULL COMMENT '카드ID'
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8  COMMENT='카드 첨부파일';

CREATE TABLE `TBL_CARD_BOARD` (
                                  `card_board_id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '카드보드ID',
                                  `title` VARCHAR(255) NOT NULL COMMENT '이름',
                                  `created_at` TIMESTAMP NOT NULL COMMENT '생성일자',
                                  `start_time` TIMESTAMP COMMENT '시작일자',
                                  `end_time` TIMESTAMP COMMENT '종료일자',
                                  `progress_status` TINYINT NOT NULL COMMENT '진척도',
                                  `milestone_id` BIGINT COMMENT '마일스톤 ID',
                                  `workspace_id` BIGINT NOT NULL COMMENT '워크스페이스ID',
                                  PRIMARY KEY (`card_board_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8  COMMENT='카드보드';

CREATE TABLE `TBL_CARD_COMMENT` (
                                    `card_comment_id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '댓글ID',
                                    `content` VARCHAR(1023) NOT NULL COMMENT '댓글 내용',
                                    `created_at` TIMESTAMP NOT NULL COMMENT '생성시각',
                                    `updated_at` TIMESTAMP NOT NULL COMMENT '수정시각',
                                    `user_id` BIGINT NOT NULL COMMENT '회원ID',
                                    `card_id` BIGINT NOT NULL COMMENT '카드ID',
                                    PRIMARY KEY (`card_comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8  COMMENT='카드 댓글';

CREATE TABLE `TBL_CARD_TAG` (
                                `tag_id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '태그ID',
                                `tag_name` VARCHAR(255) NOT NULL COMMENT '태그명',
                                `color` VARCHAR(255) NOT NULL COMMENT '색깔',
                                `workspace_id` BIGINT NOT NULL COMMENT '워크스페이스ID',
                                PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8  COMMENT='카드태그';

CREATE TABLE `TBL_CHECKLIST` (
                                 `title` VARCHAR(255) NOT NULL COMMENT '체크리스트제목',
                                 `card_id` BIGINT NOT NULL COMMENT '카드ID',
                                 PRIMARY KEY (`card_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8  COMMENT='체크리스트';

CREATE TABLE `TBL_CHECKLIST_ITEM` (
                                      `item_number` TINYINT NOT NULL COMMENT '항목번호',
                                      `complete_status` VARCHAR(255) NOT NULL COMMENT '완료여부',
                                      `content` VARCHAR(511) NOT NULL COMMENT '항목내용',
                                      `card_id` BIGINT NOT NULL COMMENT '카드ID',
                                      PRIMARY KEY (`card_id`, `item_number`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8  COMMENT='체크리스트항목';

CREATE TABLE `TBL_CARD_LIKE&BOOKMARK` (
                                     `flag` VARCHAR(255) NOT NULL COMMENT '플래그 값',
                                     `user_id` BIGINT NOT NULL COMMENT '회원ID',
                                     `card_id` BIGINT NOT NULL COMMENT '카드ID'
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8  COMMENT='카드 좋아요, 북마크';

CREATE TABLE `TBL_WORKSPACE_BOOKMARK` (
                                          `user_id` BIGINT NOT NULL COMMENT '회원ID',
                                          `workspace_id` BIGINT NOT NULL COMMENT '카드ID'
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8  COMMENT='카드 좋아요, 북마크';


CREATE TABLE `TBL_MEETINGROOM` (
                                   `meetingroom_id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '회의실ID',
                                   `team_id` BIGINT NOT NULL COMMENT '팀ID',
                                   PRIMARY KEY (`meetingroom_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8  COMMENT='회의실';

CREATE TABLE `TBL_PROJ` (
                            `proj_id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '프로젝트ID',
                            `proj_name` VARCHAR(255) NOT NULL COMMENT '프로젝트명',
                            `proj_start_time` TIMESTAMP COMMENT '시작일자',
                            `proj_end_time` TIMESTAMP COMMENT '종료일자',
                            `proj_created_at` TIMESTAMP NOT NULL COMMENT '생성일자',
                            `progress_status` TINYINT NOT NULL COMMENT '진척도',
                            `user_id` BIGINT NOT NULL COMMENT '작성자ID',
                            PRIMARY KEY (`proj_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8  COMMENT='프로젝트';

CREATE TABLE `TBL_SCHEDULE` (
                                `schedule_id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '일정ID',
                                `title` VARCHAR(255) NOT NULL COMMENT '제목',
                                `content` VARCHAR(511) COMMENT '내용',
                                `start_time` TIMESTAMP NOT NULL COMMENT '시작시각',
                                `end_time` TIMESTAMP NOT NULL COMMENT '종료시각',
                                `public_status` VARCHAR(255) NOT NULL COMMENT '공개여부',
                                `repeat_status` VARCHAR(255) NOT NULL COMMENT '반복여부',
                                `repeat_property` VARCHAR(255) COMMENT '반복속성',
                                `meetingroom_id` BIGINT COMMENT '회의실ID',
                                `user_id` BIGINT NOT NULL COMMENT '호스트ID',
                                `related_domain` VARCHAR(255) COMMENT '연관 도메인',
                                `team_id` BIGINT COMMENT '팀ID',
                                `proj_id` BIGINT COMMENT '프로젝트ID',
                                PRIMARY KEY (`schedule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8  COMMENT='일정';

CREATE TABLE `TBL_TEAM` (
                            `team_id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '팀ID',
                            `team_name` VARCHAR(255) NOT NULL COMMENT '팀 이름',
                            PRIMARY KEY (`team_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8  COMMENT='팀';

CREATE TABLE `TBL_TEAM_BOARD` (
                                  `team_board_id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '팀게시판ID',
                                  `team_id` BIGINT NOT NULL COMMENT '팀ID',
                                  PRIMARY KEY (`team_board_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8  COMMENT='팀 게시판';

CREATE TABLE `TBL_TEAM_COMMENT` (
                                    `team_comment_id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '팀 댓글ID',
                                    `created_at` TIMESTAMP NOT NULL COMMENT '생성시각',
                                    `updated_at` TIMESTAMP NOT NULL COMMENT '수정시각',
                                    `team_post_id` BIGINT NOT NULL COMMENT '팀 게시글ID',
                                    `author` BIGINT NOT NULL COMMENT '작성자ID',
                                    PRIMARY KEY (`team_comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8  COMMENT='팀 댓글';

CREATE TABLE `TBL_TEAM_POST` (
                                 `team_post_id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '팀 게시글ID',
                                 `title` VARCHAR(255) NOT NULL COMMENT '제목',
                                 `content` TEXT NOT NULL COMMENT '내용',
                                 `created_at` TIMESTAMP NOT NULL COMMENT '생성시각',
                                 `updated_at` TIMESTAMP NOT NULL COMMENT '수정시각',
                                 `user_id` BIGINT NOT NULL COMMENT '작성자ID',
                                 `team_board_id` BIGINT NOT NULL COMMENT '팀게시판ID',
                                 PRIMARY KEY (`team_post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8  COMMENT='팀 게시글';

CREATE TABLE `TBL_TEAM_WORK` (
                                 `title` VARCHAR(255) NOT NULL COMMENT '팀업무제목',
                                 `content` VARCHAR(1023) NOT NULL COMMENT '팀 업무 내용',
                                 `created_at` TIMESTAMP NOT NULL COMMENT '생성시각',
                                 `start_time` TIMESTAMP COMMENT '시작시각',
                                 `end_time` TIMESTAMP NOT NULL COMMENT '종료시각',
                                 `assignee_id` BIGINT COMMENT '담당자ID',
                                 `status` VARCHAR(255) NOT NULL COMMENT 'status',
                                 `team_id` BIGINT NOT NULL COMMENT '팀ID',
                                 `user_id` BIGINT NOT NULL COMMENT '작성자ID'
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8  COMMENT='팀 업무';

CREATE TABLE `TBL_USER` (
                            `user_id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '회원ID',
                            `username` VARCHAR(255) NOT NULL COMMENT '회원명',
                            `email` VARCHAR(255) NOT NULL COMMENT '이메일',
                            `password` VARCHAR(255) NOT NULL COMMENT '비밀번호',
                            `phone_number` VARCHAR(255) COMMENT '전화번호',
                            `position` VARCHAR(255) COMMENT '직급',
                            `team_id` BIGINT NOT NULL COMMENT '팀ID',
                            PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8  COMMENT='회원';

CREATE TABLE `TBL_USER_PROJ` (
                                 `bookmark_status` VARCHAR(255) NOT NULL COMMENT '북마크여부',
                                 `user_id` BIGINT NOT NULL COMMENT '회원ID',
                                 `proj_id` BIGINT NOT NULL COMMENT '프로젝트ID'
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8  COMMENT='회원-프로젝트';

CREATE TABLE `TBL_USER_SCHEDULE` (
                                     `user_id` BIGINT NOT NULL COMMENT '회원ID',
                                     `schedule_id` BIGINT NOT NULL COMMENT '일정ID'
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8  COMMENT='회원-일정';

CREATE TABLE `TBL_VCS_ACCOUNT` (
                                   `vcs_user_id` VARCHAR(255) NOT NULL COMMENT 'VCS 아이디',
                                   `vcs_email` VARCHAR(255) NOT NULL COMMENT 'VCS 이메일',
                                   `vcs_username` VARCHAR(255) NOT NULL COMMENT 'VCS 사용자명',
                                   `vcs_access_token` VARCHAR(1023) NOT NULL COMMENT 'VCS 액세스 토큰',
                                   `user_id` BIGINT NOT NULL COMMENT '회원ID',
                                   PRIMARY KEY (`vcs_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8  COMMENT='VCS 계정';

CREATE TABLE `TBL_VCS_MILESTONE` (
                                     `milestone_id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '마일스톤 ID',
                                     `milestone_name` VARCHAR(255) NOT NULL COMMENT '마일스톤 이름',
                                     `progress_status` TINYINT NOT NULL COMMENT '마일스톤 진척도',
                                     `url` VARCHAR(1023) NOT NULL COMMENT '마일스톤 URL',
                                     `repo_id` BIGINT NOT NULL COMMENT '저장소ID',
                                     PRIMARY KEY (`milestone_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8  COMMENT='VCS 마일스톤';

CREATE TABLE `TBL_VCS_OBJ` (
                               `vcs_obj_id` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'VCS 객체 ID',
                               `vcs_obj_type` VARCHAR(255) NOT NULL COMMENT 'VCS 객체 종류',
                               `vcs_obj_title` VARCHAR(255) NOT NULL COMMENT 'VCS 객체 이름',
                               `vcs_obj_content` VARCHAR(255) NOT NULL COMMENT 'VCS 객체 내용',
                               `url` VARCHAR(1023) NOT NULL COMMENT 'VCS 객체 URL',
                               `vcs_obj_status` VARCHAR(255) NOT NULL COMMENT '객체 상태',
                               `repo_id` BIGINT NOT NULL COMMENT '저장소ID',
                               `vcs_user_id` VARCHAR(255) NOT NULL COMMENT 'VCS 아이디',
                               PRIMARY KEY (`vcs_obj_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8  COMMENT='VCS 객체';

CREATE TABLE `TBL_VCS_PROJ` (
                                `vcs_proj_id` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'VCS 프로젝트ID',
                                `title` VARCHAR(255) NOT NULL COMMENT 'VCS 프로젝트 이름',
                                `url` VARCHAR(1023) NOT NULL COMMENT 'VCS 프로젝트URL',
                                `proj_id` BIGINT NOT NULL COMMENT '프로젝트ID',
                                PRIMARY KEY (`vcs_proj_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8  COMMENT='VCS프로젝트';

CREATE TABLE `TBL_VCS_REPO` (
                                `repo_id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '저장소ID',
                                `repo_name` VARCHAR(255) NOT NULL COMMENT '저장소 이름',
                                `url` VARCHAR(1023) NOT NULL COMMENT '저장소 URL',
                                `vcs_proj_id` BIGINT NOT NULL COMMENT 'VCS 프로젝트ID',
                                `workspace_id` BIGINT NOT NULL COMMENT '워크스페이스ID',
                                PRIMARY KEY (`repo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8  COMMENT='VCS 저장소';

CREATE TABLE `TBL_WORKSPACE` (
                                 `workspace_id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '워크스페이스ID',
                                 `workspace_name` VARCHAR(255) NOT NULL COMMENT '워크스페이스이름',
                                 `created_at` TIMESTAMP NOT NULL COMMENT '생성일자',
                                 `progress_status` TINYINT NOT NULL COMMENT '진척도',
                                 `vcs_proj_id` BIGINT COMMENT 'VCS 프로젝트ID',
                                 `proj_id` BIGINT NOT NULL COMMENT '프로젝트ID',
                                 PRIMARY KEY (`workspace_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8  COMMENT='워크스페이스';

-- TBL_ALERT Foreign Keys
ALTER TABLE `TBL_ALERT`
    ADD CONSTRAINT `FK_ALERT_SENDER` FOREIGN KEY (`sender_id`) REFERENCES `TBL_USER` (`user_id`),
    ADD CONSTRAINT `FK_ALERT_RECEIVER` FOREIGN KEY (`receiver_id`) REFERENCES `TBL_USER` (`user_id`);

-- TBL_CARD Foreign Keys
ALTER TABLE `TBL_CARD`
    ADD CONSTRAINT `FK_CARD_ASSIGNEE` FOREIGN KEY (`assignee_id`) REFERENCES `TBL_USER` (`user_id`),
    ADD CONSTRAINT `FK_CARD_BOARD` FOREIGN KEY (`card_board_id`) REFERENCES `TBL_CARD_BOARD` (`card_board_id`),
    ADD CONSTRAINT `FK_CARD_TAG` FOREIGN KEY (`tag_id`) REFERENCES `TBL_CARD_TAG` (`tag_id`),
    ADD CONSTRAINT `FK_CARD_VCS_OBJ` FOREIGN KEY (`vcs_obj_id`) REFERENCES `TBL_VCS_OBJ` (`vcs_obj_id`),
    ADD CONSTRAINT `FK_CARD_AUTHOR` FOREIGN KEY (`author`) REFERENCES `TBL_USER` (`user_id`);

-- TBL_CARD_ATTACHMENTS Foreign Key
ALTER TABLE `TBL_CARD_ATTACHMENTS`
    ADD CONSTRAINT `FK_CARD_ATTACHMENTS_CARD` FOREIGN KEY (`card_id`) REFERENCES `TBL_CARD` (`card_id`);

-- TBL_CARD_BOARD Foreign Keys
ALTER TABLE `TBL_CARD_BOARD`
    ADD CONSTRAINT `FK_CARD_BOARD_MILESTONE` FOREIGN KEY (`milestone_id`) REFERENCES `TBL_VCS_MILESTONE` (`milestone_id`),
    ADD CONSTRAINT `FK_CARD_BOARD_WORKSPACE` FOREIGN KEY (`workspace_id`) REFERENCES `TBL_WORKSPACE` (`workspace_id`);

-- TBL_CARD_COMMENT Foreign Keys
ALTER TABLE `TBL_CARD_COMMENT`
    ADD CONSTRAINT `FK_CARD_COMMENT_USER` FOREIGN KEY (`user_id`) REFERENCES `TBL_USER` (`user_id`),
    ADD CONSTRAINT `FK_CARD_COMMENT_CARD` FOREIGN KEY (`card_id`) REFERENCES `TBL_CARD` (`card_id`);

-- TBL_CARD_TAG Foreign Key
ALTER TABLE `TBL_CARD_TAG`
    ADD CONSTRAINT `FK_CARD_TAG_WORKSPACE` FOREIGN KEY (`workspace_id`) REFERENCES `TBL_WORKSPACE` (`workspace_id`);

-- TBL_CHECKLIST Foreign Key
ALTER TABLE `TBL_CHECKLIST`
    ADD CONSTRAINT `FK_CHECKLIST_CARD` FOREIGN KEY (`card_id`) REFERENCES `TBL_CARD` (`card_id`);

-- TBL_CHECKLIST_ITEM Foreign Key
ALTER TABLE `TBL_CHECKLIST_ITEM`
    ADD CONSTRAINT `FK_CHECKLIST_ITEM_CARD` FOREIGN KEY (`card_id`) REFERENCES `TBL_CARD` (`card_id`);

-- TBL_CARD_LIKE&BOOKMARK Foreign Keys
ALTER TABLE `TBL_CARD_LIKE&BOOKMARK`
    ADD CONSTRAINT `FK_LIKE_BOOKMARK_USER` FOREIGN KEY (`user_id`) REFERENCES `TBL_USER` (`user_id`),
    ADD CONSTRAINT `FK_LIKE_BOOKMARK_CARD` FOREIGN KEY (`card_id`) REFERENCES `TBL_CARD` (`card_id`);

-- TBL_WORKSPACE_BOOKMARK Foreign Keys
ALTER TABLE `TBL_WORKSPACE_BOOKMARK`
    ADD CONSTRAINT `FK_WORKSPACE_BOOKMARK_USER` FOREIGN KEY (`user_id`) REFERENCES `TBL_USER` (`user_id`),
    ADD CONSTRAINT `FK_WORKSPACE_BOOKMARK_CARD` FOREIGN KEY (`workspace_id`) REFERENCES `TBL_WORKSPACE` (`workspace_id`);



-- TBL_MEETINGROOM Foreign Key
ALTER TABLE `TBL_MEETINGROOM`
    ADD CONSTRAINT `FK_MEETINGROOM_TEAM` FOREIGN KEY (`team_id`) REFERENCES `TBL_TEAM` (`team_id`);

-- TBL_PROJ Foreign Key
ALTER TABLE `TBL_PROJ`
    ADD CONSTRAINT `FK_PROJ_USER` FOREIGN KEY (`user_id`) REFERENCES `TBL_USER` (`user_id`);

-- TBL_SCHEDULE Foreign Keys
ALTER TABLE `TBL_SCHEDULE`
    ADD CONSTRAINT `FK_SCHEDULE_MEETINGROOM` FOREIGN KEY (`meetingroom_id`) REFERENCES `TBL_MEETINGROOM` (`meetingroom_id`),
    ADD CONSTRAINT `FK_SCHEDULE_USER` FOREIGN KEY (`user_id`) REFERENCES `TBL_USER` (`user_id`),
    ADD CONSTRAINT `FK_SCHEDULE_TEAM` FOREIGN KEY (`team_id`) REFERENCES `TBL_TEAM` (`team_id`),
    ADD CONSTRAINT `FK_SCHEDULE_PROJ` FOREIGN KEY (`proj_id`) REFERENCES `TBL_PROJ` (`proj_id`);

-- TBL_TEAM_BOARD Foreign Key
ALTER TABLE `TBL_TEAM_BOARD`
    ADD CONSTRAINT `FK_TEAM_BOARD_TEAM` FOREIGN KEY (`team_id`) REFERENCES `TBL_TEAM` (`team_id`);

-- TBL_TEAM_COMMENT Foreign Keys
ALTER TABLE `TBL_TEAM_COMMENT`
    ADD CONSTRAINT `FK_TEAM_COMMENT_POST` FOREIGN KEY (`team_post_id`) REFERENCES `TBL_TEAM_POST` (`team_post_id`),
    ADD CONSTRAINT `FK_TEAM_COMMENT_AUTHOR` FOREIGN KEY (`author`) REFERENCES `TBL_USER` (`user_id`);

-- TBL_TEAM_POST Foreign Keys
ALTER TABLE `TBL_TEAM_POST`
    ADD CONSTRAINT `FK_TEAM_POST_USER` FOREIGN KEY (`user_id`) REFERENCES `TBL_USER` (`user_id`),
    ADD CONSTRAINT `FK_TEAM_POST_BOARD` FOREIGN KEY (`team_board_id`) REFERENCES `TBL_TEAM_BOARD` (`team_board_id`);

-- TBL_TEAM_WORK Foreign Keys
ALTER TABLE `TBL_TEAM_WORK`
    ADD CONSTRAINT `FK_TEAM_WORK_ASSIGNEE` FOREIGN KEY (`assignee_id`) REFERENCES `TBL_USER` (`user_id`),
    ADD CONSTRAINT `FK_TEAM_WORK_TEAM` FOREIGN KEY (`team_id`) REFERENCES `TBL_TEAM` (`team_id`),
    ADD CONSTRAINT `FK_TEAM_WORK_USER` FOREIGN KEY (`user_id`) REFERENCES `TBL_USER` (`user_id`);

-- TBL_USER Foreign Key
ALTER TABLE `TBL_USER`
    ADD CONSTRAINT `FK_USER_TEAM` FOREIGN KEY (`team_id`) REFERENCES `TBL_TEAM` (`team_id`);

-- TBL_USER_PROJ Foreign Keys
ALTER TABLE `TBL_USER_PROJ`
    ADD CONSTRAINT `FK_USER_PROJ_USER` FOREIGN KEY (`user_id`) REFERENCES `TBL_USER` (`user_id`),
    ADD CONSTRAINT `FK_USER_PROJ_PROJ` FOREIGN KEY (`proj_id`) REFERENCES `TBL_PROJ` (`proj_id`);

-- TBL_USER_SCHEDULE Foreign Keys
ALTER TABLE `TBL_USER_SCHEDULE`
    ADD CONSTRAINT `FK_USER_SCHEDULE_USER` FOREIGN KEY (`user_id`) REFERENCES `TBL_USER` (`user_id`),
    ADD CONSTRAINT `FK_USER_SCHEDULE_SCHEDULE` FOREIGN KEY (`schedule_id`) REFERENCES `TBL_SCHEDULE` (`schedule_id`);

-- TBL_VCS_ACCOUNT Foreign Key
ALTER TABLE `TBL_VCS_ACCOUNT`
    ADD CONSTRAINT `FK_VCS_ACCOUNT_USER` FOREIGN KEY (`user_id`) REFERENCES `TBL_USER` (`user_id`);

-- TBL_VCS_MILESTONE Foreign Key
ALTER TABLE `TBL_VCS_MILESTONE`
    ADD CONSTRAINT `FK_VCS_MILESTONE_REPO` FOREIGN KEY (`repo_id`) REFERENCES `TBL_VCS_REPO` (`repo_id`);

-- TBL_VCS_OBJ Foreign Keys
ALTER TABLE `TBL_VCS_OBJ`
    ADD CONSTRAINT `FK_VCS_OBJ_REPO` FOREIGN KEY (`repo_id`) REFERENCES `TBL_VCS_REPO` (`repo_id`),
    ADD CONSTRAINT `FK_VCS_OBJ_USER` FOREIGN KEY (`vcs_user_id`) REFERENCES `TBL_VCS_ACCOUNT` (`vcs_user_id`);

-- TBL_VCS_PROJ Foreign Key
ALTER TABLE `TBL_VCS_PROJ`
    ADD CONSTRAINT `FK_VCS_PROJ_PROJ` FOREIGN KEY (`proj_id`) REFERENCES `TBL_PROJ` (`proj_id`);

-- TBL_VCS_REPO Foreign Keys
ALTER TABLE `TBL_VCS_REPO`
    ADD CONSTRAINT `FK_VCS_REPO_PROJ` FOREIGN KEY (`vcs_proj_id`) REFERENCES `TBL_VCS_PROJ` (`vcs_proj_id`),
    ADD CONSTRAINT `FK_VCS_REPO_WORKSPACE` FOREIGN KEY (`workspace_id`) REFERENCES `TBL_WORKSPACE` (`workspace_id`);

-- TBL_WORKSPACE Foreign Keys
ALTER TABLE `TBL_WORKSPACE`
    ADD CONSTRAINT `FK_WORKSPACE_VCS_PROJ` FOREIGN KEY (`vcs_proj_id`) REFERENCES `TBL_VCS_PROJ` (`vcs_proj_id`),
    ADD CONSTRAINT `FK_WORKSPACE_PROJ` FOREIGN KEY (`proj_id`) REFERENCES `TBL_PROJ` (`proj_id`);