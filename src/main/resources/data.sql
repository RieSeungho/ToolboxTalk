/*
    最初登録会員のクエリー
*/
INSERT INTO members (username, password, nickname, email, authority, status, created) VALUES
    ('testuser1', 'testpass1', 'testuser1', null, 'SUP', true, NOW()),
    ('testuser2', 'testpass2', 'testuser2', null, 'COM', true, NOW()),
    ('testuser3', 'testpass3', 'testuser3', 'testuser3@email.com', 'COM', true, NOW()),
    ('testuser4', 'testpass4', 'testuser4', null, 'COM', true, NOW()),
    ('testuser5', 'testpass5', 'testuser5', null, 'COM', true, NOW()),
    ('testuser6', 'testpass6', 'testuser6', null, 'EXI', false, NOW()),
    ('testuser7', 'testpass7', 'testuser7', null, 'COM', true, NOW()),
    ('testuser8', 'testpass8', 'testuser8', null, 'DIS', false, NOW()),
    ('testuser9', 'testpass9', 'testuser9', null, 'COM', true, NOW()),
    ('testuser10', 'testpass10', 'testuser10', null, 'COM', true, NOW());

INSERT INTO projects (member_id, external_key, title, content, permission, status, created) VALUES
    (2, 'd2c296eca2b743f0a9f68beb20fcfe1c', 'test project title 1', 'test project content 1', 'PUB', true, NOW()),
    (3, 'd2c296easdfghjkla9f68beb20fcfe1c', 'テストタイトル 2', 'テストコンテンツ 2', 'PUB', true, NOW()),
    (3, '1a069c819cc74d07aa27897048bc622d', 'test project title 3', 'test project content 3', 'PUB', true, NOW()),
    (4, '0f43d060ec75442d913fcebfae164675', 'テストタイトル 4', 'テストコンテンツ 4', 'PUB', true, NOW()),
    (4, '02494b526a1b4f9eb48637304fdb2e34', 'test project title 5', 'test project content 5', 'PUB', true, NOW()),
    (7, '5e25ef75af6c4e8cab64f8cc50a37a15', 'テストタイトル 6', 'テストコンテンツ 6', 'PUB', true, NOW()),
    (7, 'a4bda4e166544c0496f8c562b7bf1aa1', 'test project title 7', 'test project content 7', 'PUB', true, NOW()),
    (8, '0000fce461f64d739dde831398739ef1', 'テストタイトル 8', 'テストコンテンツ 8', 'PUB', true, NOW()),
    (9, '8768425f34d94eb9b24c9d7c1f71603a', 'テストタイトル 9', 'テストコンテンツ 9', 'PUB', true, NOW()),
    (10, 'e6b8534df9a14008829350626529c89d', 'test project title 10', 'test project content 10', 'PUB', true, NOW());
