/*
    最初登録会員のクエリー
*/
INSERT INTO members (username, password, nickname, email, authority, status, created) VALUES
    ('testuser1', 'testpass1', '山本', null, 'SUP', true, NOW()),
    ('testuser2', 'testpass2', '坂本', null, 'COM', true, NOW()),
    ('testuser3', 'testpass3', 'キム', 'testuser3@email.com', 'COM', true, NOW()),
    ('testuser4', 'testpass4', '鈴木', null, 'COM', true, NOW()),
    ('testuser5', 'testpass5', '佐藤', null, 'COM', true, NOW()),
    ('testuser6', 'testpass6', '正義', null, 'EXI', false, NOW()),
    ('testuser7', 'testpass7', '高木', null, 'COM', true, NOW()),
    ('testuser8', 'testpass8', '吉本', null, 'DIS', false, NOW()),
    ('testuser9', 'testpass9', '浜田', null, 'COM', true, NOW()),
    ('testuser10', 'testpass10', 'ユン', null, 'COM', true, NOW());

INSERT INTO projects (member_id, external_key, title, content, permission, status, created) VALUES
    (2, 'd2c296eca2b743f0a9f68beb20fcfe1c', '〇〇市上水道配管更新業務', '〇〇市の老朽化した上水道配管の交換作業。市内5区域の配管を新型耐震素材に更新し、漏水防止と水質向上を図る。工期は2025年4月から9月までの予定。', 'PUB', true, NOW()),
    (3, 'd2c296easdfghjkla9f68beb20fcfe1c', '丸の内オフィスビル空調設備メンテナンス', '丸の内エリアの大型オフィスビル15棟の空調設備の定期点検および部品交換作業。省エネ効率向上のための最新システムへのアップグレードも含む。夏季の冷房稼働率向上が目的。', 'PUB', true, NOW()),
    (3, '1a069c819cc74d07aa27897048bc622d', '京都市内寺院庭園の維持管理作業', '京都市内の歴史的価値のある5つの寺院庭園における定期的な植栽管理、苔の手入れ、砂利の整備作業。文化財保護の観点から伝統的な手法を用いた作業が必要。月2回の定期訪問を1年間継続予定。', 'PUB', true, NOW()),
    (4, '0f43d060ec75442d913fcebfae164675', '横浜港湾区域倉庫再建築のための解体作業', '横浜港湾地区の老朽化した倉庫群（建築後45年）の解体および廃材処理作業。アスベスト含有建材の安全な除去と処分が含まれる。新物流センター建設のための基礎工事準備も担当。', 'PUB', true, NOW()),
    (4, '02494b526a1b4f9eb48637304fdb2e34', '東北地方防災シェルター耐震強化プロジェクト', '東北地方の5県にある防災シェルター10施設の耐震強化工事。東日本大震災の教訓を活かした最新の耐震技術を導入し、避難所としての機能を強化。非常用電源設備の更新も含む。', 'PUB', true, NOW()),
    (7, '5e25ef75af6c4e8cab64f8cc50a37a15', '多宗教施設バリアフリー化改修工事', '都内の寺院、教会、モスクなど多宗教施設8箇所のバリアフリー化工事。スロープ設置、手すり取り付け、多目的トイレ設置などを行い、高齢者や障害者の参拝・礼拝環境を改善する。', 'PUB', true, NOW()),
    (7, 'a4bda4e166544c0496f8c562b7bf1aa1', '〇〇市下水処理インフラ施設更新プロジェクト', '〇〇市の下水処理場における老朽化したポンプ設備と配管システムの更新作業。処理能力の向上と環境負荷低減を目的とした最新技術の導入。豪雨時の排水能力強化も含む総合的な改修工事。', 'PUB', true, NOW()),
    (8, '0000fce461f64d739dde831398739ef1', '新宿歌舞伎町歩道改修保守プロジェクト', '新宿歌舞伎町エリアの歩道タイル交換、排水溝清掃、街路灯LED化を含む総合的な歩行環境改善工事。観光客の安全確保と夜間の防犯性向上を目的とする。工期は夜間作業を中心に3ヶ月を予定。', 'PUB', true, NOW()),
    (9, '8768425f34d94eb9b24c9d7c1f71603a', '大型商業施設地下駐車場整備改修作業', '首都圏の大型商業施設における地下駐車場（収容台数800台）の路面補修、区画線引き直し、照明設備更新、EV充電スタンド新設を含む総合改修工事。営業時間外の夜間作業で実施予定。', 'PUB', true, NOW()),
    (null, 'e6b8534df9a14008829350626529c89d', '〇〇駅周辺バリアフリー化推進事業', '〇〇駅及び周辺500m圏内の歩道の段差解消、点字ブロック設置、音声案内システム導入などのバリアフリー化工事。高齢者や障害者の移動の利便性向上を目的とし、2025年のパラスポーツ大会に向けた都市整備の一環として実施。', 'PUB', true, NOW());

INSERT INTO project_member (project_id, member_id, created) VALUES
    (1, 2, NOW()),
    (2, 3, NOW()),
    (3, 3, NOW()),
    (4, 4, NOW()),
    (5, 4, NOW()),
    (6, 7, NOW()),
    (7, 7, NOW()),
    (8, 9, NOW()),
    (9, 3, NOW()),
    (10, 3, NOW());

INSERT INTO tasks (project_id, member_id, title, content, start_date, end_date, created) VALUES
    (1,  1, '作業1', '作業1のコンテンツです', null, null, NOW()),
    (2,  1, '作業2', '作業1のコンテンツです', null, null, NOW()),
    (3,  3, '作業3', '作業1のコンテンツです', null, null, NOW()),
    (4,  4, '作業4', '作業1のコンテンツです', null, null, NOW()),
    (5,  5, '作業5', '作業1のコンテンツです', null, null, NOW());
