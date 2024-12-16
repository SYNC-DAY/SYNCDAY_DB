DROP DATABASE IF EXISTS syncdaydb;
CREATE DATABASE syncdaydb
    DEFAULT CHARACTER SET UTF8
    DEFAULT COLLATE UTF8_GENERAL_CI;
USE syncdaydb;

SET SESSION storage_engine = InnoDB;
SET SESSION AUTO_INCREMENT_INCREMENT = 1;

-- 1. 기본 조직 구조 테이블
CREATE TABLE `TBL_TEAM`
(
    `team_id`          BIGINT       NOT NULL COMMENT '팀ID' AUTO_INCREMENT,
    `team_name`        VARCHAR(255) NOT NULL COMMENT '팀 이름',
    `last_employee_id` BIGINT       NOT NULL COMMENT '마지막사번' DEFAULT 0,
    PRIMARY KEY (`team_id`)
) COMMENT = '팀';

CREATE TABLE `TBL_USER`
(
    `user_id`           BIGINT       NOT NULL COMMENT '회원ID' AUTO_INCREMENT,
    `username`          VARCHAR(255) NOT NULL COMMENT '회원명',
    `email`             VARCHAR(255) NOT NULL COMMENT '이메일',
    `password`          VARCHAR(255) NOT NULL COMMENT '비밀번호',
    `phone_number`      VARCHAR(255) COMMENT '전화번호',
    `profile_url` VARCHAR(2048) COMMENT '프로필 사진',
    `position`          VARCHAR(255) COMMENT '직급',
    `team_id`           BIGINT       NOT NULL COMMENT '팀ID',
    `last_activated_at` TIMESTAMP COMMENT '마지막 접속시간',
    PRIMARY KEY (`user_id`),
    UNIQUE KEY `UK_USER_EMAIL` (`email`),
    FOREIGN KEY (`team_id`) REFERENCES `TBL_TEAM` (`team_id`)
);

-- 2. VCS 관련 테이블
CREATE TABLE `TBL_VCS_INSTALLATION`
(
    `vcs_installation_index` BIGINT        NOT NULL COMMENT 'VCS설치번호' AUTO_INCREMENT,
    `vcs_installation_id`    VARCHAR(1023) NOT NULL COMMENT 'VCS설치ID',
    `vcs_type`               VARCHAR(255)  NOT NULL COMMENT 'VCS타입' CHECK ( vcs_type IN ('GITHUB','GITLAB','BITBUCKET') ),
    `account_id`             VARCHAR(255)  NOT NULL COMMENT 'VCS계정ID',
    `account_name`           VARCHAR(255)  NOT NULL COMMENT 'VCS계정이름',
    `account_type`           VARCHAR(255)  NOT NULL COMMENT '계정타입' CHECK ( account_type IN ('USER','ORGANIZATION') ),
    `avatar_url`             VARCHAR(1023) NOT NULL COMMENT '프로필사진',
    `api_url`                VARCHAR(2048) NOT NULL COMMENT 'api경로',
    `html_url`               VARCHAR(2048) NOT NULL COMMENT 'html경로',
    `installation_status`    VARCHAR(255)  NOT NULL COMMENT '설치상태' CHECK ( installation_status IN ('INSTALLED','SUSPENDED') ),
    `created_at`             TIMESTAMP     NOT NULL COMMENT '설치시각',
    `updated_at`             TIMESTAMP COMMENT '수정시각',
    `deleted_at`             TIMESTAMP COMMENT '삭제시각',
    PRIMARY KEY (`vcs_installation_index`),
    UNIQUE KEY `UK_VCS_INSTALLATION` (`vcs_type`, `vcs_installation_id`)
);

CREATE TABLE `TBL_VCS_MEMBER`
(
    `id`                     BIGINT    NOT NULL COMMENT 'VCS멤버ID' AUTO_INCREMENT,
    `user_id`                BIGINT    NOT NULL COMMENT '회원ID',
    `vcs_installation_index` BIGINT    NOT NULL COMMENT 'vcs 설치 인덱스',
    `created_at`             TIMESTAMP NOT NULL COMMENT 'created_at',
    `updated_at`             TIMESTAMP COMMENT 'updated_at',
    `deleted_at`             TIMESTAMP COMMENT 'deleted_at',
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user_id`) REFERENCES `TBL_USER` (`user_id`),
    FOREIGN KEY (`vcs_installation_index`) REFERENCES `TBL_VCS_INSTALLATION` (`vcs_installation_index`)
);

-- 3. 프로젝트 관련 테이블
CREATE TABLE `TBL_PROJ`
(
    `proj_id`                BIGINT       NOT NULL COMMENT '프로젝트ID' AUTO_INCREMENT,
    `proj_name`              VARCHAR(255) NOT NULL COMMENT '프로젝트명',
    `start_time`             TIMESTAMP COMMENT '시작시각',
    `end_time`               TIMESTAMP COMMENT '종료시각',
    `created_at`             TIMESTAMP    NOT NULL COMMENT '생성시각',
    `vcs_proj_url`           VARCHAR(511) COMMENT 'vcs_proj_url or vcs_org_url',
    `vcs_installation_index` BIGINT COMMENT 'vcs_installation_index',
    PRIMARY KEY (`proj_id`),
    FOREIGN KEY (`vcs_installation_index`) REFERENCES `TBL_VCS_INSTALLATION` (`vcs_installation_index`)
);

CREATE TABLE `TBL_PROJ_MEMBER`
(
    `proj_member_id`       BIGINT       NOT NULL COMMENT '프로젝트멤버ID' AUTO_INCREMENT,
    `bookmark_status`      VARCHAR(255) NOT NULL COMMENT '북마크여부',
    `participation_status` VARCHAR(255) NOT NULL COMMENT '참여상태' CHECK (participation_status in ('PENDING', 'OWNER', 'MEMBER')),
    `proj_id`              BIGINT       NOT NULL COMMENT '프로젝트ID',
    `user_id`              BIGINT       NOT NULL COMMENT '회원ID',
    PRIMARY KEY (`proj_member_id`),
    FOREIGN KEY (`proj_id`) REFERENCES `TBL_PROJ` (`proj_id`),
    FOREIGN KEY (`user_id`) REFERENCES `TBL_USER` (`user_id`)
);

-- 4. 워크스페이스 및 카드 관련 테이블
CREATE TABLE `TBL_WORKSPACE`
(
    `workspace_id`   BIGINT       NOT NULL COMMENT '워크스페이스ID' AUTO_INCREMENT,
    `workspace_name` VARCHAR(255) NOT NULL COMMENT '워크스페이스이름',
    `proj_id`        BIGINT       NOT NULL COMMENT '프로젝트ID',
    `vcs_repo_url`   VARCHAR(511) COMMENT 'VCS 저장소 URL',
    PRIMARY KEY (`workspace_id`),
    FOREIGN KEY (`proj_id`) REFERENCES `TBL_PROJ` (`proj_id`)
);

CREATE TABLE `TBL_CARD_TAG`
(
    `tag_id`       BIGINT       NOT NULL COMMENT '태그ID' AUTO_INCREMENT,
    `tag_name`     VARCHAR(255) NOT NULL COMMENT '태그명',
    `color_hex`    VARCHAR(255) NOT NULL COMMENT '색깔',
    `workspace_id` BIGINT       NOT NULL COMMENT '워크스페이스ID',
    PRIMARY KEY (`tag_id`),
    UNIQUE KEY `UK_TAG_NAME_WORKSPACE` (`tag_name`, `workspace_id`),
    FOREIGN KEY (`workspace_id`) REFERENCES `TBL_WORKSPACE` (`workspace_id`)
);

CREATE TABLE `TBL_CARDBOARD`
(
    `cardboard_id`     BIGINT       NOT NULL COMMENT '카드보드ID' AUTO_INCREMENT,
    `title`             VARCHAR(255) NOT NULL COMMENT '이름',
    `start_time`        TIMESTAMP COMMENT '시작시각',
    `end_time`          TIMESTAMP COMMENT '종료시각',
    `vcs_milestone_url` VARCHAR(511) COMMENT 'VCS 마일스톤 URL',
    `vcs_milestone_id`  VARCHAR(255) COMMENT 'VCS 마일스톤 ID',
    `workspace_id`      BIGINT       NOT NULL COMMENT '워크스페이스ID',
    PRIMARY KEY (`cardboard_id`),
    FOREIGN KEY (`workspace_id`) REFERENCES `TBL_WORKSPACE` (`workspace_id`)
);

CREATE TABLE `TBL_CARD`
(
    `card_id`         BIGINT       NOT NULL COMMENT '카드ID' AUTO_INCREMENT,
    `title`           VARCHAR(255) NOT NULL COMMENT '제목',
    `content`         TEXT COMMENT '내용',
    `created_at`      TIMESTAMP    NOT NULL COMMENT '생성시각',
    `start_time`      TIMESTAMP COMMENT '시작시각',
    `end_time`        TIMESTAMP COMMENT '마감시각',
    `vcs_object_type` VARCHAR(255) COMMENT 'VCS 객체 종류',
    `vcs_object_url`  VARCHAR(511) COMMENT 'VCS 객체 URL',
    `cardboard_id`   BIGINT       NOT NULL COMMENT '카드보드ID',
    `tag_id`          BIGINT COMMENT '태그ID',
    `created_by`      BIGINT       NOT NULL COMMENT '작성자ID',
    `assignee`        BIGINT COMMENT '담당자ID',
    PRIMARY KEY (`card_id`),
    FOREIGN KEY (`cardboard_id`) REFERENCES `TBL_CARDBOARD` (`cardboard_id`),
    FOREIGN KEY (`tag_id`) REFERENCES `TBL_CARD_TAG` (`tag_id`),
    FOREIGN KEY (`created_by`) REFERENCES `TBL_USER` (`user_id`),
    FOREIGN KEY (`assignee`) REFERENCES `TBL_USER` (`user_id`)
);

CREATE TABLE `TBL_CARD_COMMENT`
(
    `card_comment_id` BIGINT        NOT NULL COMMENT '댓글ID' AUTO_INCREMENT,
    `content`         VARCHAR(1023) NOT NULL COMMENT '댓글 내용',
    `created_at`      TIMESTAMP     NOT NULL COMMENT '생성시각',
    `updated_at`      TIMESTAMP     NOT NULL COMMENT '수정시각',
    `card_id`         BIGINT        NOT NULL COMMENT '카드ID',
    `proj_member_id`  BIGINT        NOT NULL COMMENT '프로젝트멤버ID',
    PRIMARY KEY (`card_comment_id`),
    FOREIGN KEY (`card_id`) REFERENCES `TBL_CARD` (`card_id`),
    FOREIGN KEY (`proj_member_id`) REFERENCES `TBL_PROJ_MEMBER` (`proj_member_id`)
);

-- 5. 팀 게시판 관련 테이블
CREATE TABLE `TBL_TEAM_BOARD`
(
    `team_board_id` BIGINT       NOT NULL COMMENT '팀게시판ID' AUTO_INCREMENT,
    `team_id`       BIGINT       NOT NULL COMMENT '팀ID',
    `board_title`   VARCHAR(255) NOT NULL COMMENT '게시판이름',
    PRIMARY KEY (`team_board_id`),
    UNIQUE KEY `UK_TEAM_BOARD_TITLE` (`team_id`, `board_title`),
    FOREIGN KEY (`team_id`) REFERENCES `TBL_TEAM` (`team_id`)
);

CREATE TABLE `TBL_TEAM_POST`
(
    `team_post_id`  BIGINT       NOT NULL COMMENT '팀 게시글ID' AUTO_INCREMENT,
    `title`         VARCHAR(255) NOT NULL COMMENT '제목',
    `content`       TEXT         NOT NULL COMMENT '내용',
    `created_at`    TIMESTAMP    NOT NULL COMMENT '생성시각',
    `updated_at`    TIMESTAMP    NOT NULL COMMENT '수정시각',
    `created_by`    BIGINT       NOT NULL COMMENT '작성자ID',
    `team_board_id` BIGINT       NOT NULL COMMENT '팀게시판ID',
    PRIMARY KEY (`team_post_id`),
    FOREIGN KEY (`created_by`) REFERENCES `TBL_USER` (`user_id`),
    FOREIGN KEY (`team_board_id`) REFERENCES `TBL_TEAM_BOARD` (`team_board_id`)
);

CREATE TABLE `TBL_TEAM_COMMENT`
(
    `team_comment_id` BIGINT    NOT NULL COMMENT '팀 댓글ID' AUTO_INCREMENT,
    `created_at`      TIMESTAMP NOT NULL COMMENT '생성시각',
    `updated_at`      TIMESTAMP NOT NULL COMMENT '수정시각',
    `team_post_id`    BIGINT    NOT NULL COMMENT '팀 게시글ID',
    `created_by`      BIGINT    NOT NULL COMMENT '작성자ID',
    PRIMARY KEY (`team_comment_id`),
    FOREIGN KEY (`team_post_id`) REFERENCES `TBL_TEAM_POST` (`team_post_id`),
    FOREIGN KEY (`created_by`) REFERENCES `TBL_USER` (`user_id`)
);

-- 6. 팀 업무 관련 테이블
CREATE TABLE `TBL_TEAM_WORK`
(
    `team_work_id` BIGINT        NOT NULL COMMENT '업무ID' AUTO_INCREMENT,
    `title`        VARCHAR(255)  NOT NULL COMMENT '팀업무제목',
    `content`      VARCHAR(1023) NOT NULL COMMENT '팀 업무 내용',
    `created_at`   TIMESTAMP     NOT NULL COMMENT '생성시각',
    `start_time`   TIMESTAMP COMMENT '시작시각',
    `end_time`     TIMESTAMP     NOT NULL COMMENT '종료시각',
    `assignee_id`  BIGINT COMMENT '담당자ID',
    `status`       VARCHAR(255)  NOT NULL COMMENT 'status',
    `team_id`      BIGINT        NOT NULL COMMENT '팀ID',
    `created_by`   BIGINT        NOT NULL COMMENT '작성자ID',
    PRIMARY KEY (`team_work_id`),
    FOREIGN KEY (`team_id`) REFERENCES `TBL_TEAM` (`team_id`),
    FOREIGN KEY (`assignee_id`) REFERENCES `TBL_USER` (`user_id`),
    FOREIGN KEY (`created_by`) REFERENCES `TBL_USER` (`user_id`)
);

-- 7. 회의실 및 일정 관련 테이블
CREATE TABLE `TBL_MEETINGROOM`
(
    `meetingroom_id`   BIGINT NOT NULL COMMENT '회의실ID' AUTO_INCREMENT,
    `team_id`          BIGINT NOT NULL COMMENT '팀ID',
    `meetingroom_name` VARCHAR(255) COMMENT '회의실 이름',
    PRIMARY KEY (`meetingroom_id`),
    UNIQUE KEY `UK_MEETINGROOM_NAME` (`team_id`, `meetingroom_name`),
    FOREIGN KEY (`team_id`) REFERENCES `TBL_TEAM` (`team_id`)
);

CREATE TABLE `TBL_SCHEDULE`
(
    `schedule_id`    BIGINT       NOT NULL COMMENT '일정ID' AUTO_INCREMENT,
    `title`          VARCHAR(255) NOT NULL COMMENT '제목',
    `content`        VARCHAR(511) COMMENT '내용',
    `start_time`     TIMESTAMP    NOT NULL COMMENT '시작시각',
    `end_time`       TIMESTAMP    NOT NULL COMMENT '종료시각',
    `public_status`  VARCHAR(255) NOT NULL COMMENT '공개여부',
    `meetingroom_id` BIGINT COMMENT '회의실ID',
    PRIMARY KEY (`schedule_id`),
    FOREIGN KEY (`meetingroom_id`) REFERENCES `TBL_MEETINGROOM` (`meetingroom_id`)
);
CREATE TABLE TBL_SCHEDULE_PARTICIPANT
(
    schedule_participant_id BIGINT NOT NULL COMMENT '참여자ID' AUTO_INCREMENT,
    user_id                 BIGINT NOT NULL COMMENT '회원ID',
    schedule_id             BIGINT NOT NULL COMMENT '일정ID',
    participate_status      VARCHAR(255) COMMENT '참여상태' CHECK (participate_status IN ('PENDING','ACCEPTED','REJECTED')),
    PRIMARY KEY (schedule_participant_id),
    UNIQUE KEY UK_SCHEDULE_PARTICIPANT (user_id, schedule_id),
    FOREIGN KEY (user_id) REFERENCES TBL_USER (user_id),
    FOREIGN KEY (schedule_id) REFERENCES TBL_SCHEDULE (schedule_id)
);
