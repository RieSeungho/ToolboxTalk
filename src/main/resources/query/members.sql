
INSERT INTO members
    (username,
     password,
     nickname,
     email,
     authority,
     status,
     created)
VALUES
    ('testuser11',
     'testpass11',
     '山本太郎',
     'yamamototaro@email.com',
     'COM',
     true,
     NOW());

-- ログインで、会員のオブジェクトを取得し、セッションに保存ためのクエリー
SELECT
    id,
    username,
    password,
    nickname,
    authority,
    status
FROM
    members
WHERE
    username = 'testuser1';

-- マイページを閲覧に使われるクエリー
SELECT
    id,
    username,
    nickname,
    email,
    authority,
    status,
    created,
    updated
FROM
    members
WHERE
    id = 1;

UPDATE members SET nickname = '', email = '' WHERE id = '';

