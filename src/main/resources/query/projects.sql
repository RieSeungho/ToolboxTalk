/*
    プロジェクトの外部キーを生成
    UUIDを利用
*/
SELECT REPLACE(CAST(gen_random_uuid() AS TEXT), '-', '');

/*
    会員の情報を更新
*/
UPDATE members SET nickname = '田中', updated = NOW() WHERE id = 3;

/*
    プロジェクト一覧を閲覧する時のクエリー
*/
SELECT
    pr.id AS pr_id,
    me.id AS me_id,
    me.nickname AS me_nickname,
    pr.external_key,
    pr.title AS pr_title,
    pr.content AS pr_content,
    pr.status AS pr_status,
    pr.created AS pr_created,
    pr.updated AS pr_updated,
    pr.deleted AS pr_deleted
FROM projects pr
    LEFT JOIN members me ON pr.member_id = me.id
WHERE
    pr.deleted IS NULL OR
    pr.status IS NOT FALSE;