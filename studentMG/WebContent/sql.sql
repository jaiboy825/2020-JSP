create table student_tbl (
	stuNo number(5) primary key,
	passwd varchar2(50) not null,
	stuName varchar2(50) not null,
	birth date not null,
	grade number(1) not null,
	kor number(3) not null,
	math number(3) not null,
	eng number(3) not null,
	clubId varchar2(50)
)
create table club_tbl (
	clubId varchar2(50),
	clubName varchar2(50),
	teacher varchar2(50),
	fee number(10)
)

create table skill_tbl (
	stuNo number(5),
	pass number(1),
	passDate date
)
insert into student_tbl values(20001,'1111','박연미','2002/07/30',2,60,70,80,'A1001');
insert into student_tbl values(20002,'2222','김학생','2002/08/14',2,50,100,40,'A1003');
insert into student_tbl values(20003,'3333','박학생','2002/09/26',2,60,83,60,'A1001');
insert into student_tbl values(20004,'4444','이학생','2002/10/17',2,77,34,54,'A1004');
insert into student_tbl values(20005,'5555','김학생','2002/11/30',2,50,100,68,'A1002');
insert into student_tbl values(20006,'6666','곽학생','2002/12/05',2,100,100,100,NULL);
insert into student_tbl values(20007,'7777','강학생','2002/01/03',2,55,80,72,'A1003');
insert into student_tbl values(20008,'8888','복학생','2002/02/23',2,50,90,88,'A1001');
insert into student_tbl values(20009,'9999','임학생','2002/03/30',2,93,78,90,'A1004');
insert into student_tbl values(20010,'1010','한학생','2002/04/11',3,68,84,92,'A1001');
insert into student_tbl values(20011,'1111','규학생','2002/05/24',3,86,72,64,NULL);
insert into student_tbl values(20012,'1212','지학생','2002/06/15',3,84,77,43,'A1005');
insert into student_tbl values(20013,'1313','황학생','2002/07/02',3,70,88,93,'A1002');
insert into student_tbl values(20014,'1414','조학생','2002/08/05',3,67,97,40,'A1005');



insert into club_tbl values('A1001','베드민턴','김선생',0);
insert into club_tbl values('A1002','봉사활동','박선생',0);
insert into club_tbl values('A1003','비즈공예','황선생',15000);
insert into club_tbl values('A1004','로봇만들기','최선생',50000);
insert into club_tbl values('A1005','간편요리','용선생',30000);

insert into skill_tbl values(20002,0,null);
insert into skill_tbl values(20004,1,'2020/08/30');
insert into skill_tbl values(20006,1,'2020/07/30');
insert into skill_tbl values(20009,0,null);
insert into skill_tbl values(20013,1,'2020/09/30');
insert into skill_tbl values(20008,0,null);

-- 문제 1번 : 학생 번호 최대값 출력
select max(stuNo) from student_tbl;

-- 이너 조인할때 두가지 테이블에 공통 컬럼을 찾아라 테이블1.공통컬럼 = 테이블2.공통컬럼
-- 문제 2번 : 2학년 학생 중 '배드민턴'동아리 제목과 학생이름이 출력되도록 하시오
select stuNo, stuName, clubName from student_tbl a, club_tbl b where a.clubId = b.clubId and clubName = '베드민턴';

-- 전체 학생중 동아리가 없는 학생 목록 출력
select * from student_tbl where clubId is null;
-- 전체 학생중 동아리 가입한 학생
select * from student_tbl where clubId is not null;

-- 문제 3번 : 3학년 학생중 동아리가 없는 학생 목록 전체 출력
select * from student_tbl where clubId is null and grade = 3;

-- 문제 4번 : 기능반과 동아리 둘다 하고 있는 학생 목록 출력
select * from student_tbl a, skill_tbl b where a.stuNo = b.stuNo and clubId is not null;

-- 문제 5번 : 학생 테이블에서 전체 국어 영어 수학의 총점, 전체 평균 구하기
select stuName, sum(kor+math+eng) as 총점, round(avg(kor+math+eng)/3, 2) as 평균 from student_tbl group by (stuName) order by sum(kor+math+eng) desc;
-- count sum avg 함수를 쓰게 되면 전체를 묶어서 반환한다 --> group by (count sum avg) 전체를 묶는 함수랑 같이 사용해서 각각의 그룹별로 총함, 평균, 갯수를 구할 수 있다.

-- 이하 11월 5일 수업 ---------------------------------------------------------------------------------------------------------------------------------------------
-- 문제 1 : 3학년중에 동아리가 있는 학생들의 동아리 제목과 학생 성적을 출력
select stuNo, grade, stuName, clubName, round(avg(kor+math+eng)/3, 2) from student_tbl st, club_tbl ct where st.clubId = ct.clubId and grade = 3 group by (stuNo,grade,stuName,clubName);

-- 문제 1-1 3학년중에 동아리가 있는 학생들의 동아리 제목
select stuNo, grade, stuName, clubName, round(avg(kor+math+eng)/3, 2) from student_tbl st, club_tbl ct where st.clubId = ct.clubId and grade = 3 group by (stuNo,grade,stuName,clubName);

-- sum - 총합 avg - 평균 count - 개수 min - 최소값 max 최대값 = 전체를 통합해서 계산
select stuNo,round(avg(kor+math+eng)/3,2) from student_tbl group by (stuNo);

-- 문제 2 : 기능반 학생들 중 평가전 통과한 학생들의 학생 이름과 평가전 통과 날짜 성적 평균이 85점 이상인 학생 
select stuName, passDate from student_tbl a , skill_tbl b where a.stuNo = b.stuNo and pass = 1 group by (stuName, passDate) having round(avg(kor+math+eng)/3, 2) >= 85;



