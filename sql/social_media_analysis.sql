
USE social_media_analytics;

-- 1. Total engagement by user
SELECT
    u.username,
    SUM(t.reply_count + t.repost_count +
        t.like_count + t.quote_count) AS total_engagement
FROM users u
INNER JOIN tweets t ON u.user_id = t.author_id
GROUP BY u.user_id, u.username
ORDER BY total_engagement DESC;

-- 2. Users who have never posted
SELECT
    u.user_id,
    u.username
FROM users u
LEFT JOIN tweets t ON u.user_id = t.author_id
WHERE t.tweet_id IS NULL;

-- 3. Average likes per tweet
SELECT ROUND(AVG(like_count), 2) AS average_likes
FROM tweets;

-- 4. Tweets with more likes than average
SELECT tweet_id, tweet_text, like_count
FROM tweets
WHERE like_count > (SELECT AVG(like_count) FROM tweets)
ORDER BY like_count DESC;

-- 5. Mentions received by each tweet
SELECT
    t.tweet_id,
    COUNT(m.mention_id) AS total_mentions
FROM tweets t
LEFT JOIN tweet_mentions m ON t.tweet_id = m.tweet_id
GROUP BY t.tweet_id
ORDER BY total_mentions DESC;

-- 6. Users with above-average followers
SELECT username, followers_count
FROM users
WHERE followers_count > (SELECT AVG(followers_count) FROM users)
ORDER BY followers_count DESC;
