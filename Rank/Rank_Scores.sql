#178. Rank Scores

#Write an SQL query to rank the scores. The ranking should be calculated according to the following rules:

#The scores should be ranked from the highest to the lowest.
#If there is a tie between two scores, both should have the same ranking.
#After a tie, the next ranking number should be the next consecutive integer value. In other words, there should be no holes between ranks.
#Return the result table ordered by score in descending order.

#The query result format is in the following example.

#Answer:- 

DROP TABLE IF EXISTS Scores;
Create table If Not Exists Scores (Id int, Score DECIMAL(3,2));
Truncate table Scores;
insert into Scores (Id, Score) values ('1', '3.5');
insert into Scores (Id, Score) values ('2', '3.65');
insert into Scores (Id, Score) values ('3', '4.0');
insert into Scores (Id, Score) values ('4', '3.85');
insert into Scores (Id, Score) values ('5', '4.0');
insert into Scores (Id, Score) values ('6', '3.65');

Select * from Scores;

Select Id, Score, dense_rank() over(Order by Score Desc) as ranks from Scores;

