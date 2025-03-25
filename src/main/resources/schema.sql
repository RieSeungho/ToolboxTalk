
/**
    TALK ABOUT TASK INFORMATION ON OFFLINE ENVIRONMENT
    タスクに登録されている情報で仕事での作業事項と危険要素を確認できる。
    その場合、タスクは地下などの通信が通じないところでも作業する可能性がある。
    タスクの情報をスマホとPCでカードの形態で保存できるようにすることを今後検討
*/

/**
    MEMBER TABLE
    ウェブアプリケーションを利用するユーザーのテーブル

    サーバー側で権限(authority), 活性化有無(status)

    権限一覧
    SUP(Super) : アドミン
    COM(Common) : 一般ユーザー
    DIS(Disable) : 中止されたユーザー
    EXI(Exit) : 脱退ユーザー
*/
CREATE TABLE members (
    id SERIAL NOT NULL PRIMARY KEY, -- 識別子
    username VARCHAR(20) NOT NULL, -- ユーザー名
    password VARCHAR(255) NOT NULL, -- パスワード(暗号化済み)
    nickname VARCHAR(20) NOT NULL, -- ニックネーム
    email VARCHAR(100) NULL, -- メールアドレス
    authority VARCHAR(20) NOT NULL, -- 権限
    status BOOLEAN NOT NULL DEFAULT TRUE, -- 状態
    created TIMESTAMP NOT NULL, -- 登録日
    updated TIMESTAMP NULL, -- 更新日
    deleted TIMESTAMP NULL -- 削除日(Soft Delete)
);

/**
    PROJECT TABLE
    プロジェクトのテーブル

    合流許可(permission)
    PUB(Public) : 管理者の許可がいらない
    PRI(Private) : 管理者の許可が必須
    FOR(forbidden) : プロジェクトの参加をブロック
*/
CREATE TABLE projects (
    id SERIAL NOT NULL PRIMARY KEY, -- 識別子
    member_id INTEGER NULL CONSTRAINT project_author_fk REFERENCES members (id) ON DELETE SET NULL, -- プロジェクトを登録したユーザー識別し
    external_key VARCHAR(50) NOT NULL, -- 外部のプロジェクト識別子
    title VARCHAR(100) NOT NULL, -- プロジェクトタイトル
    content TEXT NOT NULL, -- プロジェクト詳細
    permission VARCHAR(20) NOT NULL,
    status BOOLEAN NOT NULL DEFAULT TRUE, -- プロジェクト状態
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
    project_id INTEGER NOT NULL CONSTRAINT project_member_fk REFERENCES projects (id) ON DELETE CASCADE, -- プロジェクトの識別子
    member_id INTEGER NOT NULL CONSTRAINT project_join_member_fk REFERENCES members (id) ON DELETE CASCADE, -- ユーザーの識別子
    status BOOLEAN NOT NULL DEFAULT TRUE, -- プロジェクトに参加したユーザーの状態
    created TIMESTAMP NOT NULL, -- プロジェクトの参加日
    updated TIMESTAMP NULL -- プロジェクトのユーザーの状態
);

CREATE TABLE tasks (
    id SERIAL NOT NULL PRIMARY KEY,
    project_id INTEGER NOT NULL CONSTRAINT project_task_fk REFERENCES projects (id) ON DELETE CASCADE,
    member_id INTEGER NULL CONSTRAINT task_join_member_fk REFERENCES members (id) ON DELETE SET NULL,
    title VARCHAR(100) NOT NULL, -- タスクタイトル
    content TEXT NOT NULL, -- タスク詳細
    start_date TIMESTAMP,
    end_date TIMESTAMP,
    status BOOLEAN NOT NULL DEFAULT FALSE, -- タスク状態
    created TIMESTAMP NOT NULL, -- タスク登録日
    updated TIMESTAMP, -- タスク更新日
    deleted TIMESTAMP -- 削除日(Soft Delete)
);

CREATE TABLE task_comments (
    id SERIAL NOT NULL PRIMARY KEY,
    task_id INTEGER NOT NULL CONSTRAINT comment_task_fk REFERENCES tasks (id) ON DELETE CASCADE,
    member_id INTEGER NULL CONSTRAINT task_comment_author_fk REFERENCES members (id) ON DELETE SET NULL,
    content TEXT NOT NULL,
    status BOOLEAN NOT NULL DEFAULT TRUE,
    created TIMESTAMP NOT NULL, -- コメント登録日
    updated TIMESTAMP NULL, -- コメント更新日
    deleted TIMESTAMP NULL -- 削除日(Soft Delete)
);