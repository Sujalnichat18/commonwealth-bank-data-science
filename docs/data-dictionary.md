# Data Dictionary – Social Media Analytics

## Project Database
Database name: `social_media_analytics`

This database uses synthetic sample data to demonstrate relational database design and SQL-based social media analysis.

## 1. Users

Stores information about social media users.

| Column | Description |
|---|---|
| user_id | Unique user identifier (Primary Key) |
| username | User's unique username |
| display_name | User's display name |
| verified | Whether the account is verified |
| followers_count | Number of followers |
| account_created_at | Account creation date |

## 2. Tweets

Stores social media posts and engagement metrics.

| Column | Description |
|---|---|
| tweet_id | Unique post identifier (Primary Key) |
| author_id | User who created the post (Foreign Key) |
| tweet_text | Content of the post |
| created_at | Post creation date and time |
| conversation_id | Conversation identifier |
| language_code | Language of the post |
| reply_count | Number of replies |
| repost_count | Number of reposts |
| like_count | Number of likes |
| quote_count | Number of quote posts |

## 3. Tweet Relationships

Stores relationships between posts.

| Column | Description |
|---|---|
| relationship_id | Unique relationship identifier (Primary Key) |
| source_tweet_id | Post initiating the relationship |
| target_tweet_id | Related post |
| relationship_type | REPLY or QUOTE |

## 4. Tweet Mentions

Stores public user mentions in posts.

| Column | Description |
|---|---|
| mention_id | Unique mention identifier (Primary Key) |
| tweet_id | Post containing the mention (Foreign Key) |
| mentioned_user_id | User being mentioned (Foreign Key) |
| mention_text | Mentioned username or text |

## Relationships

- One user can create multiple tweets.
- One tweet can have multiple replies or quote relationships.
- One tweet can mention multiple users.
- One user can be mentioned in multiple tweets.

## Notes

- Primary keys uniquely identify records.
- Foreign keys maintain relationships between tables.
- All practice records are synthetic.
- No real customer information or private messages are included.
