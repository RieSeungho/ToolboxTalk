
/**
    TALK ABOUT TASK INFORMATION ON OFFLINE ENVIRONMENT
    タスクに登録されている情報で仕事での作業事項と危険要素を確認できる。
    その場合、タスクは地下などの通信が通じないところでも作業する可能性がある。
    タスクの情報をスマホとPCでカードの形態で保存できるようにすることを今後検討
*/

/**
    MEMBER TABLE
    ウェブアプリケーションを利用するユーザーのテーブル
*/
CREATE TABLE members (
    id SERIAL NOT NULL PRIMARY KEY, -- 識別子
    username VARCHAR(20) NOT NULL, -- ユーザー名
    password VARCHAR(255) NOT NULL, -- パスワード(暗号化済み)
    nickname VARCHAR(20) NOT NULL, -- ニックネーム
    email VARCHAR(100) NULL, -- メールアドレス
    authority VARCHAR(20) NOT NULL, -- 権限
    status BOOLEAN NOT NULL, -- 状態
    created TIMESTAMP NOT NULL, -- 登録日
    updated TIMESTAMP NULL, -- 更新日
    deleted TIMESTAMP NULL -- 削除日(Soft Delete)
);

/**
    PROJECT TABLE
    プロジェクトのテーブル
*/
CREATE TABLE projects (
    id SERIAL NOT NULL PRIMARY KEY, -- 識別子
    member_id INTEGER NULL CONSTRAINT member_fk REFERENCES members (id) ON DELETE SET NULL, -- プロジェクトを登録したユーザー識別し
    external_key VARCHAR(50) NOT NULL, -- 外部のプロジェクト識別子
    title VARCHAR(100) NOT NULL, -- プロジェクトタイトル
    content TEXT NOT NULL, -- プロジェクト詳細
    status BOOLEAN NOT NULL, -- プロジェクト状態
    created TIMESTAMP NOT NULL, -- プロジェクト登録日
    updated TIMESTAMP NULL, -- プロジェクト更新日
    deleted TIMESTAMP NULL -- 削除日(Soft Delete)
);

/**
    PROJECT_MEMBER TABLE
    プロジェクトに参加したユーザーを登録
*/
CREATE TABLE project_member (
    id SERIAL NOT NULL PRIMARY KEY, -- 識別子
    project_id INTEGER NOT NULL CONSTRAINT project_fk REFERENCES projects (id) ON DELETE CASCADE, -- プロジェクトの識別子
    member_id INTEGER NOT NULL CONSTRAINT member_fk REFERENCES members (id) ON DELETE CASCADE, -- ユーザーの識別子
    status BOOLEAN NULL, -- プロジェクトに参加したユーザーの状態
    created TIMESTAMP NOT NULL, -- プロジェクトの参加日
    updated TIMESTAMP NOT NULL -- プロジェクトのユーザーの状態
);

/**
    HAZARD TABLE
    プロジェクトの危険要素を列挙するテーブル
    プロジェクトに参加した人員は危険要素を知ることになる

CREATE TABLE hazards (
    id SERIAL NOT NULL PRIMARY KEY, -- 識別子
    name VARCHAR(50) NOT NULL, -- 危険要素名
    description VARCHAR(255) NOT NULL, -- 危険要素の詳細情報
    type VARCHAR(100) NULL, -- 危険要素イメージタイプ
    size INTEGER NULL, -- 危険要素イメージサイズ
    path VARCHAR(255) NULL -- 危険要素イメージの経路
);
*/

/**
    PROJECT_HAZARD TABLE
    プロジェクトと危険要素を結ぶテーブル

CREATE TABLE project_hazards (
    -- 速度をために除外しないことにする、後でサーバーで重複をチェックする
    id SERIAL NOT NULL PRIMARY KEY,
    -- プロジェクトの識別子、プロジェクトが削除される場合、この行も削除される
    project_id INTEGER NOT NULL CONSTRAINT project_pk REFERENCES projects (id) ON DELETE CASCADE,
    -- 危険要素の識別子、危険要素が削除される場合、この行も削除される
    hazard_id INTEGER NOT NULL CONSTRAINT hazard_id REFERENCES hazards (id) ON DELETE CASCADE,
    -- 危険要素が列挙された時間帯を表示
    selected TIMESTAMP NOT NULL
);
*/

CREATE TABLE tasks (
    id SERIAL NOT NULL PRIMARY KEY,
    project_id INTEGER NOT NULL CONSTRAINT project_fk REFERENCES projects (id) ON DELETE CASCADE,
    member_id INTEGER NOT NULL CONSTRAINT member_fk REFERENCES members (id) ON DELETE CASCADE,
    title VARCHAR(100) NOT NULL, -- タスクタイトル
    content TEXT NOT NULL, -- タスク詳細
    status BOOLEAN NOT NULL, -- タスク状態
    created TIMESTAMP NOT NULL, -- タスク登録日
    updated TIMESTAMP NULL, -- タスク更新日
    deleted TIMESTAMP NULL -- 削除日(Soft Delete)
);

CREATE TABLE task_comments (
    id SERIAL NOT NULL PRIMARY KEY,
    task_id INTEGER NOT NULL CONSTRAINT task_fk REFERENCES tasks (id) ON DELETE CASCADE,
    content TEXT NOT NULL,
    status BOOLEAN NOT NULL,
    created TIMESTAMP NOT NULL, -- コメント登録日
    updated TIMESTAMP NULL, -- コメント更新日
    deleted TIMESTAMP NULL -- 削除日(Soft Delete)
);