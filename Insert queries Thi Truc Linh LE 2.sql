INSERT into intake(intakeid,nameintake,intyear)
             values (1,'Fall Program', 2021),(2,'Spring Program', 2021);

INSERT into course(courseid,name,duration,teachingunit,coefficient)
             values (1,'relational database','60 Hours','technical foundation',1),(3,'project management','60 Hours','cultural intergation',2);


INSERT into userlogin(userid,username,password)
             values (2469,'thomas','ABCD123'),(2489,'françois','AZER34'),(2470,'stephanie','ABCD896');

INSERT into teacher(teacherid,firstname,lastname,email,phone,bankaccount,internal,userid)
             values (1,'thomas','Broussard','thomas.broussard@epita.fr','0659876524','xyz123',1,2469),(2,'françois','Hu','françois.hud@epita.fr','0659880567','xyz456',0,2489);

INSERT into admin(adminid,firstname,lastname,email,userid)
             values (1,'stephanie','Chatele','stephanie.chatele@epita.fr',2470);

INSERT into room(roomid,location)
             values (601,'Kremlin-Bicêtre 6th floor'),(604,'Kremlin-Bicêtre 6th floor');

INSERT into sessiontype(typeid,name)
             values (1,'Regular on-campus lectures'),(2,'Online lectures'),(3,'Practical work'),(4,'Exams');

INSERT into session(sessionid,courseid,teacherid,typeid,roomid,starttime,endtime)
             values (1,1,1,1,601,'2021-10-10 10:00:00','2021-10-10 13:00:00');

INSERT into program(programid,name)
             values (1,'Data science and analytics'),(2,'Software engineering');

INSERT into student(studentid,firstname,lastname,country,email,programid,intakeid)
             values (24,'Thi Truc Linh','LE','VietNam','truclinhle@gmail.com',1,1),(19,'Cam Suong','Tran','VietNam','suongtran@gmail.com',1,1),(20,'Quoc Viet','NGUYEN','VietNam','vietnguyen@gmail.com',2,1);

INSERT into attendance(attendanceid,sessionid,studentid,present)
             values (1,1,24,1),(2,1,19,0);

INSERT into groupsession(groupsessionid,sessionid,studentid)
             values (2,1,20);

INSERT into payment(paymentid,studentid,paid)
             values (1,24,6900);

INSERT into candidate(candidateid,firstname,lastname,country,email,paymentid,recruited)
             values (1,'Thi Truc Linh','LE','VietNam','truclinhle@gmail.com',1,1);

INSERT into examtype(typeid,name)
             values (1,'quiz'),(2,'practical work'),(3,'project'),(4,'oral presentation');

INSERT into exam(examid,courseid,typeid,weight,studentid,grade)
             values (1,1,2,0.8,24,20);

INSERT into programcourse(programid,courseid)
             values (1,1),(1,3),(2,1);
