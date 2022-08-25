#Write an SQL query to report the first login date for each player.

#Return the result table in any order.

DROP TABLE IF EXISTS Activity;
Create table If Not Exists Activity (player_id int, device_id int, event_date date, games_played int);
Truncate table Activity;
insert into Activity (player_id, device_id, event_date, games_played) values ('1', '2', '2016-03-01', '5');
insert into Activity (player_id, device_id, event_date, games_played) values ('1', '2', '2016-05-02', '6');
insert into Activity (player_id, device_id, event_date, games_played) values ('2', '3', '2017-06-25', '1');
insert into Activity (player_id, device_id, event_date, games_played) values ('3', '1', '2016-03-02', '0');
insert into Activity (player_id, device_id, event_date, games_played) values ('3', '4', '2018-07-03', '5');

Select * from Activity;
WITH CTE AS
  (
    SELECT
    player_id,
        event_date,
        DENSE_RANK() OVER(PARTITION BY player_id ORDER BY event_date) AS event_date_rank
  FROM Activity
    )
SELECT
  player_id,
    event_date AS first_login
FROM CTE
WHERE event_date_rank = 1;


WITH CTE AS
  (
    SELECT
    player_id,
        device_id,
        event_date,
        DENSE_RANK() OVER(PARTITION BY player_id ORDER BY event_date) AS event_date_rank
  FROM Activity
    )
SELECT player_id, device_id
FROM CTE
WHERE event_date_rank = 1;