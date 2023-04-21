-- to find the witnesses information.
select * from crime_scene_report
where crime_scene_report.date = 20180115
and crime_scene_report.city = 'SQL City'
and type = 'murder';


-- to find the id number of witnesses to reach the interview's of witnesses.
select * from person
where (person.name like 'Annabel%' 
and  person.address_street_name = 'Franklin Ave')
or (person.address_street_name = 'Northwestern Dr'
	and person.address_number = (select max(address_number) from person 
	 where address_street_name = 'Northwestern Dr'));

  
-- to find the interviews.
select person.id 
	 , person.name
	, interview.transcript
from person
inner join interview
	on person.id = interview.person_id
		
where ( person.name like 'Annabel%' 
		and  person.address_street_name = 'Franklin Ave')
	 
		or (person.address_street_name = 'Northwestern Dr'
		and person.address_number = (select max(address_number) from person 
	 	where address_street_name = 'Northwestern Dr'));
   
   /*
   
   INTERVIEWS
   I heard a gunshot and then saw a man run out. He had a "Get Fit Now Gym" bag. 
   The membership number on the bag started with "48Z". 
   Only gold members have those bags. 
   The man got into a car with a plate that included "H42W".
   
   I saw the murder happen, and I recognized the killer from my gym 
   when I was working out last week on January the 9th. 
   */
   
 
 -- to find possible suspects from plate number, finding the license id to find the person id
 select * from drivers_license
 
 where plate_number like '%H42W%'; 
 
 -- OUTPUT : 183779, 423327, 664760

-- to find person id

select * from person

where license_id in (183779,423327, 664760); 
-- OUTPUT:  51739, 67318, 78193


-- to find possible suspects from member number
select * from get_fit_now_member 
								-- OUTPUTS
                                -- 48Z38    49550   Tomas Baisley
								-- 48Z7A	28819	Joe Germuska
								-- 48Z55	67318	Jeremy Bowers - (Murderer)
where id like '48Z%';


-- to find the interview of murderer.
select * from interview
where person_id = '67318';

/*
I was hired by a woman with a lot of money. 
I don't know her name but I know she's around 5'5" (65") or 5'7" (67"). 
She has red hair and she drives a Tesla Model S. 
I know that she attended the SQL Symphony Concert 3 times in December 2017.

*/
-- to find the mastermind8
select person.*,
drivers_license.*
from person,
facebook_event_checkin,
drivers_license
where person.license_id = drivers_license.id
and facebook_event_checkin.person_id = person.id
and facebook_event_checkin.event_name = 'SQL Symphony Concert'
order by person_id; 

-- The murderer is Miranda Priestly!


