
-- =====================================================
-- PROJECT: Social Media Analytics
-- TOPIC: Advanced SQL Window Functions
-- DATABASE: social_media_analytics
-- TOOL: MySQL 8.0
-- =====================================================

USE social_media_analytics;


-- 1. ROW_NUMBER()
-- Assigns a unique sequential number to each tweet
-- based on likes, from highest to lowest.

SELECT
    tweet_id,
    tweet_text,
    like_count,
    ROW_NUMBER() OVER (
        ORDER BY like_count DESC, tweet_id
    ) AS row_num
FROM tweets;


-- 2. RANK()
-- Assigns the same rank to tweets with equal likes.
-- Skips the next rank after a tie.

SELECT
    tweet_id,
    like_count,
    RANK() OVER (
        ORDER BY like_count DESC
    ) AS tweet_rank
FROM tweets;


-- 3. DENSE_RANK()
-- Assigns the same rank to tied values.
-- Does not skip the next rank.

SELECT
    tweet_id,
    like_count,
    DENSE_RANK() OVER (
        ORDER BY like_count DESC
    ) AS dense_rank
FROM tweets;


-- 4. PARTITION BY
-- Ranks tweets separately for each user.

SELECT
    u.username,
    t.tweet_id,
    t.like_count,
    RANK() OVER (
        PARTITION BY t.author_id
        ORDER BY t.like_count DESC
    ) AS user_tweet_rank
FROM tweets t
INNER JOIN users u
    ON t.author_id = u.user_id;


-- 5. TOP 3 TWEETS BY LIKES
-- Returns the three most-liked tweets.

SELECT *
FROM (
    SELECT
        tweet_id,
        tweet_text,
        like_count,
        ROW_NUMBER() OVER (
            ORDER BY like_count DESC, tweet_id
        ) AS row_num
    FROM tweets
) ranked_tweets
WHERE row_num <= 3;


-- 6. TOP TWEET FOR EACH USER
-- Identifies the most-liked tweet per user.

SELECT *
FROM (
    SELECT
        u.username,
        t.tweet_id,
        t.like_count,
        ROW_NUMBER() OVER (
            PARTITION BY t.author_id
            ORDER BY t.like_count DESC, t.tweet_id
        ) AS row_num
    FROM tweets t
    INNER JOIN users u
        ON t.author_id = u.user_id
) user_rankings
WHERE row_num = 1;


-- 7. RUNNING TOTAL OF LIKES
-- Calculates cumulative likes ordered by tweet date.

SELECT
    tweet_id,
    created_at,
    like_count,
    SUM(like_count) OVER (
        ORDER BY created_at, tweet_id
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS running_total_likes
FROM tweets;


-- 8. COMPARE EACH TWEET WITH AVERAGE LIKES
-- Displays the overall average alongside each tweet.

SELECT
    tweet_id,
    like_count,
    ROUND(
        AVG(like_count) OVER (),
        2
    ) AS overall_average_likes,
    like_count - AVG(like_count) OVER ()
        AS difference_from_average
FROM tweets;


-- 9. LAG()
-- Compares each tweet's likes with the previous tweet.

SELECT
    tweet_id,
    created_at,
    like_count,
    LAG(like_count) OVER (
        ORDER BY created_at, tweet_id
    ) AS previous_tweet_likes
FROM tweets;


-- 10. LEAD()
-- Displays the likes of the next tweet.

SELECT
    tweet_id,
    created_at,
    like_count,
    LEAD(like_count) OVER (
        ORDER BY created_at, tweet_id
    ) AS next_tweet_likes
FROM tweets;


-- 11. ENGAGEMENT RANKING
-- Ranks tweets based on total engagement.

SELECT
    tweet_id,
    (
        reply_count +
        repost_count +
        like_count +
        quote_count
    ) AS total_engagement,
    DENSE_RANK() OVER (
        ORDER BY
        (
            reply_count +
            repost_count +
            like_count +
            quote_count
        ) DESC
    ) AS engagement_rank
FROM tweets;


-- 12. USER ENGAGEMENT RANKING
-- Aggregates engagement by user and ranks users.

SELECT
    username,
    total_engagement,
    DENSE_RANK() OVER (
        ORDER BY total_engagement DESC
    ) AS user_rank
FROM (
    SELECT
        u.user_id,
        u.username,
        SUM(
            t.reply_count +
            t.repost_count +
            t.like_count +
            t.quote_count
        ) AS total_engagement
    FROM users u
    INNER JOIN tweets t
        ON u.user_id = t.author_id
    GROUP BY u.user_id, u.username
) user_engagement;


-- =====================================================
-- END OF ADVANCED SQL WINDOW FUNCTIONS
-- =====================================================
