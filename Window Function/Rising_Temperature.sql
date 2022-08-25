DROP TABLE IF EXISTS Weather;
Create table If Not Exists Weather (Id int, RecordDate date, Temperature int);
Truncate table Weather;
insert into Weather (Id, RecordDate, Temperature) values ('1', '2015-01-01', '10');
insert into Weather (Id, RecordDate, Temperature) values ('2', '2015-01-02', '25');
insert into Weather (Id, RecordDate, Temperature) values ('3', '2015-01-03', '20');
insert into Weather (Id, RecordDate, Temperature) values ('4', '2015-01-04', '30');

Select * from Weather;

SELECT w2.id
FROM Weather w1
INNER JOIN Weather w2 ON DATEDIFF(w2.recordDate, w1.recordDate) = 1 # Don't use `w1.id = w2.id - 1` since the record may be shuffled.
WHERE w2.Temperature > w1.Temperature;