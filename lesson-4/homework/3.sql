select empid, empname, birthdate
from empbirth
where month(birthdate) = 5 and day(birthdate) between 7 and 15