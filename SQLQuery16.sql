select * from players
select * from matches;
/* write sql query to find out the winner in each group 
The winner in each group is the player who scared the maximum total points within the group, 
IN the case of tie  ---- the lowest player win 
*/

with player_score as(
select first_player as player_id , first_score as score from matches 
union all select second_player as player_id ,second_score as score from matches )
, final_score as(
select p.group_id , ps.player_id ,sum(score) as score from player_score ps
inner join players p on p.player_id = ps. player_id group by p. p.group_id , ps.player_id)
,final_ranking AS (
    SELECT *,
           RANK() OVER(
               PARTITION BY group_id
               ORDER BY score DESC, player_id ASC
           ) AS rn
    FROM final_score
)


WITH player_score AS (
    SELECT first_player AS player_id, first_score AS score
    FROM matches
    UNION ALL
    SELECT second_player AS player_id, second_score AS score
    FROM matches
),
final_score AS (
    SELECT p.group_id,
           ps.player_id,
           SUM(ps.score) AS score
    FROM player_score ps
    INNER JOIN players p
        ON p.player_id = ps.player_id
    GROUP BY p.group_id, ps.player_id
),
final_ranking AS (
    SELECT *,
           RANK() OVER(
               PARTITION BY group_id
               ORDER BY score DESC, player_id ASC
           ) AS rn
    FROM final_score
)
SELECT *
FROM final_ranking
ORDER BY group_id, rn;


  