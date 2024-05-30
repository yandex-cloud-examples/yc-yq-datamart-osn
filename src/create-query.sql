{
    "name": "Fill OSN mart",
    "type": "ANALYTICS",
    "text": "insert into `osn-mart` (flights, fl_day, orig_hemisphere, dest_hemisphere)
      select
         cast(count(1) as UInt32) as flights, 
         cast(day as DATE) as fl_day,
         orig_hemisphere,
         dest_hemisphere
      from
         `osn-link`
      group by day,
         just(IF(longitude_1 > 0, 'EAST', 'WEST')) as orig_hemisphere,
         just(IF(longitude_2 > 0, 'EAST', 'WEST')) as dest_hemisphere;",
    "description": ""
  }
