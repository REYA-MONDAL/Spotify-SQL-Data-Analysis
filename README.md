

Spotify SQL Data Analysis
📌 Project Overview

This project focuses on analyzing Spotify music data using SQL to understand track performance, artist performance, album insights, streaming trends, and audience engagement.

The project also includes basic data cleaning before performing SQL analysis.

🎯 Objectives
Identify highly streamed tracks
Analyze albums and artists
Calculate total tracks by artist
Analyze average danceability by album
Identify tracks with the highest energy
Analyze views and likes for official videos
Calculate total album views
Compare Spotify and YouTube streaming performance
🛠️ Tools & Technologies
SQL
PostgreSQL / MySQL
CSV Dataset
GitHub
🧹 Data Cleaning

Before analysis, I checked for invalid duration values:

SELECT *
FROM spotify
WHERE duration_min = 0;

Records with duration_min = 0 were removed:

DELETE FROM spotify
WHERE duration_min = 0;
📊 SQL Analysis Performed
1. Tracks with more than 1 billion streams
SELECT *
FROM spotify
WHERE stream > 1000000000;
2. Albums and artists
SELECT DISTINCT album, artist
FROM spotify;
3. Total comments for licensed tracks
SELECT SUM(comments) AS total_comments
FROM spotify
WHERE licensed = TRUE;
4. Tracks belonging to single albums
SELECT track, album_type
FROM spotify
WHERE album_type = 'single';
5. Total tracks by artist
SELECT artist,
       COUNT(track) AS total_tracks
FROM spotify
GROUP BY artist;
6. Average danceability by album
SELECT album,
       AVG(danceability) AS avg_danceability
FROM spotify
GROUP BY album;
7. Top 5 tracks by energy
SELECT track,
       MAX(energy) AS max_energy
FROM spotify
GROUP BY track
ORDER BY max_energy DESC
LIMIT 5;
8. Official video performance
SELECT track, views, likes
FROM spotify
WHERE official_video = TRUE;
9. Total views by album
SELECT album,
       SUM(views) AS total_views
FROM spotify
GROUP BY album
ORDER BY total_views DESC;
10. Spotify streams greater than YouTube
SELECT 
    track,
    COALESCE(
        SUM(CASE 
            WHEN most_played_on = 'YouTube' THEN stream
        END), 0
    ) AS youtube_streams,
    COALESCE(
        SUM(CASE 
            WHEN most_played_on = 'Spotify' THEN stream
        END), 0
    ) AS spotify_streams
FROM spotify
GROUP BY track
HAVING 
    COALESCE(SUM(CASE 
        WHEN most_played_on = 'Spotify' THEN stream
    END), 0)
    >
    COALESCE(SUM(CASE 
        WHEN most_played_on = 'YouTube' THEN stream
    END), 0);
🧠 SQL Concepts Used
SELECT
WHERE
DISTINCT
COUNT()
SUM()
AVG()
MAX()
GROUP BY
ORDER BY
LIMIT
CASE WHEN
COALESCE()
HAVING
Data cleaning with DELETE
📁 Project Files
Spotify-SQL-Data-Analysis/
│
├── Spotify_Project.sql
├── cleaned_dataset.csv
└── README.md
💡 Key Learning

Through this project, I practiced using SQL to perform data cleaning, filtering, aggregation, grouping, conditional calculations, and business-oriented analysis on a real-world music dataset.

👩‍💻 Author

Reya Mondal

Skills: SQL | Excel | Power BI | Data Analysis
