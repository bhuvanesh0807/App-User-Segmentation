CREATE DATABASE app_analytics;
USE app_analytics;
CREATE TABLE user_behavior_segments (
    user_id INT PRIMARY KEY,
    sessions_per_week INT,
    avg_session_duration_min FLOAT,
    feature_clicks_per_session INT,
    pages_viewed_per_session INT,
    days_since_last_login INT,
    subscription_type VARCHAR(50),
    cluster INT -- This holds the labels (0, 1, 2, or 3)
);

SELECT 
    cluster,
    COUNT(user_id) AS total_users,
    AVG(sessions_per_week) AS avg_weekly_visits,
    AVG(feature_clicks_per_session) AS avg_clicks
FROM 
    user_behavior_segments
GROUP BY 
    cluster
ORDER BY 
    avg_weekly_visits DESC;
    
    SELECT 
    user_id, 
    days_since_last_login 
FROM 
    user_behavior_segments 
WHERE 
    cluster = 2 
ORDER BY 
    days_since_last_login DESC;
    
    SELECT 
    user_id, 
    feature_clicks_per_session 
FROM 
    user_behavior_segments 
WHERE 
    cluster = 0 
    AND subscription_type = 'Basic';