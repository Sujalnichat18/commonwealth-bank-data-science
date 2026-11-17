-- Illustrative MySQL schema proposed as a learning exercise.
-- This is an original design, not a production Commonwealth Bank schema.

CREATE DATABASE IF NOT EXISTS social_media_analytics;
USE social_media_analytics;

CREATE TABLE users (
    user_id BIGINT PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    display_name VARCHAR(150),
    verified BOOLEAN DEFAULT FALSE,
    followers_count BIGINT,
    account_created_at DATETIME,
    CHECK (followers_count IS NULL OR followers_count >= 0)
);

CREATE TABLE tweets (
    tweet_id BIGINT PRIMARY KEY,
    author_id BIGINT NOT NULL,
    tweet_text TEXT,
    created_at DATETIME NOT NULL,
    conversation_id BIGINT,
    language_code VARCHAR(10),
    reply_count INT DEFAULT 0,
    repost_count INT DEFAULT 0,
    like_count INT DEFAULT 0,
    quote_count INT DEFAULT 0,
    collected_at DATETIME,
    CONSTRAINT fk_tweets_author
        FOREIGN KEY (author_id) REFERENCES users(user_id),
    CHECK (reply_count >= 0),
    CHECK (repost_count >= 0),
    CHECK (like_count >= 0),
    CHECK (quote_count >= 0)
);

CREATE TABLE tweet_relationships (
    relationship_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    source_tweet_id BIGINT NOT NULL,
    target_tweet_id BIGINT NOT NULL,
    relationship_type ENUM('REPLY', 'QUOTE') NOT NULL,
    CONSTRAINT fk_relationship_source
        FOREIGN KEY (source_tweet_id) REFERENCES tweets(tweet_id),
    CONSTRAINT fk_relationship_target
        FOREIGN KEY (target_tweet_id) REFERENCES tweets(tweet_id),
    CONSTRAINT uq_tweet_relationship
        UNIQUE (source_tweet_id, target_tweet_id, relationship_type)
);

CREATE TABLE tweet_mentions (
    mention_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    tweet_id BIGINT NOT NULL,
    mentioned_user_id BIGINT NOT NULL,
    mention_text VARCHAR(150),
    CONSTRAINT fk_mentions_tweet
        FOREIGN KEY (tweet_id) REFERENCES tweets(tweet_id),
    CONSTRAINT fk_mentions_user
        FOREIGN KEY (mentioned_user_id) REFERENCES users(user_id),
    CONSTRAINT uq_tweet_mention
        UNIQUE (tweet_id, mentioned_user_id)
);

CREATE INDEX idx_tweets_created_at ON tweets(created_at);
CREATE INDEX idx_tweets_author_id ON tweets(author_id);
CREATE INDEX idx_relationships_target ON tweet_relationships(target_tweet_id);
CREATE INDEX idx_mentions_user ON tweet_mentions(mentioned_user_id);
