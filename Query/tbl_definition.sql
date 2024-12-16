DROP DATABASE IF EXISTS syncdaydb;
CREATE DATABASE syncdaydb
    DEFAULT CHARACTER SET UTF8MB4
    DEFAULT COLLATE UTF8MB4_UNICODE_CI;
USE syncdaydb;

SET SESSION storage_engine = InnoDB;
SET SESSION AUTO_INCREMENT_INCREMENT = 1;

-- 1. 기본 조직 구조 테이블
CREATE TABLE `TBL_TEAM` (
                            `team_id`          BIGINT       NOT NULL AUTO_INCREMENT COMMENT '팀ID',
                            `team_name`        VARCHAR(255) NOT NULL COMMENT '팀 이름',
                            `last_employee_index` BIGINT       NOT NULL DEFAULT 0 COMMENT '마지막사번',
                            `created_at`       TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시',
                            `updated_at`       TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시',
                            PRIMARY KEY (`team_id`),
                            INDEX `IDX_TEAM_NAME` (`team_name`)
) ENGINE=InnoDB COMMENT='팀';

CREATE TABLE `TBL_USER` (
                            `user_id`           BIGINT       NOT NULL AUTO_INCREMENT COMMENT '회원ID',
                            `username`          VARCHAR(255) NOT NULL COMMENT '회원명',
                            `email`             VARCHAR(255) NOT NULL COMMENT '이메일',
                            `password`          VARCHAR(512) NOT NULL COMMENT '비밀번호',
                            `phone_number`      VARCHAR(20)  COMMENT '전화번호',
                            `profile_url`       VARCHAR(2048) COMMENT '프로필 사진',
                            `position`          VARCHAR(255) COMMENT '직급',
                            `team_id`           BIGINT       NOT NULL COMMENT '팀ID',
                            `last_activated_at` TIMESTAMP    NULL COMMENT '마지막 접속시간',
                            PRIMARY KEY (`user_id`),
                            UNIQUE KEY `UK_USER_EMAIL` (`email`),
                            INDEX `IDX_USER_TEAM` (`team_id`),
                            INDEX `IDX_USER_LAST_ACTIVATED` (`last_activated_at`),
                            FOREIGN KEY (`team_id`) REFERENCES `TBL_TEAM` (`team_id`) ON DELETE RESTRICT
) ENGINE=InnoDB;

-- 2. VCS 관련 테이블
CREATE TABLE `TBL_VCS_INSTALLATION` (
                                        `vcs_installation_index` BIGINT        NOT NULL AUTO_INCREMENT COMMENT 'VCS설치번호',
                                        `vcs_installation_id`    VARCHAR(1023) NOT NULL COMMENT '암호화된 VCS설치ID',
                                        `vcs_type`               ENUM('GITHUB','GITLAB','BITBUCKET') NOT NULL COMMENT 'VCS타입',
                                        `account_id`             VARCHAR(255)  NOT NULL COMMENT 'VCS계정ID',
                                        `account_name`           VARCHAR(255)  NOT NULL COMMENT 'VCS계정이름',
                                        `account_type`           ENUM('USER','ORGANIZATION') NOT NULL COMMENT '계정타입',
                                        `avatar_url`             VARCHAR(1023) NOT NULL COMMENT '프로필사진',
                                        `api_url`                VARCHAR(2048) NOT NULL COMMENT 'api경로',
                                        `html_url`               VARCHAR(2048) NOT NULL COMMENT 'html경로',
                                        `installation_status`    ENUM('INSTALLED','SUSPENDED') NOT NULL COMMENT '설치상태',
                                        `created_at`             TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                        `updated_at`             TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                                        PRIMARY KEY (`vcs_installation_index`),
                                        UNIQUE KEY `UK_VCS_INSTALLATION` (`vcs_type`, `vcs_installation_id`)
) ENGINE=InnoDB;

CREATE TABLE `TBL_VCS_MEMBER` (
                                  `id`                     BIGINT NOT NULL AUTO_INCREMENT COMMENT 'VCS멤버ID',
                                  `user_id`               BIGINT NOT NULL COMMENT '회원ID',
                                  `vcs_installation_index` BIGINT NOT NULL COMMENT 'vcs 설치 인덱스',
                                  `created_at`            TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                  `updated_at`            TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                                  PRIMARY KEY (`id`),
                                  UNIQUE KEY `UK_VCS_MEMBER` (`user_id`, `vcs_installation_index`),
                                  FOREIGN KEY (`user_id`) REFERENCES `TBL_USER` (`user_id`) ON DELETE CASCADE,
                                  FOREIGN KEY (`vcs_installation_index`) REFERENCES `TBL_VCS_INSTALLATION` (`vcs_installation_index`) ON DELETE CASCADE
) ENGINE=InnoDB;

-- 3. 프로젝트 관련 테이블
CREATE TABLE `TBL_PROJ` (
                            `proj_id`                BIGINT       NOT NULL AUTO_INCREMENT COMMENT '프로젝트ID',
                            `proj_name`              VARCHAR(255) NOT NULL COMMENT '프로젝트명',
                            `start_time`             TIMESTAMP    NULL COMMENT '시작시각',
                            `end_time`               TIMESTAMP    NULL COMMENT '종료시각',
                            `created_at`             TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
                            `updated_at`             TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                            `vcs_proj_url`           VARCHAR(511) COMMENT 'vcs_proj_url or vcs_org_url',
                            `vcs_installation_index` BIGINT COMMENT 'vcs_installation_index',
                            PRIMARY KEY (`proj_id`),
                            INDEX `IDX_PROJ_TIME` (`start_time`, `end_time`),
                            CHECK (`start_time` IS NULL OR `end_time` IS NULL OR `start_time` <= `end_time`),
                            FOREIGN KEY (`vcs_installation_index`) REFERENCES `TBL_VCS_INSTALLATION` (`vcs_installation_index`) ON DELETE SET NULL
) ENGINE=InnoDB;

CREATE TABLE `TBL_PROJ_MEMBER` (
                                   `proj_member_id`       BIGINT NOT NULL AUTO_INCREMENT COMMENT '프로젝트멤버ID',
                                   `bookmark_status`      ENUM('BOOKMARKED', 'NONE') NOT NULL DEFAULT 'NONE' COMMENT '북마크여부',
                                   `participation_status` ENUM('PENDING', 'OWNER', 'MEMBER') NOT NULL COMMENT '참여상태',
                                   `proj_id`             BIGINT NOT NULL COMMENT '프로젝트ID',
                                   `user_id`             BIGINT NOT NULL COMMENT '회원ID',
                                   `created_at`          TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                   `updated_at`          TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                                   PRIMARY KEY (`proj_member_id`),
                                   UNIQUE KEY `UK_PROJ_MEMBER` (`proj_id`, `user_id`),
                                   FOREIGN KEY (`proj_id`) REFERENCES `TBL_PROJ` (`proj_id`) ON DELETE CASCADE,
                                   FOREIGN KEY (`user_id`) REFERENCES `TBL_USER` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB;

-- 4. 워크스페이스 및 카드 관련 테이블
CREATE TABLE `TBL_WORKSPACE` (
                                 `workspace_id`   BIGINT       NOT NULL AUTO_INCREMENT COMMENT '워크스페이스ID',
                                 `workspace_name` VARCHAR(255) NOT NULL COMMENT '워크스페이스이름',
                                 `proj_id`        BIGINT       NOT NULL COMMENT '프로젝트ID',
                                 `vcs_repo_url`   VARCHAR(511) COMMENT 'VCS 저장소 URL',
                                 `created_at`     TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                 `updated_at`     TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                                 PRIMARY KEY (`workspace_id`),
                                 INDEX `IDX_WORKSPACE_PROJ` (`proj_id`),
                                 FOREIGN KEY (`proj_id`) REFERENCES `TBL_PROJ` (`proj_id`) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE `TBL_CARD_TAG` (
                                `tag_id`     BIGINT       NOT NULL AUTO_INCREMENT COMMENT '태그ID',
                                `tag_name`   VARCHAR(255) NOT NULL COMMENT '태그명',
                                `color_hex`  VARCHAR(7)   NOT NULL COMMENT '색깔',
                                `created_at` TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                `updated_at` TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                                PRIMARY KEY (`tag_id`),
                                UNIQUE KEY `UK_TAG_NAME` (`tag_name`)
) ENGINE=InnoDB;



CREATE TABLE `TBL_CARDBOARD` (
                                 `cardboard_id`      BIGINT       NOT NULL AUTO_INCREMENT COMMENT '카드보드ID',
                                 `title`             VARCHAR(255) NOT NULL COMMENT '이름',
                                 `start_time`        TIMESTAMP    NULL COMMENT '시작시각',
                                 `end_time`          TIMESTAMP    NULL COMMENT '종료시각',
                                 `vcs_milestone_url` VARCHAR(511) COMMENT 'VCS 마일스톤 URL',
                                 `vcs_milestone_id`  VARCHAR(255) COMMENT 'VCS 마일스톤 ID',
                                 `workspace_id`      BIGINT       NOT NULL COMMENT '워크스페이스ID',
                                 `created_at`        TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                 `updated_at`        TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                                 PRIMARY KEY (`cardboard_id`),
                                 INDEX `IDX_CARDBOARD_TIME` (`start_time`, `end_time`),
                                 CHECK (`start_time` IS NULL OR `end_time` IS NULL OR `start_time` <= `end_time`),
                                 FOREIGN KEY (`workspace_id`) REFERENCES `TBL_WORKSPACE` (`workspace_id`) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE `TBL_CARD` (
                            `card_id`         BIGINT       NOT NULL AUTO_INCREMENT COMMENT '카드ID',
                            `title`           VARCHAR(255) NOT NULL COMMENT '제목',
                            `content`         TEXT COMMENT '내용',
                            `start_time`      TIMESTAMP    NULL COMMENT '시작시각',
                            `end_time`        TIMESTAMP    NULL COMMENT '마감시각',
                            `vcs_object_type` VARCHAR(255) COMMENT 'VCS 객체 종류',
                            `vcs_object_url`  VARCHAR(511) COMMENT 'VCS 객체 URL',
                            `cardboard_id`    BIGINT       NOT NULL COMMENT '카드보드ID',
                            `tag_id`          BIGINT       NULL COMMENT '태그ID',
                            `created_by`      BIGINT       NOT NULL COMMENT '작성자ID',
                            `assignee`        BIGINT       NULL COMMENT '담당자ID',
                            `created_at`      TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
                            `updated_at`      TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                            PRIMARY KEY (`card_id`),
                            INDEX `IDX_CARD_TIME` (`start_time`, `end_time`),
                            INDEX `IDX_CARD_CREATED` (`created_at`),
                            FULLTEXT INDEX `IDX_CARD_CONTENT` (`title`, `content`),
                            CHECK (`start_time` IS NULL OR `end_time` IS NULL OR `start_time` <= `end_time`),
                            FOREIGN KEY (`cardboard_id`) REFERENCES `TBL_CARDBOARD` (`cardboard_id`) ON DELETE CASCADE,
                            FOREIGN KEY (`tag_id`) REFERENCES `TBL_CARD_TAG` (`tag_id`) ON DELETE SET NULL,
                            FOREIGN KEY (`created_by`) REFERENCES `TBL_USER` (`user_id`) ON DELETE RESTRICT,
                            FOREIGN KEY (`assignee`) REFERENCES `TBL_USER` (`user_id`) ON DELETE SET NULL
) ENGINE=InnoDB;

CREATE TABLE `TBL_CARD_COMMENT` (
                                    `card_comment_id` BIGINT    NOT NULL AUTO_INCREMENT COMMENT '댓글ID',
                                    `content`         TEXT      NOT NULL COMMENT '댓글 내용',
                                    `card_id`         BIGINT    NOT NULL COMMENT '카드ID',
                                    `proj_member_id`  BIGINT    NOT NULL COMMENT '프로젝트멤버ID',
                                    `created_at`      TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                    `updated_at`      TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                                    PRIMARY KEY (`card_comment_id`),
                                    INDEX `IDX_COMMENT_CARD` (`card_id`),
                                    FOREIGN KEY (`card_id`) REFERENCES `TBL_CARD` (`card_id`) ON DELETE CASCADE,
                                    FOREIGN KEY (`proj_member_id`) REFERENCES `TBL_PROJ_MEMBER` (`proj_member_id`) ON DELETE CASCADE
) ENGINE=InnoDB;

-- 5. 팀 게시판 관련 테이블
CREATE TABLE `TBL_TEAM_BOARD` (
                                  `team_board_id` BIGINT       NOT NULL AUTO_INCREMENT COMMENT '팀게시판ID',
                                  `team_id`       BIGINT       NOT NULL COMMENT '팀ID',
                                  `board_title`   VARCHAR(255) NOT NULL COMMENT '게시판이름',
                                  `created_at`    TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                  `updated_at`    TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                                  PRIMARY KEY (`team_board_id`),
                                  UNIQUE KEY `UK_TEAM_BOARD_TITLE` (`team_id`, `board_title`),
                                  FOREIGN KEY (`team_id`) REFERENCES `TBL_TEAM` (`team_id`) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE `TBL_TEAM_POST` (
                                 `team_post_id`  BIGINT       NOT NULL AUTO_INCREMENT COMMENT '팀 게시글ID',
                                 `title`         VARCHAR(255) NOT NULL COMMENT '제목',
                                 `content`       TEXT         NOT NULL COMMENT '내용',
                                 `created_by`    BIGINT       NOT NULL COMMENT '작성자ID',
                                 `team_board_id` BIGINT       NOT NULL COMMENT '팀게시판ID',
                                 `created_at`    TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                 `updated_at`    TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                                 PRIMARY KEY (`team_post_id`),
                                 INDEX `IDX_POST_BOARD` (`team_board_id`),
                                 FULLTEXT INDEX `IDX_POST_CONTENT` (`title`, `content`),
                                 FOREIGN KEY (`created_by`) REFERENCES `TBL_USER` (`user_id`) ON DELETE RESTRICT,
                                 FOREIGN KEY (`team_board_id`) REFERENCES `TBL_TEAM_BOARD` (`team_board_id`) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE `TBL_TEAM_COMMENT` (
                                    `team_comment_id` BIGINT    NOT NULL AUTO_INCREMENT COMMENT '팀 댓글ID',
                                    `content`         TEXT      NOT NULL COMMENT '댓글 내용',
                                    `team_post_id`    BIGINT    NOT NULL COMMENT '팀 게시글ID',
                                    `created_by`      BIGINT    NOT NULL COMMENT '작성자ID',
                                    `created_at`      TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                    `updated_at`      TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                                    PRIMARY KEY (`team_comment_id`),
                                    FOREIGN KEY (`team_post_id`) REFERENCES `TBL_TEAM_POST` (`team_post_id`) ON DELETE CASCADE,
                                    FOREIGN KEY (`created_by`) REFERENCES `TBL_USER` (`user_id`) ON DELETE RESTRICT
) ENGINE=InnoDB;

-- 6. 팀 업무 관련 테이블
CREATE TABLE `TBL_TEAM_WORK` (
                                 `team_work_id` BIGINT        NOT NULL AUTO_INCREMENT COMMENT '업무ID',
                                 `title`        VARCHAR(255)  NOT NULL COMMENT '팀업무제목',
                                 `content`      VARCHAR(1023) NOT NULL COMMENT '팀 업무 내용',
                                 `start_time`   TIMESTAMP     NULL COMMENT '시작시각',
                                 `end_time`     TIMESTAMP     NOT NULL COMMENT '종료시각',
                                 `assignee_id`  BIGINT        NULL COMMENT '담당자ID',
                                 `status`       ENUM('TODO', 'IN_PROGRESS', 'DONE', 'CANCELED') NOT NULL DEFAULT 'TODO' COMMENT 'status',
                                 `team_id`      BIGINT        NOT NULL COMMENT '팀ID',
                                 `created_by`   BIGINT        NOT NULL COMMENT '작성자ID',
                                 `created_at`   TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                 `updated_at`   TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                                 PRIMARY KEY (`team_work_id`),
                                 INDEX `IDX_WORK_TIME` (`start_time`, `end_time`),
                                 INDEX `IDX_WORK_STATUS` (`status`),
                                 CHECK (`start_time` IS NULL OR `end_time` IS NULL OR `start_time` <= `end_time`),
                                 FOREIGN KEY (`team_id`) REFERENCES `TBL_TEAM` (`team_id`) ON DELETE CASCADE,
                                 FOREIGN KEY (`assignee_id`) REFERENCES `TBL_USER` (`user_id`) ON DELETE SET NULL,
                                 FOREIGN KEY (`created_by`) REFERENCES `TBL_USER` (`user_id`) ON DELETE RESTRICT
) ENGINE=InnoDB;


CREATE TABLE `TBL_MEETINGROOM` (
                                   `meetingroom_id`   BIGINT       NOT NULL AUTO_INCREMENT COMMENT '회의실ID',
                                   `meetingroom_name` VARCHAR(255) NOT NULL COMMENT '회의실 이름',
                                   `capacity`         INT          NOT NULL DEFAULT 4 COMMENT '수용인원',
                                   `floor`            INT          NOT NULL COMMENT '층수',
                                   `facilities`       JSON         NULL COMMENT '시설정보',
                                   `created_at`       TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                   `updated_at`       TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                                   PRIMARY KEY (`meetingroom_id`)
) ENGINE=InnoDB;

CREATE TABLE `TBL_TEAM_MEETINGROOM` (
                                        `team_meetingroom_id` BIGINT NOT NULL AUTO_INCREMENT,
                                        `team_id`             BIGINT NOT NULL,
                                        `meetingroom_id`      BIGINT NOT NULL,
                                        `created_at`          TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                        `updated_at`          TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                                        PRIMARY KEY (`team_meetingroom_id`),
                                        UNIQUE KEY `UK_TEAM_MEETINGROOM` (`team_id`, `meetingroom_id`),
                                        FOREIGN KEY (`team_id`) REFERENCES `TBL_TEAM` (`team_id`) ON DELETE CASCADE,
                                        FOREIGN KEY (`meetingroom_id`) REFERENCES `TBL_MEETINGROOM` (`meetingroom_id`) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE `TBL_SCHEDULE` (
                                `schedule_id`    BIGINT       NOT NULL AUTO_INCREMENT COMMENT '일정ID',
                                `title`          VARCHAR(255) NOT NULL COMMENT '제목',
                                `content`        TEXT         NULL COMMENT '내용',
                                `start_time`     TIMESTAMP    NOT NULL COMMENT '시작시각',
                                `end_time`       TIMESTAMP    NOT NULL COMMENT '종료시각',
                                `public_status`  ENUM('PUBLIC', 'PRIVATE', 'TEAM_ONLY') NOT NULL DEFAULT 'PRIVATE' COMMENT '공개여부',
                                `created_by`     BIGINT       NOT NULL COMMENT '생성자ID',
                                `team_id`        BIGINT       NULL COMMENT '팀 일정인 경우 팀ID',
                                `created_at`     TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                `updated_at`     TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                                PRIMARY KEY (`schedule_id`),
                                INDEX `IDX_SCHEDULE_TIME` (`start_time`, `end_time`),
                                CHECK (`start_time` < `end_time`),
                                FOREIGN KEY (`created_by`) REFERENCES `TBL_USER` (`user_id`) ON DELETE RESTRICT,
                                FOREIGN KEY (`team_id`) REFERENCES `TBL_TEAM` (`team_id`) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE `TBL_SCHEDULE_PARTICIPANT` (
                                            `schedule_participant_id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '참여자ID',
                                            `user_id`                BIGINT NOT NULL COMMENT '회원ID',
                                            `schedule_id`            BIGINT NOT NULL COMMENT '일정ID',
                                            `participate_status`     ENUM('PENDING','ACCEPTED','REJECTED') NOT NULL DEFAULT 'PENDING' COMMENT '참여상태',
                                            `notification_sent`      BOOLEAN NOT NULL DEFAULT FALSE COMMENT '알림전송여부',
                                            `created_at`            TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                            `updated_at`            TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                                            PRIMARY KEY (`schedule_participant_id`),
                                            UNIQUE KEY `UK_SCHEDULE_PARTICIPANT` (`user_id`, `schedule_id`),
                                            INDEX `IDX_PARTICIPANT_STATUS` (`participate_status`),
                                            FOREIGN KEY (`user_id`) REFERENCES `TBL_USER` (`user_id`) ON DELETE CASCADE,
                                            FOREIGN KEY (`schedule_id`) REFERENCES `TBL_SCHEDULE` (`schedule_id`) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE `TBL_MEETINGROOM_RESERVATION` (
                                               `meetingroom_reservation_id` BIGINT NOT NULL AUTO_INCREMENT,
                                               `meetingroom_id`            BIGINT NOT NULL,
                                               `schedule_id`               BIGINT NOT NULL,
                                               `start_time`                TIMESTAMP NOT NULL,
                                               `end_time`                  TIMESTAMP NOT NULL,
                                               `created_at`                TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                               `updated_at`                TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                                               PRIMARY KEY (`meetingroom_reservation_id`),
                                               INDEX `IDX_RESERVATION_TIME` (`start_time`, `end_time`),
                                               CHECK (`start_time` < `end_time`),
                                               CONSTRAINT `FK_RESERVATION_MEETINGROOM`
                                                   FOREIGN KEY (`meetingroom_id`) REFERENCES `TBL_MEETINGROOM` (`meetingroom_id`)
                                                       ON DELETE CASCADE,
                                               CONSTRAINT `FK_RESERVATION_SCHEDULE`
                                                   FOREIGN KEY (`schedule_id`) REFERENCES `TBL_SCHEDULE` (`schedule_id`)
                                                       ON DELETE CASCADE
) ENGINE=InnoDB;