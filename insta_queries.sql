# --- 1. We want to reward our users who have been around the longest: FIND THE 5 OLDEST USERS

SELECT * FROM users
ORDER BY created_at ASC
LIMIT 5;

# ---2. We need to figure out when to schedule an ad campaign: WHAT DAY OF THE WEEK DO MOST USERS REGISTER ON?

 SELECT 
    DAYNAME(created_at) AS 'day', 
    COUNT(created_at) AS 'created accounts'
 FROM users
 GROUP BY(DAYNAME(created_at))
 ORDER BY (COUNT(created_at)) DESC;

-- OR

SELECT 
   DAYNAME(created_at) AS day,
   COUNT(*) AS total
FROM users
GROUP BY day
ORDER BY total DESC;

# --- 3. We want to target our inactive users with an email campaign. FIND THE USERS WHO HAVE NEVER POSTED A PHOTO
    
SELECT 
    username, 
    photos.id 
FROM users
LEFT JOIN photos
ON photos.user_id = users.id
WHERE photos.id IS NULL;
    
 # --- 4. We're running a new contest to see who can get the most likes on a single photo. WHO WON?   
    

SELECT 
   users.id,
    users.username,
    photos.id AS 'photo id',
    photos.image_url,
    COUNT(*) AS 'total likes' 
FROM photos
INNER JOIN likes
    ON photos.id = likes.photo_id
INNER JOIN users
    ON users.id = photos.user_id
GROUP BY(photos.id)
ORDER BY COUNT(*) DESC
LIMIT 1
;
    
    
# --- 5. Our investors want to know... HOW MANY TIMES DOES THE AVERAGE USER POST?
    
SELECT 
    (SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) 
FROM users);
    

# --- 6. A brand wants to know which hashtags to use in a post. WHAT ARE THE TOP 5 MOST COMMONLY USED HASHTAGS?
    
SELECT 
    tags.tag_name,
    COUNT(*) AS total
FROM tags
JOIN photo_tags
    ON tags.id = photo_tags.tag_id
GROUP BY tags.id
ORDER BY total DESC
LIMIT 5
;

# --- 7. We have a small problem with bots on our site... FIND USERS WHO HAVE LIKED EVERY SINGLE PHOTO ON THE SITE

SELECT 
    username,
    user_id,
    COUNT(*) AS num_likes
FROM likes
INNER JOIN users
    ON likes.user_id = users.id
GROUP BY likes.user_id
HAVING num_likes = (SELECT COUNT(*) FROM photos);







