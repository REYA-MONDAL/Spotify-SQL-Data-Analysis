-- create table
DROP TABLE IF EXISTS spotify;
CREATE TABLE spotify (
    artist VARCHAR(255),
    track VARCHAR(255),
    album VARCHAR(255),
    album_type VARCHAR(50),
    danceability FLOAT,
    energy FLOAT,
    loudness FLOAT,
    speechiness FLOAT,
    acousticness FLOAT,
    instrumentalness FLOAT,
    liveness FLOAT,
    valence FLOAT,
    tempo FLOAT,
    duration_min FLOAT,
    title VARCHAR(255),
    channel VARCHAR(255),
    views FLOAT,
    likes BIGINT,
    comments BIGINT,
    licensed BOOLEAN,
    official_video BOOLEAN,
    stream BIGINT,
    energy_liveness FLOAT,
    most_played_on VARCHAR(50)
);

SELECT * FROM spotify;

SELECT COUNT (*) FROM spotify;

SELECT DISTINCT (album) FROM spotify;
SELECT DISTINCT (artist) FROM spotify limit 10;
SELECT DISTINCT (album_type) FROM spotify ;
SELECT MAX ( duration_min) FROM spotify;
SELECT MIN ( duration_min) FROM spotify;

--DELETE NULL VALUES
SELECT * FROM spotify WHERE ( duration_min) = 0;

DELETE FROM spotify 
WHERE ( duration_min)= 0;

SELECT * FROM spotify WHERE ( duration_min)= 0;

-- WHAT I ANALYSIS---

---1.Retrieve the names of all tracks that have more than 1 billion streams.
	SELECT * FROM spotify 
	WHERE stream>1000000000;

--2.List all albums along with their respective artists.
	SELECT album, artist 
	FROM spotify;
	
--3.Get the total number of comments for tracks where licensed = TRUE.
	SELECT SUM (comments) AS TOTAL_COMMENTS
	FROM spotify
	WHERE licensed = 'true';
	
--4.Find all tracks that belong to the album type single.
	SELECT track,album_type
	FROM spotify
	WHERE album_type ='single';
	


--5.Count the total number of tracks by each artist.
	SELECT artist ,COUNT (track) AS TOTAL_TRACKS
	FROM spotify
	GROUP BY artist;
	

---6.Calculate the average danceability of tracks in each album.
	SELECT album,AVG (danceability)
	FROM spotify
	GROUP BY album;
	
	
--7.Find the top 5 tracks with the highest energy values.
	SELECT track , MAX (energy) AS ENERGY_AVG
	FROM spotify
	GROUP BY track
	ORDER BY ENERGY_AVG DESC
	limit 5 ;

--8.List all tracks along with their views and likes where official_video = TRUE.
	SELECT track, views, likes 
	FROM spotify
	WHERE official_video = 'true';
	
--9.For each album, calculate the total views of all associated tracks.
	 SELECT album, SUM (views) AS total_view 
	 FROM spotify
	 GROUP BY album
	 ORDER BY total_view DESC;
	 
--10.Retrieve the track names that have been streamed on Spotify more than YouTube.
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
GROUP BY track;
	 
	 


