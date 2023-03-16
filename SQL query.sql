#1.Introduction to Dataset#
select *
from blood_bank.dataset;

#2.No of Blood Banks in India#
select
count(*) as No_of_Blood_Banks
from blood_bank.dataset;

#3.State wise No of Blood Banks in India#
select state,
count(*) as state_wise_count
from blood_bank.dataset
group by State
order by state_wise_count desc;

#4.Availability of Apheresis facility#
select State,
count(*) as Apheresis_wise_count
from blood_bank.dataset
where Apheresis ='YES'
group by State
order by Apheresis_wise_count desc;

#5.24/7 available blood banks#
select State,
count(*) as Service_Time_count
from blood_bank.dataset
where Service_Time like '%24%'
group by State
order by service_time_count desc;

#6.category wise blood banks-Government & Charity#
select State,
count(*) as Category_count
from blood_bank.dataset
where category in ('Government', 'Charity')
group by State
order by Category_count desc;

#7.Blood component availability blood banks#
select State,
count(blood_component_available) as blood_Comp_Avb_count
from blood_bank.dataset
where blood_component_available = "YES"
group by State
order by blood_Comp_Avb_count desc;

#8.No of licensed blood banks#
select State,
count(*) as License_Avb_count
from blood_bank.dataset
where license != ''
group by State
order by License_Avb_count desc;

#9.Creating case-Fully functional blood banks#
select Blood_Bank_Name, City, Pincode, Mobile,
case
when Blood_Component_Available = "YES" and 
Apheresis = "YES" and
Service_Time like '%24%'
then 'Totally Functional'
else 'Partially Functional' 
end as Functionality_Status
from blood_bank.dataset
where license != '' and State ='Maharashtra';

#10.States having no of blood banks Less than 30#
select state,
count(*) as Less_than_30_blood_banks
from blood_bank.dataset
group by state
having count(*) < 30;

