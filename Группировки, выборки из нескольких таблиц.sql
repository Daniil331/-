
select id_genre, count(*)from genre_perfomer 
group by id_genre;

select name_album, realease_data, count(t.id) from Tracks t
join Album a on t.id_album = a.id
where a.realease_data between '2019'  and'2022'
group by a .realease_data, a.name_album
;

select avg(track_duration) from tracks t
join album a on t.id_album = a.id
group by id_album;

select id_performer from list_album la 
join Album a on la.id_album = a.id
where a.realease_data in('2020')

;

select distinct name_album, a.id from performer p 
join list_album la on p.id = la.id_performer
join album a on la.id_album = a.id 
join Tracks t on a.id  = t.id_album 
join collection_tracks ct on t.id = ct.id_track 
join collection c on ct.id_collection = c.id
where p.nick_name = 'Князь';

select name_album, count(id_genre) from album a2 
join list_album la on a2.id = la.id_album 
join performer p on la.id_performer = p.id  
join genre_perfomer gp on p.id = gp.id_perfomer
group by name_album, id_perfomer
having count(id_genre) > 1;

select distinct name_track from tracks t  
join collection_tracks ct  on t.id = ct.id_track 
join collection c on ct.id_collection  = c.id 
where ct.id_collection not in(ct.id_track);


select distinct nick_name  from performer p
join list_album la on p.id = la.id_performer  
join album a2  on la.id_album  = a2.id 
join tracks t on t.id_album = a2.id
where t.track_duration in (select min(t.track_duration)from tracks t2 )
;

SELECT a.name_album, COUNT(t.id) FROM albums a
JOIN tracks t  ON a.id = t.album_id
GROUP BY a.name_album 
HAVING count(t.id) in (
SELECT COUNT (t.id)
FROM albums a
JOIN tracks t  ON a.id = t.album_id
GROUP BY a.name_album
ORDER BY count(t.id)
LIMIT 1) 

















