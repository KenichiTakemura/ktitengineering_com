
  module PostDef

    # DB
    # 1 to 255 bytes: TINYTEXT
    # 256 to 65535 bytes: TEXT
    # 65536 to 16777215 bytes: MEDIUMTEXT
    # 16777216 to 4294967295 bytes: LONGTEXT
    DB_POST_COMMENT_LENGTH = 65535
    DB_ISSUE_TEXT_LENGTH = 65535
    DB_POST_CONTENT_LENGTH = 16777215
    DB_BUSINESS_PROFILE_CONTENT_LENGTH = 16777215
    MAX_POST_CONTENT_LENGTH = 65535
end
