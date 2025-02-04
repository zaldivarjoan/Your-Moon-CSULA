
CREATE DATABASE IF NOT EXISTS YourMoonDB;

CREATE TABLE IF NOT EXISTS Users(
    user_id             INT              AUTO_INCREMENT PRIMARY KEY NOT NULL,
    user_email          VARCHAR(256)     NOT NULL, -- encrypted email
    user_upload_count   INT              DEFAULT 0,
    user_flag_count     INT              DEFAULT 0,
);

CREATE TABLE IF NOT EXISTS Instruments(
    inst_id             INT              AUTO_INCREMENT PRIMARY KEY NOT NULL,
    inst_type           VARCHAR(25)      NOT NULL, -- "phone", "camera", "phone+telescope", "camera+telescope"
    inst_make           VARCHAR(256)     NULL,
    inst_model          VARCHAR(256)     NULL,
    -- other instrument metadata...
);

CREATE TABLE IF NOT EXISTS Images(
    img_id              INT              AUTO_INCREMENT PRIMARY KEY NOT NULL,
    inst_id             INT              FOREIGN KEY NOT NULL,
    metadata_id         INT              DEFAULT -1, -- reserved id
    
    -- image metadata
    img_name            VARCHAR(50)      NOT NULL,
    img_type            VARCHAR(50)      NOT NULL, -- MIME type
    img_uri             VARCHAR(256)     NOT NULL,
    img_altitude        FLOAT            NOT NULL, -- unit meter
    img_longitude       FLOAT            NOT NULL,
    img_latitude        FLOAT            NOT NULL,
    img_timestamp       INT              NOT NULL, -- unix timestamp of image taken time
    
    -- moon metadata
    moon_detect_flag    INT              NULL,     -- reserved flag
    moon_exist_flag     BOOL             NULL,     -- flag, img contains moon
    moon_loc_x          INT              NULL,     -- circle center x
    moon_loc_y          INT              NULL,     -- circle center y
    moon_loc_r          INT              NULL,     -- circle radius
);
