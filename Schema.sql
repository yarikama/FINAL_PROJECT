CREATE TABLE `institution` (
    `ins_num` smallint  NOT NULL ,
    `ins_add_id` smallint  NOT NULL ,
    `ins_name` varchar(50)  NOT NULL ,
    PRIMARY KEY (
        `ins_num`
    ),
    CONSTRAINT `uc_institution_ins_name` UNIQUE (
        `ins_name`
    )
);

CREATE TABLE `ins_capacity` (
    `ins_num` smallint  NOT NULL ,
    `caring_num` smallint  NOT NULL ,
    `nurse_num` smallint  NOT NULL ,
    `dem_num` smallint  NOT NULL ,
    -- derived
    `emp_num` smallint  NOT NULL ,
    `long_caring_num` smallint  NOT NULL ,
    -- derived
    `housing_num` smallint  NOT NULL ,
    `providing_num` smallint  NOT NULL ,
    PRIMARY KEY (
        `ins_num`
    )
);

CREATE TABLE `ins_info` (
    `ins_num` smallint  NOT NULL ,
    `manager` varchar(28)  NOT NULL ,
    `phone` varchar(50)  NOT NULL ,
    `email` varchar(100)  NOT NULL ,
    `website` varchar(500)  NOT NULL ,
    PRIMARY KEY (
        `ins_num`
    )
);

CREATE TABLE `ins_address` (
    `add_id` smallint  NOT NULL ,
    `add` varchar(100)  NOT NULL ,
    `city` char(6)  NOT NULL ,
    `dist` varchar(15)  NOT NULL ,
    `longitude` float  NOT NULL ,
    `latitude` float  NOT NULL ,
    PRIMARY KEY (
        `add_id`
    )
);

CREATE TABLE `type_func` (
    `int_num` smallint  NOT NULL ,
    `type` smallint  NOT NULL ,
    `func_name` varchar(60)  NOT NULL ,
    PRIMARY KEY (
        `int_num`
    )
);

CREATE TABLE `func_web` (
    `func_name` varchar(60)  NOT NULL ,
    `func_website` varchar(500)  NOT NULL ,
    PRIMARY KEY (
        `func_name`
    )
);

CREATE TABLE `user` (
    `user_id` int  NOT NULL ,
    `user_name` varchar(50)  NOT NULL ,
    `user_email` varchar(100)  NOT NULL ,
    `user_password` varchar(50)  NOT NULL ,
    PRIMARY KEY (
        `user_id`
    ),
    CONSTRAINT `uc_user_user_name` UNIQUE (
        `user_name`
    )
);

CREATE TABLE `user_favorite` (
    `user_id` int  NOT NULL ,
    `ins_num` smallint  NOT NULL ,
    PRIMARY KEY (
        `user_id`,`ins_num`
    )
);

ALTER TABLE `institution` ADD CONSTRAINT `fk_institution_ins_add_id` FOREIGN KEY(`ins_add_id`)
REFERENCES `ins_address` (`add_id`);

ALTER TABLE `ins_capacity` ADD CONSTRAINT `fk_ins_capacity_ins_num` FOREIGN KEY(`ins_num`)
REFERENCES `institution` (`ins_num`);

ALTER TABLE `ins_info` ADD CONSTRAINT `fk_ins_info_ins_num` FOREIGN KEY(`ins_num`)
REFERENCES `institution` (`ins_num`);

ALTER TABLE `type_func` ADD CONSTRAINT `fk_type_func_int_num` FOREIGN KEY(`int_num`)
REFERENCES `institution` (`ins_num`);

ALTER TABLE `type_func` ADD CONSTRAINT `fk_type_func_func_name` FOREIGN KEY(`func_name`)
REFERENCES `func_web` (`func_name`);

ALTER TABLE `user_favorite` ADD CONSTRAINT `fk_user_favorite_user_id` FOREIGN KEY(`user_id`)
REFERENCES `user` (`user_id`);

ALTER TABLE `user_favorite` ADD CONSTRAINT `fk_user_favorite_ins_num` FOREIGN KEY(`ins_num`)
REFERENCES `institution` (`ins_num`);

