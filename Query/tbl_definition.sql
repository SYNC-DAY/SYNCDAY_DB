DROP DATABASE IF EXISTS syncdaydb;
CREATE DATABASE syncdaydb
    DEFAULT CHARACTER SET UTF8
    DEFAULT COLLATE UTF8_GENERAL_CI;
USE syncdaydb;

SET SESSION storage_engine = InnoDB;
SET SESSION AUTO_INCREMENT_INCREMENT = 1;

-- 1. 독립적인 기본 테이블
CREATE TABLE TBL_TEAM
(
    team_id   BIGINT       NOT NULL AUTO_INCREMENT COMMENT '팀ID',
    team_name VARCHAR(255) NOT NULL COMMENT '팀 이름',
    PRIMARY KEY (team_id)
) COMMENT = '팀';

CREATE TABLE TBL_PROJ
(
    proj_id         BIGINT       NOT NULL AUTO_INCREMENT COMMENT '프로젝트ID',
    proj_name       VARCHAR(255) NOT NULL COMMENT '프로젝트명',
    start_time      TIMESTAMP COMMENT '시작시각',
    end_time        TIMESTAMP COMMENT '종료시각',
    created_at      TIMESTAMP    NOT NULL COMMENT '생성시각',
    progress_status TINYINT      NOT NULL COMMENT '진척도',
    vcs_type        VARCHAR(255) COMMENT 'VCS 프로젝트 타입',
    vcs_proj_url    VARCHAR(511) COMMENT 'VCS URL',
    PRIMARY KEY (proj_id)
) COMMENT = '프로젝트';

-- 2. TBL_TEAM을 참조하는 테이블
CREATE TABLE `TBL_USER` (
                            `user_id` BIGINT NOT NULL AUTO_INCREMENT,
                            `username` VARCHAR(255) NOT NULL,
                            `email` VARCHAR(255) NOT NULL,
                            `password` VARCHAR(255) NOT NULL,
                            `phone_number` VARCHAR(255),
                            `profile_photo` VARCHAR(1023),
                            `join_year` TIMESTAMP,
                            `position` VARCHAR(255),
                            `team_id` BIGINT NOT NULL,
                            `last_access_time` TIMESTAMP,
                            PRIMARY KEY (`user_id`),
                            CONSTRAINT `FK_USER_TEAM` FOREIGN KEY (`team_id`)
                                REFERENCES `TBL_TEAM` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE
) COMMENT = '회원';
CREATE TABLE `TBL_MEETINGROOM` (
                                   `meetingroom_id` BIGINT NOT NULL AUTO_INCREMENT,
                                   `meetingroom_place` VARCHAR(255),
                                   `meetingroom_name` VARCHAR(255),
                                   `meetingroom_capacity` INT,
                                   PRIMARY KEY (`meetingroom_id`)
) COMMENT = '회의실';

CREATE TABLE `TBL_SCHEDULE_REPEAT` (
                                       `schedule_repeat_id` BIGINT NOT NULL AUTO_INCREMENT,
                                       `title` VARCHAR(255),
                                       `content` VARCHAR(511),
                                       `start_time` TIMESTAMP,
                                       `end_time` TIMESTAMP,
                                       `update_time` TIMESTAMP NOT NULL,
                                       `public_status` VARCHAR(255) NOT NULL,
                                       `meeting_status` VARCHAR(255) NOT NULL,
                                       `repeat_end` TIMESTAMP,
                                       `recurrence_type` VARCHAR(255) NOT NULL,
                                       `personal_recurrence_unit` VARCHAR(255),
                                       `personal_recurrence_interval` INT,
                                       `personal_recurrence_selected_days` INT,
                                       `personal_monthly_type` VARCHAR(255),
                                       `user_id` BIGINT NOT NULL,
                                       PRIMARY KEY (`schedule_repeat_id`),
                                       CONSTRAINT `FK_SCHEDULE_REPEAT_USER` FOREIGN KEY (`user_id`)
                                           REFERENCES `TBL_USER` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
                                       CHECK (public_status IN ('PUBLIC', 'PRIVATE')),
                                       CHECK (meeting_status IN ('ACTIVE', 'INACTIVE')),
                                       CHECK (recurrence_type IN
                                              ('EVERYDAY', 'EVERY_WEEK_DAY','EVERY_MONTH_DAY','EVERY_YEAR_DAY','ALL_WORK_DAY','PERSONAL')),
                                       CHECK (personal_monthly_type IN ('EVERY_DAY', 'EVERY_WEEK_DAY'))

);

CREATE TABLE `TBL_SCHEDULE_REPEAT_PARTICIPANT` (
                                                   `user_id` BIGINT NOT NULL,
                                                   `schedule_repeat_id` BIGINT NOT NULL,
                                                   `participation_status` VARCHAR(255),
                                                   PRIMARY KEY (`user_id`, `schedule_repeat_id`),
                                                   CONSTRAINT `FK_SCHEDULE_REPEAT_PARTICIAPNT_USER` FOREIGN KEY (`user_id`)
                                                       REFERENCES `TBL_USER` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
                                                   CONSTRAINT `FK_SCHEDULE_REPEAT_PRATICIPANT_SCHEDULE_REPAET` FOREIGN KEY (`schedule_repeat_id`)
                                                       REFERENCES `TBL_SCHEDULE_REPEAT` (`schedule_repeat_id`) ON DELETE CASCADE ON UPDATE CASCADE
);



-- 3. TBL_MEETINGROOM과 TBL_USER를 참조하는 테이블
CREATE TABLE `TBL_SCHEDULE` (
                                `schedule_id` BIGINT NOT NULL AUTO_INCREMENT,
                                `title` VARCHAR(255),
                                `content` VARCHAR(511),
                                `start_time` TIMESTAMP NOT NULL,
                                `end_time` TIMESTAMP NOT NULL,
                                `update_time` TIMESTAMP NOT NULL,
                                `public_status` VARCHAR(255) NOT NULL,
                                `schedule_repeat_id` BIGINT NULL,
                                `repeat_order` BIGINT,
                                `meeting_status` VARCHAR(255) NOT NULL,
                                `meetingroom_id` BIGINT,
                                `user_id` BIGINT NOT NULL,
                                PRIMARY KEY (`schedule_id`),
                                CONSTRAINT `FK_SCHEDULE_MEETINGROOM` FOREIGN KEY (`meetingroom_id`)
                                    REFERENCES `TBL_MEETINGROOM` (`meetingroom_id`) ON DELETE SET NULL ON UPDATE CASCADE,
                                CONSTRAINT `FK_SCHEDULE_USER` FOREIGN KEY (`user_id`)
                                    REFERENCES `TBL_USER` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
                                CONSTRAINT `FK_SCHEDULE_REPEAT` FOREIGN KEY (`schedule_repeat_id`)
                                    REFERENCES `TBL_SCHEDULE_REPEAT` (`schedule_repeat_id`) ON DELETE CASCADE ON UPDATE CASCADE
)COMMENT = '일정';

CREATE TABLE `TBL_MEETINGROOM_RESERVATION` (
                                               `meetingroom_reservation_id` BIGINT NOT NULL AUTO_INCREMENT,
                                               `meeting_time` TIMESTAMP NOT NULL,
                                               `meetingroom_id` BIGINT NOT NULL,
                                               `schedule_id` BIGINT NOT NULL,
                                               PRIMARY KEY (`meetingroom_reservation_id`),
                                               CONSTRAINT `FK_RESERVATION_MEETINGROOM` FOREIGN KEY (`meetingroom_id`)
                                                   REFERENCES `TBL_MEETINGROOM` (`meetingroom_id`) ON DELETE CASCADE ON UPDATE CASCADE,
                                               CONSTRAINT `FK_RESERVATION_SCHEDULE` FOREIGN KEY (`schedule_id`)
                                                   REFERENCES `TBL_SCHEDULE` (`schedule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
                                               UNIQUE (`meetingroom_id`, `meeting_time`)
);
-- 4. TBL_PROJ를 참조하는 테이블
CREATE TABLE TBL_WORKSPACE
(
    workspace_id    BIGINT       NOT NULL AUTO_INCREMENT COMMENT '워크스페이스ID',
    workspace_name  VARCHAR(255) NOT NULL COMMENT '워크스페이스이름',
    created_at      TIMESTAMP    NOT NULL COMMENT '생성시각',
    progress_status TINYINT      NOT NULL COMMENT '진척도',
    proj_id         BIGINT       NOT NULL COMMENT '프로젝트ID',
    vcs_type        VARCHAR(255) COMMENT 'VCS 타입',
    vcs_repo_url    VARCHAR(511) COMMENT 'VCS 저장소 URL',
    PRIMARY KEY (workspace_id),
    FOREIGN KEY (proj_id) REFERENCES TBL_PROJ (proj_id)
) COMMENT = '워크스페이스';

-- 5. TBL_WORKSPACE를 참조하는 테이블
CREATE TABLE TBL_CARD_TAG
(
    tag_id       BIGINT       NOT NULL AUTO_INCREMENT COMMENT '태그ID',
    tag_name     VARCHAR(255) NOT NULL COMMENT '태그명',
    color        VARCHAR(255) NOT NULL COMMENT '색깔',
    workspace_id BIGINT       NOT NULL COMMENT '워크스페이스ID',
    PRIMARY KEY (tag_id),
    FOREIGN KEY (workspace_id) REFERENCES TBL_WORKSPACE (workspace_id)
) COMMENT = '카드태그';

CREATE TABLE TBL_CARDBOARD
(
    cardboard_id     BIGINT       NOT NULL AUTO_INCREMENT COMMENT '카드보드ID',
    title             VARCHAR(255) NOT NULL COMMENT '이름',
    created_at        TIMESTAMP    NOT NULL COMMENT '생성시각',
    start_time        TIMESTAMP COMMENT '시작시각',
    end_time          TIMESTAMP COMMENT '종료시각',
    progress_status   TINYINT      NOT NULL COMMENT '진척도',
    vcs_type          VARCHAR(255) COMMENT 'VCS 타입',
    vcs_milestone_url VARCHAR(511) COMMENT 'VCS 마일스톤 URL',
    workspace_id      BIGINT       NOT NULL COMMENT '워크스페이스ID',
    PRIMARY KEY (cardboard_id),
    FOREIGN KEY (workspace_id) REFERENCES TBL_WORKSPACE (workspace_id)
) COMMENT = '카드보드';

-- 6. TBL_CARD_BOARD, TBL_CARD_TAG, TBL_USER를 참조하는 테이블
CREATE TABLE TBL_CARD
(
    card_id         BIGINT       NOT NULL AUTO_INCREMENT COMMENT '카드ID',
    title           VARCHAR(255) NOT NULL COMMENT '제목',
    content         TEXT COMMENT '내용',
    created_at      TIMESTAMP    NOT NULL COMMENT '생성시각',
    start_time      TIMESTAMP COMMENT '시작시각',
    end_time        TIMESTAMP COMMENT '마감시각',
    vcs_object_type VARCHAR(255) COMMENT 'VCS 객체 종류',
    vcs_object_url  VARCHAR(511) COMMENT 'VCS 객체 URL',
    cardboard_id   BIGINT       NOT NULL COMMENT '카드보드ID',
    tag_id          BIGINT COMMENT '태그ID',
    created_by      BIGINT       NOT NULL COMMENT '작성자ID',
    assignee        BIGINT COMMENT '담당자 ID',
    PRIMARY KEY (card_id),
    FOREIGN KEY (cardboard_id) REFERENCES TBL_CARDBOARD (cardboard_id),
    FOREIGN KEY (tag_id) REFERENCES TBL_CARD_TAG (tag_id),
    FOREIGN KEY (created_by) REFERENCES TBL_USER (user_id),
    FOREIGN KEY (assignee) REFERENCES TBL_USER (user_id)
) COMMENT = '카드';

-- 7. TBL_CARD를 참조하는 테이블들
CREATE TABLE TBL_CARD_ATTACHMENTS
(
    attachment_id BIGINT        NOT NULL AUTO_INCREMENT COMMENT '첨부파일ID',
    description   VARCHAR(1023) COMMENT '설명',
    content       VARCHAR(1023) NOT NULL COMMENT '내용',
    card_id       BIGINT        NOT NULL COMMENT '카드ID',
    PRIMARY KEY (attachment_id),
    FOREIGN KEY (card_id) REFERENCES TBL_CARD (card_id)
) COMMENT = '카드 첨부파일';

CREATE TABLE TBL_CARD_BOOKMARK
(
    card_bookmark_id BIGINT NOT NULL AUTO_INCREMENT COMMENT '카드북마크ID',
    user_id          BIGINT NOT NULL COMMENT '회원ID',
    card_id          BIGINT NOT NULL COMMENT '카드ID',
    PRIMARY KEY (card_bookmark_id),
    FOREIGN KEY (user_id) REFERENCES TBL_USER (user_id),
    FOREIGN KEY (card_id) REFERENCES TBL_CARD (card_id)
) COMMENT = '카드 북마크';

CREATE TABLE TBL_CARD_COMMENT
(
    card_comment_id BIGINT        NOT NULL AUTO_INCREMENT COMMENT '댓글ID',
    content         VARCHAR(1023) NOT NULL COMMENT '댓글 내용',
    created_at      TIMESTAMP     NOT NULL COMMENT '생성시각',
    updated_at      TIMESTAMP     NOT NULL COMMENT '수정시각',
    user_id         BIGINT        NOT NULL COMMENT '회원ID',
    card_id         BIGINT        NOT NULL COMMENT '카드ID',
    PRIMARY KEY (card_comment_id),
    FOREIGN KEY (user_id) REFERENCES TBL_USER (user_id),
    FOREIGN KEY (card_id) REFERENCES TBL_CARD (card_id)
) COMMENT = '카드 댓글';

CREATE TABLE TBL_CHECKLIST
(
    checklist_id BIGINT        NOT NULL AUTO_INCREMENT COMMENT '체크리스트 ID',
    card_id      BIGINT        NOT NULL COMMENT '카드ID',
    content      VARCHAR(1023) NOT NULL COMMENT '내용',
    status       VARCHAR(255)  NOT NULL COMMENT '상태',
    PRIMARY KEY (checklist_id),
    FOREIGN KEY (card_id) REFERENCES TBL_CARD (card_id)
) COMMENT = '체크리스트';

-- 8. TBL_SCHEDULE을 참조하는 테이블
CREATE TABLE TBL_MEETING_NOTE
(
                                    `schedule_id` BIGINT NOT NULL,
                                    `title` VARCHAR(1023),
                                    `content` TEXT,
                                    PRIMARY KEY (`schedule_id`),
                                    CONSTRAINT `FK_MEETING_NOTE_SCHEDULE` FOREIGN KEY (`schedule_id`)
                                        REFERENCES `TBL_SCHEDULE` (`schedule_id`) ON DELETE CASCADE ON UPDATE CASCADE
) COMMENT = '회의록';

-- 9. 팀 관련 테이블들
CREATE TABLE `TBL_TEAM_BOARD` (
                                  `team_board_id` BIGINT NOT NULL AUTO_INCREMENT,
                                  `team_id` BIGINT NOT NULL,
                                  `board_title` VARCHAR(255) NOT NULL,
                                  PRIMARY KEY (`team_board_id`),
                                  CONSTRAINT `FK_TEAM_BOARD_TEAM` FOREIGN KEY (`team_id`)
                                      REFERENCES `TBL_TEAM` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE
) COMMENT = '팀 게시판';

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
)COMMENT = '팀 게시글';

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
) COMMENT = '팀 댓글';

-- 10. 연결 테이블들

CREATE TABLE `TBL_TEAM_SCHEDULE` (
                                     `team_id` BIGINT NOT NULL,
                                     `schedule_id` BIGINT NOT NULL,
                                     PRIMARY KEY (`team_id`, `schedule_id`),
                                     CONSTRAINT `FK_TEAM_SCHEDULE_TEAM` FOREIGN KEY (`team_id`)
                                         REFERENCES `TBL_TEAM` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE,
                                     CONSTRAINT `FK_TEAM_SCHEDULE_SCHEDULE` FOREIGN KEY (`schedule_id`)
                                         REFERENCES `TBL_SCHEDULE` (`schedule_id`) ON DELETE CASCADE ON UPDATE CASCADE
) COMMENT = '팀-일정';

CREATE TABLE TBL_PROJ_SCHEDULE
(
    project_id  BIGINT NOT NULL COMMENT '프로젝트ID',
    schedule_id BIGINT NOT NULL COMMENT '일정ID',
    PRIMARY KEY (project_id, schedule_id),
    FOREIGN KEY (project_id) REFERENCES TBL_PROJ (proj_id),
    FOREIGN KEY (schedule_id) REFERENCES TBL_SCHEDULE (schedule_id)
) COMMENT = '프로젝트-일정';

CREATE TABLE TBL_USER_SCHEDULE
(
    user_id     BIGINT NOT NULL COMMENT '회원ID',
    schedule_id BIGINT NOT NULL COMMENT '일정ID',
    status      VARCHAR(255) COMMENT '참여상태',
    notification_time TIMESTAMP COMMENT '알람시각',
    PRIMARY KEY (user_id, schedule_id),
    FOREIGN KEY (user_id) REFERENCES TBL_USER (user_id),
    FOREIGN KEY (schedule_id) REFERENCES TBL_SCHEDULE (schedule_id)
) COMMENT = '회원-일정';

CREATE TABLE TBL_PROJ_MEMBER
(
    proj_member_id       BIGINT       NOT NULL AUTO_INCREMENT COMMENT '프로젝트멤버ID',
    bookmark_status      VARCHAR(255) NOT NULL COMMENT '북마크여부',
    participation_status VARCHAR(255) NOT NULL COMMENT '참여상태',
    proj_id              BIGINT       NOT NULL COMMENT '프로젝트ID',
    user_id              BIGINT       NOT NULL COMMENT '회원ID',
    PRIMARY KEY (proj_member_id),
    CHECK ( participation_status IN ('MEMBER','OWNER','PENDING') ),
    CHECK ( bookmark_status IN ('BOOKMARKED','NONE') ),
        FOREIGN KEY (proj_id) REFERENCES TBL_PROJ (proj_id),
    FOREIGN KEY (user_id) REFERENCES TBL_USER (user_id)
) COMMENT = '회원-프로젝트';

CREATE TABLE TBL_WORKSPACE_BOOKMARK
(
    workspace_bookmark_id BIGINT NOT NULL AUTO_INCREMENT COMMENT '워크스페이스 북마크ID',
    workspace_id          BIGINT NOT NULL COMMENT '워크스페이스ID',
    user_id               BIGINT NOT NULL COMMENT '회원ID',
    PRIMARY KEY (workspace_bookmark_id),
    FOREIGN KEY (workspace_id) REFERENCES TBL_WORKSPACE (workspace_id),
    FOREIGN KEY (user_id) REFERENCES TBL_USER (user_id)
) COMMENT = '워크스페이스 북마크';

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
) COMMENT = '팀 업무';
