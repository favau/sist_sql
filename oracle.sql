select문 데이터베이스로부터 저장되어 있는 데이터를 검색하는데 사용

- 전체 테이블 명세
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno From emp;
SELECT * FROM emp;

- 특정 열 선택
SELECT ename, job From emp;
 
= 주석 
SELECT * /* 주석 */ FROM emp; --주석
 
- dual
DUAL : 함수 및 계산의 결과를 볼 때 사용할 수 있는 공용(PUBLIC) 테이블
       사용자 데이터가 있는 테이블에서 유래하지 않은 상수 값 현재 날짜,
       시간 정보, 일시적인 산술, 날짜 연산 등에 주로 사용
SELECT ASCII(0) FROM dual;
SELECT SYSDATE FROM dual;
SELECT 7 + 10 FROM dual;

- 산술식
SELECT ename,sal,sal+300 FROM emp;
SELECT ename, sal, (sal+300)*12 FROM emp;

- NULL 값의 정의
NULL : NULL은 사용할 수 없거나, 할당되지 않았거나, 알 수 없거나,
       적용할 수 없는 값(NULL은 0이나 공백과는 다름)
SELECT empno,ename, job, comm FROM emp;

- NULL값을 포함하는 산술식은 null로 계산
SELECT empno,ename,sal+comm FROM emp;

- 알리아스(ALIAS) 정의
열 이름을 바꿈
열 이름 바로 뒤에 나옴, 열 이름과 ALIAS 사이에 선택 사항인 as 키워드가 올 수도 있음
SELECT sal*12 FROM emp;
SELECT sal*12 ASal FROM EMP;
SELECT sal*12 AS ASal FROM emp;

알리아스에 큰 따옴표를 사용하는 경우
- 대소문자를 구별할 때
- 공백 포함 시
- _,# 등 특수문자 사용 시
- 숫자로 시작할 경우
/* 작은 따음표는 문자(문자열)에 사용. sql은 문자/문자열 구분이 없음 */
SELECT ename "Name" FROM emp;
SELECT sal*12 "Annual Salary" FROM emp;
SELECT sal*12 "365Sal" FROM emp;

- 연결 연산자
열이나 문자열을 다른 열에 연결. 두 개의 세로선(||)으로 나타냄
결과 열로 문자식을 생성
SELECT ename || sal FROM emp;
SELECT ename || ' has &' || sal FROM emp;

- DISTINCT : 중복행 삭제하는 연산자
SELECT DISTINCT deptno FROM emp;
SELECT DISTINCT(deptno) FROM emp;

[실습문제]
1)emp테이블에서 사원번호,사원이름,월급을 출력하시오.
SELECT EMPNO, ENAME, SAL FROM emp;
2)emp테이블에서 사원이름과 월급을 출력하는데 컬럼명은 "이 름","월 급"으로 바꿔서 출력하시오.
SELECT ENAME "이 름", SAL "월 급" FROM emp;
3)emp테이블에서 사원번호,사원이름,월급,연봉을 구하고 각각 컬럼명은 "사원번호","사원이름","월급","연봉"으로 출력하시오.
SELECT EMPNO "사원번호", ENAME "사원이름", SAL "월급", COMM "연봉" FROM emp;
4)emp테이블에서 업무를 중복되지 않게 표시하시오.
SELECT DISTINCT job FROM emp;
5)emp테이블에서 사원명과 업무를 쉼표(,)로 연결해서 표시하고 컬럼명은 Employee and Job으로 표시하시오.
SELECT ename || ',' || job "Employee and Job" FROM emp;

- WHERE절을 이용한 행 제한
조건 체크 결과 조건에 맞는 행만 읽어 옴
SELECT * FROM emp WHERE deptno=10;
SELECT * FROM emp WHERE ename='SMITH';
SELECT * FROM emp WHERE hiredate>'81-12-03';

--(주의) WHERE 에는 알리아스를 사용할 수 없음
SELECT ename, sal, sal*12 ansal FROM emp WHERE sal*12 > 15000;

- 비교 연산자의 사용
SELECT * FROM emp WHERE hiredate > '81-04-02';
같지 않으면 true
SELECT * FROM emp WHERE hiredate <> '81-04-02';
SELECT * FROM emp WHERE hiredate ^= '81-04-02';
SELECT * FROM emp WHERE hiredate !+ '81-04-02';

이상~이하
SELECT * FROM emp WHERE sal>=2000 AND sal<=5000;

BETWEEN ~ AND ~ :  이상~이하
SELECT * FROM emp WHERE sal BETWEEN 2000 AND 5000;
2000~5000 사이가 아닌 급여를 받는 사원 정보를 구함
SELECT * FROM emp WHERE sal NOT BETWEEN 2000 AND 5000;
 
IN : 값 목록 중의 값과 일치
SELECT * FROM emp WHERE sal IN (1300,2450,3000); 
SELECT * FROM emp WHERE sal NOT IN (1300,2450,3000);

SELECT ename,mgr,deptno FROM emp WHERE ename IN ('ALLEN','FORD');

LIKE : 패턴 검사
% : 0개 이상의 문자를 나타냄 
_ : 한 문자를 나타냄
    
SELECT * FROM emp WHERE ename LIKE '%S%'; --S가 처음,중간,끝에 오는 이름

입사일이 22로 끝나는 입사일
SELECT * FROM emp WHERE hiredate LIKE '%22';
SELECT * FROM emp WHERE ename LIKE 'FOR_'; --FOR다음에 꼭 한 글자

[실습]
1)emp테이블에서 사원번호가 7698인 사원의 이름, 업무, 급여를 출력하시오.
SELECT ename,job,sal FROM emp WHERE empno='7698';
2)emp테이블에서 사원이름이 SMITH인 사원의 이름과 월급, 부서번호를 구하시오.
SELECT ename,sal,deptno FROM emp WHERE ename='SMITH';
3)월급이 2500이상 3500미만인 사원의 이름, 입사일, 월급을 구하시오.
SELECT ename,hiredate,sal FROM emp WHERE sal BETWEEN 2500 AND 3500;
4)급여가 2000에서 3000사이에 포함되지 않는 사원의 이름, 업무, 급여를 출력하시오.
SELECT ename, job, sal FROM emp WHERE sal NOT BETWEEN 2000 AND 3000;
SELECT ename, job, sal FROM emp WHERE NOT(sal>=2000 AND sal<=3000);


04-07---------------------------------------------------------------------------
NULL 조건 사용
SELECT * FROM emp WHERE comm IS null; -- (comm = null 불가)
SELECT * FROM emp WHERE comm IS NOT null;

- 논리연산자(AND,OR,NOT)
AND 연산자의 사용 : 구성 요소 조건이 모두 TRUE이면 TRUE를 반환
SELECT empno,ename,job,sal FROM emp
WHERE sal>=2000 AND job LIKE '%MAN%';

OR 연산자의 사용 : 조건 중 하나가 TRUE이면 TRUE를 반환
SELECT empno,ename,job,sal FROM emp
WHERE sal>=2000 OR job LIKE '%MAN%';

NOT 연산자의 사용
SELECT ename,job FROM emp WHERE job NOT IN ('CLERK','SALESMAN');

[실습문제]
5)81년05월01일과 81년12월03일 사이에 입사한 사원의 이름,급여,입사일을 출력하시오.
SELECT ename,sal,hiredate FROM emp WHERE hiredate>'81-05-01' AND hiredate<'81-12-03';
6)사원번호가 7566,7782,7934인 사원을 제외한 사람들의 사원번호,이름,월급을 출력하시오.
SELECT empno,ename,sal FROM emp WHERE empno NOT IN ('7566','7782','7934');
7)부서번호(deptno) 30에서 근무하며 월급이 2,000달러 이하인 81년05월01일 이전에 입사한 사원의 이름,급여,부서번호,입사일을 출력하시오
SELECT ename,sal,empno,hiredate FROM emp WHERE deptno=30 AND sal<=2000 AND hiredate<'81-05-01';
8)급여가 2,000~5,000달러 사이고 부서번호가 10 또는 30인 사원의 이름과 급여,부서번호를 출력하시오
SELECT ename,sal,empno FROM emp WHERE (sal BETWEEN 2000 AND 5000) AND deptno IN (10,30);
9)업무가 SALESMAN또는 MANAGER이면서 급여가 1600, 2850이 아닌 모든 사원의 이름,업무,급여를 출력하시오.
SELECT ename,job,sal FROM emp WHERE job IN ('SALESMAN','MANAGER') AND sal NOT IN (1600,2850);

-ORDER BY 절 : 정렬
오름차순 정렬
SELECT * FROM emp ORDER BY sal;
SELECT * FROM emp ORDER BY sal ASC;

내림차순 정렬
SELECT * FROM emp ORDER BY sal DESC;

SELECT * FROM emp WHERE deptno=10 ORDER BY sal DESC;

정렬시 기준이 되는 컬럼의 값이 중복되면 2차 정렬 가능
SELECT * FROM emp ORDER BY sal ASC, ename ASC;
열 알리아스를 기준으로 정렬
SELECT empno,ename,sal*12 annsal FROM emp ORDER BY annsal;
열의 숫자 위치를 사용하여 정렬
SELECT ename,job,deptno,hiredate FROM emp ORDER BY 3;

테이블에 생성된 순서대로 열 숫자 위치 부여
SELECT * FROM emp ORDER BY 2;
SELECT * FROM emp ORDER BY comm;

NULLS FIRST 또는 NULLS LAST 키워드를 사용하여 반환된 행 중 NULL값을 포함하는 행이 정렬 순서상 맨 처음에 나타나거나 마지막에 나타나도록 지정
SELECT * FROM emp ORDER BY comm NULLS FIRST;
SELECT * FROM emp ORDER BY comm DESC NULLS LAST;

[실습문제[
1)사원번호,사원이름,입사일을 출력하는데 입사일이 빠른 사람순으로 정렬하시오.
SELECT empno,ename,hiredate FROM emp ORDER BY hiredate ASC;
2)사원이름,급여,연봉을 구하고 연봉이 많은 순으로 정렬하시오.
SELECT ename,sal,mgr FROM emp ORDER BY mgr ASC;
3)10번부서 또는 20번부서에서 근무하고 있는 사원의 이름과 부서번호를 출력하는데 이름을 영문자순으로 표시하시오.
SELECT ename,empno FROM emp WHERE deptno IN (10,20) ORDER BY ename ASC;
4)커미션 계약을 맺은 모든 사원의 이름,급여,커미션을 출력하는데 커미션을 기준으로 내림차순 정렬하시오.
SELECT ename,sal,comm FROM emp WHERE comm IS NOT NULL ORDER BY comm DESC;

- 함수
대소문자 조작 함수 : LOWER,UPPER,INICAP

SELECT LOWER('HELLO') FROM dual;

소문자로 변환
SELECT LOWER('HELLO') FROM dual;
SELECT LOWER(ename) FROM emp;
대문자로 변환
SELECT UPPER('wave') FROM dual;
첫글자는 대문자 나머지는 소문자
SELECT INITCAP('hello wORLD') FROM dual;
SELECT INITCAP(ename) FROM emp;

-문자 조작함수
CONCAT(문자열1,문자열2) : 문자열1과 문자열2를 연결하여 하나의 문자열로 반환
SELECT CONCAT('Hello','World') FROM dual;

SUBSTR(대상문자열,인덱스) : 대상문자열에서 지정한 인덱스부터 문자열을 추출. (주의)인덱스는 1부터 시작
SELECT SUBSTR('Hello World',3) FROM dual;
인덱스 3부터 3개의 문자 추출
SELECT SUBSTR('Hello World',3,3) FROM dual;
뒤 3번째부터 끝까지 추출
SELECT SUBSTR('Hello World',-3,2) FROM dual;

LENGTH(대상문자열) : 문자열의 개수
SELECT LENGTH('Hello World') FROM dual;
SELECT LENGTH(ename) FROM emp;

LENGTHB(대상문자열) : 문자열의 바이트 수
SELECT LENGTHB('SMITH') FROM dual;
SELECT LENGTHB('홍길동') FROM dual;

INSTR (대상문자열,검색문자) : 검색문자의 위치값
SELECT INSTR('Hello World','e') FROM dual;
SELECT INSTR('Hello World','s') FROM dual; -- 검색문자가 없으면 0
SELECT INSTR('Hello World','o') FROM dual;
대상문자열,검색문자,검색인덱스:해당위치부터 검색
SELECT INSTR('Hello World','o',6) FROM dual;
대상문자열,검색문자,검색인덱스,반복횟수 : 대상문자열 전체를 여러번 검색한다는 의미가 아니라
1번 검색으로 o를 찾으면 지정한 횟수만큼 그 뒤의 문자를 검색한다는 의미
SELECT INSTR('Hello World','o',1,2) FROM dual;

TRIM : 문자열에서 공백이나 특정 문자를 제거한 다음 값을 반환
방향 : 왼쪽 - leading, 오른쪽 - trailing, 양쪽 - both
SELECT TRIM(LEADING 'h' FROM 'habchh') FROM dual;
SELECT TRIM(BOTH 'h' FROM 'habchh') FROM dual;

REPLACE(대상문자열,OLD,NEW):대상문자열에서 OLD문자를 NEW문자로 대체
SELECT REPLACE('010.1234.5678','.','-') FROM dual;

함수 중첩
SELECT ename,LOWER(SUBSTR(ename,1,3)) FROM emp;

- 숫자 함수

CEIL(실수) : 올림 처리한 정수값을 반환
SELECT CEIL(1.4) FROM dual;

FLOOR(실수) : 버림 처리한 정수값을 반환
SELECT FLOOR(1.7) FROM dual;

ROUND(대상숫자,지정자릿수) : 반올림
SELECT ROUND(45.926,2) FROM dual; -- 45.93
SELECT ROUND(45.926) FROM dual; -- 46

TRUNC(대상숫자,지정자릿수) : 절삭
SELECT TRUNC(45.926,2) FROM dual;
SELECT TRUNC(45.926) FROM dual;

[실습문제]
1)업무(job)을 첫글자는 대문자 나머지는 소문자로 출력하시오.
SELECT INITCAP(job) FROM emp;
2)사원이름 중 A가 포함된 사원이름을 구하고 그 이름 중 앞에서 3자만 추출
  하여 출력하시오.
SELECT SUBSTR(ename,1,3) FROM emp WHERE ename LIKE '%A%';
3)이름의 세번째 문자가 A인 모든 사원의 이름을 표시하시오.
SELECT ename FROM emp WHERE SUBSTR(ename,3,1)='A';
SELECT ename FROM emp WHERE ename LIKE '__A%';
4)이름이 J,A 또는 M으로 시작하는 모든 사원의 이름을 첫글자는 대문자로
  나머지는 소문자로 표시하고 이름의 길이를 표시하시오.
SELECT INITCAP(ename),LENGTH(ename) FROM emp
WHERE ename LIKE 'J%' OR ename LIKE 'A%' OR ename LIKE 'M%';

SELECT INITCAP(ename),LENGTH(ename) FROM emp
WHERE SUBSTR(ename,1,1) IN ('J','A','M');
5)이름의 글자수가 6자 이상인 사원의 이름을 앞에서 3자만 구하여 소문자로
  출력하시오.
SELECT LOWER(SUBSTR(ename,1,3)) FROM emp WHERE LENGTH(ename)>=6;  

-날짜함수

-SYSDATE(ORACLE 서버의 현재 날짜와 시간을 반환)
SELECT SYSDATE FROM dual;

날짜에 산술 연산자 사용
SELECT ename, (SYSDATE-hiredate)/7 AS WEEKS 
FROM emp WHERE deptno=10; 

MONTHS_BETWEEN(날짜1,날짜2) : 두 날짜 간의 월 수
SELECT MONTHS_BETWEEN('2012-03-23','2010-01-23') FROM dual;
근무 월 수
SELECT ename,ROUND(MONTHS_BETWEEN(SYSDATE,hiredate)) months_worked
FROM emp ORDER BY months_worked;

ADD_MONTHS(날짜,숫자) : 특정 날짜의 월에 정수를 더한 다음 해당 날짜를
                       반환하는 함수
SELECT ADD_MONTHS('2022-01-01',8) FROM dual;                       

NEXT_DAY(날짜,요일) : 지정한 요일의 다음 날짜
SELECT NEXT_DAY('2023-04-07','월요일') FROM dual;

LAST_DAY(날짜) : 월의 마지막 날
SELECT LAST_DAY('2023-04-07') FROM dual;

EXTRACT(년/달/일/시/분/초 FROM 날짜) : 날짜 정보에서 특정한 연도,월,일
                                    시,분,초 등을 추출
SELECT EXTRACT(YEAR FROM SYSDATE),
       EXTRACT(MONTH FROM SYSDATE),
       EXTRACT(DAY FROM SYSDATE)
FROM dual;     

- 변환 함수
TO_CHAR : 숫자->문자, 날짜->문자
TO_NUMBER : 문자->숫자
TO_DATE : 문자->날짜

TO_CHAR(날짜,포맷문자)
SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD') FROM dual;
SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD HH:MI:SS') FROM dual;

분기별 입사자의 수
SELECT TO_CHAR(hiredate,'Q') AS Quarter,
       COUNT(empno) AS employee_number
FROM emp
GROUP BY TO_CHAR(hiredate,'Q');

TO_CHAR(숫자,포맷문자)

실제 자리수와 일치
SELECT TO_CHAR(1234,9999) FROM dual;
SELECT TO_CHAR(1234,'9999') FROM dual;
SELECT TO_CHAR(1234,'0000') FROM dual;

실제 자리수 보다 많은 자리수 지정
SELECT TO_CHAR(1234,99999) FROM dual; -- 1234
SELECT TO_CHAR(1234,'99999') FROM dual; -- 1234
SELECT TO_CHAR(1234,'00000') FROM dual; --01234

소수점 자리
SELECT TO_CHAR(1234,9999.99) FROM dual; --1234.00
SELECT TO_CHAR(1234,'9999.99') FROM dual; --1234.00
SELECT TO_CHAR(1234,'0000.00') FROM dual; --1234.00

반올림해서 소수점 둘째자리까지 표시
SELECT TO_CHAR(25.897,'99.99') FROM dual; --25.90
인상된 급여를 소수점 첫째자리까지 표시
SELECT ename, TO_CHAR(sal*1.15,'9,999.9') FROM emp;

통화표시
SELECT TO_CHAR(1234,'$0000') FROM dual;--$1234
SELECT TO_CHAR(1234,'L0000') FROM dual;--\1234

TO_DATE(문자,포맷문자) : 문자를 날짜로 변환
SELECT TO_DATE('23-04-07','YYYY-MM-DD') FROM dual;
포맷형식 생략 가능
SELECT TO_DATE('23-04-07') FROM dual;

TO_NUMBER(문자,포맷문자) : 문자 -> 숫자 변환
SELECT TO_NUMBER('100','999') FROM dual;
포맷형식 생략 가능
SELECT TO_NUMBER('200') FROM dual;

-일반함수

NVL(value1,value2) : value1이 null이면 value2를 씀.
                     value1과 value2의 자료형이 일치
SELECT ename,sal,NVL(comm,0) FROM emp; 
SELECT ename,NVL(TO_CHAR(comm),'No Commission') FROM emp;

NVL2(value1,value2,value3) : value1이 null인지 평가. null이면
                             value3, null이 아니면 value2
                             자료형이 일치하지 않아도 됨
SELECT ename, NVL2(comm,'commission','no commission')
FROM emp;

NULLIF(value1,value2) : 두개의 값이 일치하면 null. 두개의 값이
                        일치하지 않으면 value1
SELECT NULLIF(LENGTH(ename),LENGTH(job)) "NULLIF" FROM emp;                        

COALESCE(value1,value2,value3....) : null값이 아닌 값을 사용
                                     자료형이 일치
SELECT comm,mgr,sal,COALESCE(comm,mgr,sal) FROM emp;

[실습문제]
6)오늘부터 이번달의 마지막날까지의 남은 날 수를 구하시오.
SELECT LAST_DAY(SYSDATE)-SYSDATE AS "남은 날 수" FROM dual;
7)각 사원에 대해 사원번호,이름,급여 및 15% 인상된 급여를 정수(반올림)
  로 표시하시오. 인상된 급여열의 레이블을 New Salary로 지정하시오.
SELECT empno,ename,sal,ROUND(sal*1.15) "New Salary" FROM emp;
8)각 사원의 이름을 표시하고 근무 월 수(입사일로부터 현재까지의 월 수)를
  계산하여 열레이블을 MONTHS_WORKED로 지정하시오. 결과는 정수로 반올림
  하여 표시하고 근무 월 수를 기준으로 오름차순으로 정렬하시오.
SELECT ename,ROUND(MONTHS_BETWEEN(SYSDATE,hiredate)) "MONTHS_WORKED"
FROM emp ORDER BY "MONTHS_WORKED" ASC;
9)이름을 소문자로 표시, 업무, 근무연차를 출력하시오.
SELECT LOWER(ename),job,TRUNC(MONTHS_BETWEEN(SYSDATE,hiredate)/12)
FROM emp;

04-10---------------------------------------------------------------------------
/*
case 컬럼 when 비교값 then 결과값
         when 비교값 then 결과값
         when 비교값 then 결과값
         (else 결과값)
end
*/

SELECT ename,sal,job,
       CASE job WHEN 'SALESMAN' THEN sal*0.1
                WHEN 'MANAGER' THEN sal*0.2
                WHEN 'ANALYST' THEN sal*0.3
                ELSE sal*0.4
       END AS "BONUS" --알리아스
FROM emp;

SELECT ename,sal,job,
       CASE WHEN sal>=4000 AND sal<=5000 THEN 'A'
            WHEN sal>=3000 AND sal<4000 THEN 'B'
            WHEN sal>=2000 AND sal<3000 THEN 'C'
            WHEN sal>=1000 AND sal<2000 THEN 'D'
            ELSE 'F'
       END AS "Grade"
FROM emp ORDER BY "Grade", sal DESC;;

decode(ORACLE 전용) : =비교만 가능
DECODE(컬럼,비교값,반환값,
           비교값,반환값,
           비교값,반환값,
           반환값)
           
SELECT ename,sal,job,
       DECODE(job,'SALESMAN',sal*0.1,
                  'MANAGER',sal*0.2,
                  'ANALYST',sal*0.3,
                  sal*0.4) AS "Bonus"
FROM emp;

SELECT ename,sal,job,
       DECODE(TRUNC(sal/1000),5,'A',
                              4,'A',
                              3,'B',
                              2,'C',
                              1,'D',
                              'F') AS "Grade"
FROM emp;

- 그룹함수 : 행 집합 연산을 수행하여 그룹별로 하나의 결과를 산출
AVG() : NULL을 제외한 모든 값들의 평균을 반환, NULL값은 평균 계산에서 무시됨
SELECT AVG(sal) FROM emp;

COUNT() : NULL을 제외한 값을 가진 모든 레코드의 수를 반환.
SELECT COUNT(*) FROM emp;
SELECT COUNT(comm) FROM emp;

MAX() : 레코드 내에 있는 여러 값 중 가장 큰 값을 반환
SELECT MAX(sal) FROM emp;
SELECT MAX(ename) FROM emp;
SELECT MAX(hiredate) FROM emp;

MIN() : 레코드 내에 있는 여러값 중 가장 작은 값을 반환
SELECT MIN(sal) FROM emp;
SELECT MIN(ename) FROM emp;
SELECT MIN(hiredate) FROM emp;

SUM() : 레코드들이 포함하고 있는 모든 값을 더하여 반환
SELECT SUM(sal) FROM emp;

SELECT MAX(sal),MIN(sal),ROUND(AVG(sal)),SUM(sal) FROM emp;

-GROUP BY 절 : SELECT절에 집합함수 적용 시 개별 컬럼을 지정할 수 없기 때문에 GROUP BY절을 이용해서 그룹으로 묶어서 집합함수를 적용함
              (그룹(지정한 개별 컬럼)별 집합함수에 의해 만들어진 값을 반환)

SELECT deptno, MAX(sal), MIN(sal), ROUND(AVG(sal)),SUM(sal) FROM emp GROUP BY deptno;

SELECT job,MAX(sal),MIN(sal),ROUND(AVG(sal)),SUM(sal) FROM emp GROUP BY job;

SELECT job,MAX(sal),MIN(sal),ROUND(AVG(sal)),SUM(sal) FROM emp WHERE job='SALESMAN' GROUP BY job;

SELECT deptno, job, SUM(sal)
FROM emp GROUP BY deptno,job ORDER BY deptno;

HAVING : 그룹처리 결과를 제한하고자 할 때 HAVING절 사용
         WHERE절에는 집합함수를 사용할 수 없고 HAVING절 사용

-오류 발생
SELECT deptno,ROUND(AVG(sal))
FROM emp WHERE ROUND(AVG(sal))>=2000 GROUP BY deptno;

-정상 구문
SELECT deptno,ROUND(AVG(sal))
FROM emp GROUP BY deptno HAVING ROUND(AVG(sal))>=2000;

having절의 이용(having절에 알리아스 사용 x)
SELECT deptno, MAX(sal)
FROM emp GROUP BY deptno HAVING MAX(sal)>=3000;

-분기별 입사자의 수
SELECT TO_CHAR(hiredate,'Q') AS Quarter,COUNT(empno) AS employee_number
FROM emp GROUP BY TO_CHAR(hiredate,'Q') ORDER BY Quarter;

SELECT CEIL(EXTRACT(MONTH FROM hiredate)/3) AS Quarter,
       COUNT(empno) AS count_member FROM emp GROUP BY CEIL(EXTRACT(MONTH FROM hiredate)/3);

[실습문제]     
10)사원이름, 월급, 월급과 커미션을 더한 값을 컬럼명 실급여라고 해서 출력하시오. 단 NULL값은 나타나지 않게 작성하시오.
SELECT ename,sal,sal+NVL(comm,0) AS 실급여 FROM emp;
11)월급과 커미션을 합친 금액이 2,000이상인 급여를 받는 사원의 이름,업무,월급,커미션,고용날짜를 출력하시오. 단,고용날짜는 1980-12-17형태로 출력하시오.
SELECT ename,job,sal,comm,TO_CHAR(hiredate,'YYYY-MM-DD') AS hiredate FROM emp WHERE sal+NVL(comm,0)>=2000;
12)CASE문과 DECODE함수를 사용하여 다음 데이터에 따라 JOB열의 값을 기준으로 모든 사원의 등급을 표시하시오.
SELECT ename,sal,job,
       CASE job WHEN 'PRESIDENT' THEN 'A'
                WHEN 'ANALYST' THEN 'B'
                WHEN 'MANAGER' THEN 'C'
                WHEN 'SALESMAN' THEN 'D'
                WHEN 'CLERK' THEN 'E'
                ELSE '0'
       END "Grade"
FROM emp;

SELECT ename,sal,job, DECODE(job,'PRESIDENT','A',
                      'ANALYST','B',
                      'MANAGER','C',
                      'SALESMAN','D',
                      'CLERK','E',
                      '0') AS "Grade"
FROM emp;

업무        등급
PRESIDENT   A
ANALYST     B
MANAGER     C
SALESMAN    D
CLERK       E
기타         0

[실습문제]
1)모든 사원의 급여 최고액,최저액,총액 및 평균액을 표시하시오. 열 레이블을 각각 maximum,minimum,sum,average로 지정하고, 결과를 정수로 반올림하고 세자리 단위로 ,(쉼표)를 명시하시오.
SELECT TO_CHAR(MAX(sal),'9,999') maximum,TO_CHAR(MIN(sal),'9,999') minimum,TO_CHAR(SUM(sal),'99,999') sum,
TO_CHAR(ROUND(AVG(sal)),'9,999') average FROM emp;
2)급여와 커미션을 더한 금액의 최고,최저,평균금액을 구하시오. 평균금액은 소수점 첫째자리까지 표시하시오.
SELECT MAX(sal+NVL(comm,0)),MIN(sal+NVL(comm,0)),ROUND(AVG(sal+NVL(comm,0)),'1') FROM emp;
3)업무와 업무가 동일한 사원 수를 표시하시오.(업무별 사원 수를 구하시오.)
SELECT job,COUNT(*) FROM emp GROUP BY job;
4)30번 부서의 사원수를 구하시오.
SELECT COUNT(*) FROM emp WHERE deptno = 30;
SELECT deptno,COUNT(*) FROM emp WHERE deptno=30 GROUP BY deptno;
5)업무별 최고 월급을 구하고 업무, 최고 월급을 출력하시오.
SELECT job,MAX(sal) FROM emp GROUP BY job;
6)부서별로 지급되는 총월급에서 금액이 9,000이상을 받는 사람들의 부서번호, 총월급을 출력하시오.
SELECT deptno,SUM(sal) FROM emp GROUP BY deptno HAVING SUM(sal)>=9000;
7)업무별로 사원번호가 제일 늦은 사람을 구하고 그 결과 내에서 사원번호 79로 시작하는 결과만 보여주시오.(업무,제일 큰 사원번호 출력)
SELECT job,MAX(empno) FROM emp GROUP BY job HAVING MAX(empno)>='7900' AND MAX(empno)<=7999 ;
8)업무별 총월급을 출력하는데 업무가 'MANAGER'인 사원은 제외하고 총월급이 5,000보다 많은 업무와 총월급만 출력하시오.
SELECT job,SUM(sal) FROM emp GROUP BY job HAVING SUM(sal)>5000 AND job!='MANAGER';

- 분석함수
RANK() : 순위를 표현할 때 사용하는 함수
RANK(조건값) WITHIN GROUP (ORDER BY 조건값 컬럼명 |ASC|DESC|) : 특정 데이터의 순위 확인하기
(주의) RANK 뒤에 나오는 데이터와 ORDER BY 뒤에 나오는 데이터는 같은 컬럼이어야 함.

SELECT ename FROM emp ORDER BY ename;
SELECT RANK('SMITH') WITHIN GROUP (ORDER BY ename) "RANK" FROM emp;

RANK() OVER (정렬값)
전체순위보기 : RANK() 뒤가 WITHIN GROUP가 아니고 OVER()로 바뀜
사원들의 empno, ename, sal, 급여 순위를 출력
SELECT empno,ename,sal,RANK() OVER (ORDER BY sal) AS RANK_ASC,RANK() OVER(ORDER BY sal DESC) AS RANK_DESC FROM emp;

10번 부서에 속한 직원들의 사번과 이름, 급여, 해당 부서 내의 급여 순위를 출력
SELECT empno,ename,sal,RANK() OVER (ORDER BY sal DESC) "RANK" FROM emp WHERE deptno=10;

순위를 명시할 때 그룹을 나누어 순위를 만들 때는 PARTITION BY 사용
사번,이름,급여,부서번호,부서별 급여 순위를 출력
SELECT empno,ename,sal,deptno,RANK() OVER(PARTITION BY deptno) 

- JOIN : 둘 이상의 테이블을 연결하여 데이터를 검색하는 방법

- 카티션 곱 : 검색하고자 했던 데이터뿐 아니라 조인에 사용된 테이블들의 모든 데이터가 반환되는 현상
SELECT * FROM emp,dept;

ORACLE 전용
- 동등 조인(Equil Join) : 조건절에 조건이 Equality Condition(=)에 의하여 조인이 이루어 짐
SELECT emp.ename,dept.dname FROM emp,dept WHERE emp.deptno = dept.deptno;

테이블에 알리아스 부여하기
SELECT e.ename, d.dname FROM emp e, dept d
WHERE e.deptno = d.deptno;

컬럼명을 호출할 때 테이블명 또는 테이블 알리아스를 생략
(조인에 참가하는 테이블들에 같은 컬럼이 존재하면 반드시 테이블명 또는 테이블 알리아스를 명시해야함)
SELECT ename, dname FROM emp e, dept d
WHERE e.deptno = d.deptno;

추가적인 조건 명시하기
SELECT e.ename,d.dname FROM emp e,dept d 
WHERE e.deptno = d.deptno AND e.ename = 'ALLEN';

SELECT e.ename,e.sal,d.dname FROM emp e, dept d
WHERE e.deptno = d.deptno AND e.sal BETWEEN 3000 AND 4000;

- 비동등 조인(Non Equil Join)
테이블의 어떤 column도 join할 테이블의 column에 일치하지 않을 때 사용하고 
조인 조건은 동등(=)이외의 연산자를 갖음(between and, is null,in)

사원이름,급여,급여등급 구하기(emp,salgrade 테이블 이용)
SELECT e.ename,e.sal,s.grade FROM emp e, salgrade s
WHERE e.sal BETWEEN s.losal AND s.hisal;

- SELF JOIN 같은 테이블에 공통의 칼럼이 있어야 가능함
사원이름과 해당 사원의 관리자 이름 구하기(관리자가 없는 사원 제외)
SELECT e.ename 사원이름, n.ename 관리자이름 FROM emp e,emp n
WHERE e.mgr=n.empno;

부 조인(Outer Join) : 조인할 때 두개의 테이블의 두 개 컬럼에서 공통된 값이 없다면
테이블로부터 데이터를 반환하지 않음. 두 개 컬럼에서 공통되지 않은 값을 표시하고 싶다면
Outer Join을 사용해서 표시 가능

누락된 행의 반대 테이블의 조인 조건의 컬럼에 (+)기호 표시
SELECT DISTINCT(e.deptno),d.deptno FROM emp e, dept d WHERE e.deptno(+) = d.deptno;

사원이름과 해당 사원의 관리자 이름구하기(관리자가 없는 사원도 표시)
SELECT e.ename 사원이름,n.ename 관리자이름 FROM emp e,emp n
WHERE e.mgr = n.empno(+);

[실습문제]
1)모든 사원의 이름,부서번호,부서이름을 출력하시오.(emp,dept)
SELECT e.ename,e.deptno,d.dname From emp e,dept d WHERE e.deptno = d.deptno;
2)업무가 MANAGER인 사원의 정보를 이름,업무,부서명,근무지 순으로 출력하시오.(emp,dept)
SELECT e.ename,e.job,d.dname,d.loc FROM emp e,dept d WHERE e.deptno = d.deptno AND e.job IN 'MANAGER';
3)커미션을 받고 급여가 1,600 이상인 사원의 이름,급여,부서명,근무지를 출력하시오.(emp,dept)
SELECT e.ename,e.sal,d.dname,d.loc FROM emp e,dept d WHERE e.deptno = d.deptno AND e.sal>=1600 AND e.comm IS NOT NULL;
4)근무지가 CHICAGO인 모든 사원의 이름,업무,부서번호 및 부서이름을 출력하시오.(emp,dept)
SELECT e.ename,e.job,e.deptno,d.dname FROM emp e,dept d WHERE e.deptno = d.deptno AND d.loc IN 'CHICAGO';
5)근무지(loc)별로 근무하는 사원의 수가 5명 이하인 경우, 인원이 적은 도시 순으로 정렬하시오.(근무 인원이 0명인 곳도 표시)
SELECT d.loc,COUNT(e.empno) emp_member FROM emp e,dept d WHERE e.deptno(+)=d.deptno GROUP BY d.loc HAVING COUNT(e.empno)<=5 ORDER BY emp_member ASC;

- 표준 SQL
- 내부 조인(Inner Join)
SELECT emp.ename, dept.deptno FROM emp INNER JOIN dept ON emp.deptno = dept.deptno;

SELECT e.ename, d.deptno FROM emp e INNER JOIN dept d ON e.deptno = d.deptno;

부가적인 조건이 있으면 WHERE절 사용
SELECT e.ename, d.deptno FROM emp e INNER JOIN dept d
ON e.deptno = d.deptno WHERE e.ename = 'ALLEN';

만약 조인 조건에 사용된 컬럼의 이름이 같다면 다음과 같이 USING절을 사용하여 조인 조건을 정의할 수 있음
SELECT e.ename, d.dname FROM emp e INNER JOIN dept d USING(deptno);

(주의)USING에 사용된 컬럼은 테이블명 또는 테이블 알리아스를 붙이지 않음
SELECT e.ename, deptno FROM emp e INNER JOIN dept d USING(deptno); --USING절의 e.deptno와 d.deptno가 합쳐져서 구분할 필요 x

- Self Join
사원이름과 해당 사원의 관리자이름 구하기(관리자가 없는 사원은 제외)
SELECT e.ename name, m.ename manager_name FROM emp e JOIN emp m ON e.mgr = m.empno;

- Outer Join(외부 조인)
누락된 행의 방향 표시
사원이름과 해당 사원의 관리자이름 구하기(관리자가 없는 사원도 표시)
SELECT e.ename name, m.ename manager_name FROM emp e LEFT OUTER JOIN emp m ON e.mgr = m.empno;

[실습문제]
6)업무가 SALESMAN인 사원의 정보를 이름,업무,부서명,근무지 순으로 출력하시오.(emp,dept)
SELECT e.ename,e.job,d.dname,d.loc FROM emp e INNER JOIN dept d USING(deptno);
7)근무지가 DALLAS인 모든 사원의 이름,업무,부서번호 및 부서이름을 출력하시오.
SELECT e.ename,e.job,deptno,d.dname FROM emp e INNER JOIN dept d USING(deptno);
8)관리자보다 먼저 입사한 모든 사원의 이름 및 입사일을 관리자의 이름 및 입사일과 함께 표시하고
열 레이블을 각기 employee,emp hired,manager,mgr_hired로 지정하시오.(관리자가 없는 사원 미출력)
SELECT e.ename employee,e.hiredate "emp hired", m.ename manager,m.hiredate "mgr hired" FROM emp e JOIN emp m ON e.mgr = m.empno WHERE e.hiredate<m.hiredate;

04-11---------------------------------------------------------------------------
9)10번 부서에서 근무하는 사원들의 부서번호,부서이름,사원이름,월급,급여등급을 출력하시오.
SELECT e.deptno,d.dname,e.ename,e.sal,s.grade 
FROM emp e,dept d,salgrade s
WHERE e.deptno=d.deptno AND e.sal BETWEEN s.losal AND s.hisal AND e.deptno=10;

SELECT d.deptno,d.dname,e.ename,e.sal,s.grade
FROM emp e INNER JOIN dept d
ON e.deptno=d.deptno
INNER JOIN salgrade
ON e.sal BETWEEN s.losal AND s.hisal
WHERE e.deptno=10;

- 집합연산자
- UNION (합집합 중복값 제거) --합집합 중복x
UNION은 두 테이블의 결합을 나타내며, 결합시키는 두 테이블의 중복되지 않는 값들을 반환
SELECT deptno FROM emp
UNION
SELECT deptno FROM dept;

- UNION ALL --합집합 중복o
UNION과 같으나 두 테이블의 중복되는 값까지 반환
SELECT deptno FROM emp
UNION ALL
SELECT deptno FROM dept;

- INTERSECT --교집합
INTERSECT는 두 행의 집합 중 공통된 행을 반환
SELECT deptno FROM emp
INTERSECT
SELECT deptno FROM dept;

- MINUS --차집합
MINUS는 첫번째 SELECT문에 의해 반환되는 행 중에서 두번째 SELECT문에 의해
반환되는 행에 존재하지 않는 행들을 보여줌
SELECT deptno FROM dept
MINUS
SELECT deptno FROM emp;

- SUBQUERY : 다른 하나의 SQL 문장의 절에 nested(내장)된 SELECT 문장
- 단일행 서브쿼리 : 오직 한 개의 행(값)을 반환
SELECT empno,ename,job FROM emp
WHERE job = (SELECT job FROM emp WHERE empno=7369);

SELECT empno,ename,sal FROM emp WHERE sal>(SELECT sal FROM emp WHERE empno=7698);

- 다중 행 서브쿼리 : 하나 이상의 행을 반환하는 서브쿼리
IN 연산자의 사용
부서별로 가장 급여를 적게 받는 사원과 동일한 급여를 받는 사원의 정보를 출력하시오.
SELECT empno,ename,sal FROM emp
WHERE sal IN (SELECT MIN(sal) FROM emp GROUP BY deptno);

ANY 연산자의 사용 --OR
ANY 연산자는 서브쿼리의 결과값 중 어느 하나의 값이라도 만족이 되면 결과값을 반환
SELECT sal FROM emp WHERE job = 'SALESMAN';

SELECT ename,sal FROM emp WHERE sal>1250 OR sal>1500 OR sal>1600;
-위 SQL문을 서브쿼리 형식으로 작성
SELECT ename,sal FROM emp
WHERE sal>ANY(SELECT sal FROM emp WHERE job = 'SALESMAN');

- ALL 연산자의 사용 --AND
서브쿼리의 결과와 모든 값이 일치

SELECT sal FROM emp WHERE deptno=20;
SELECT empno,ename,sal,deptno FROM emp
WHERE sal>800 AND sal>2975 AND sal>3000;
- 위의 SQL문을 서브쿼리로 작성
SELECT empno,ename,sal,deptno FROM emp
WHERE sal>ALL(SELECT sal FROM emp WHERE deptno=20);

- 다중열 서브쿼리
서브쿼리의 결과가 두 개 이상의 컬럼으로 반환되어 메인 쿼리에 전달하는 쿼리
SELECT empno,ename,sal,deptno FROM emp
WHERE (deptno,sal) IN(SELECT deptno,sal FROM emp WHERE deptno=30);

부서별로 가장 급여를 적게 받는 사원의 정보를 출력
SELECT empno,ename,sal,deptno FROM emp
WHERE (deptno,sal) IN (SELECT deptno,MIN(sal) FROM emp GROUP BY deptno);

SELECT deptno,sal FROM emp WHERE ename='SMITH';

[실습문제]
1)"BLAKE"와 같은 부서에 있는 사원들의 이름과 입사일을 구하는데 "BLAKE"는 제외하고 출력하시오.
SELECT ename,hiredate FROM emp WHERE ename IN(SELECT ename FROM emp WHERE ename!='BLAKE');
2)평균급여보다 많은 급여를 받는 사원들의 사원번호,이름,월급을 출력하는데 월급이 높은 사람 순으로 출력하시오.
SELECT empno,ename,sal FROM emp WHERE sal>(SELECT AVG(sal) FROM emp) ORDER BY sal DESC;
3)10번 부서에서 급여를 가장 적게 받는 사원과 동일한 급여를 받는 사원의 이름과 월급을 출력하시오.
SELECT ename,sal FROM emp WHERE (deptno,sal) IN(SELECT deptno,MIN(sal) FROM emp WHERE deptno IN '10' GROUP BY deptno);
4)부서별 사원수를 구하고 사원수가 3명이 넘는 부서의 부서명과 사원수를 출력하시오.
[JOIN]
SELECT d.dname,COUNT(e.empno) cnt FROM emp e,dept d 
WHERE e.deptno = d.deptno GROUP BY d.dname HAVING COUNT(e.empno)>3;
[SUBQUERY]
SELECT d.dname,e.cnt FROM dept d,(SELECT deptno,COUNT(empno) cnt FROM emp GROUP BY deptno)e
WHERE d.deptno = e.deptno(+) AND e.cnt>3;
5)사원번호가 7844인 사원보다 빨리 입사한 사원의 이름과 입사일을 출력하시오.
SELECT ename,hiredate FROM emp WHERE hiredate<(SELECT hiredate FROM emp WHERE empno IN 7844);
6)직속 상사(mgr)이 KING인 모든 사원의 이름과 급여를 출력하시오.
SELECT ename,sal FROM emp WHERE mgr IN(SELECT empno FROM emp WHERE ename IN 'KING');

7)20번 부서에서 가장 급여를 많이 받는 사원과 동일한 급여를 받는 사원의 이름,부서명,급여,급여등급을 출력하시오.
SELECT e.ename,d.dname,e.sal,s.grade FROM emp e 
INNER JOIN dept d ON e.deptno = d.deptno 
INNER JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal 
WHERE e.sal IN(SELECT MAX(e.sal) FROM emp e);

8)총급여(sal+comm)가 평균급여보다 많은 급여를 받는 사원의 부서번호,이름,총급여,커미션을 출력하시오.
(커미션은 유(O),무(X)로 표시하고 컬럼명은 "comm유무"로 출력)
SELECT deptno,ename,sal+NVL(comm,0) 총급여, 
       CASE WHEN comm IS NOT NULL THEN 'O' 
            ELSE 'X'
       END "comm유무"
       --NVL2(comm,'O','X') "comm유무"
FROM emp
WHERE sal+NVL(comm,0)>(SELECT ROUND(AVG(sal)) FROM emp);

9)CHICAGO 지역에서 근무하는 사원의 평균 급여보다 높은 급여를 받는 사원의 이름과 급여, 지역명을 출력하시오.
SELECT e.ename,e.sal,d.loc FROM emp e INNER JOIN dept d ON e.deptno = d.deptno WHERE e.sal>(SELECT ROUND(AVG(e.sal)) FROM emp e,dept d WHERE d.loc IN 'CHICAGO');
10)커미션이 없는 사원들 중 월급이 가장 높은 사원의 급여등급을 출력하시오.
SELECT s.GRADE FROM salgrade s INNER JOIN emp e ON e.sal BETWEEN s.losal AND s.hisal WHERE e.sal IN(SELECT MAX(e.sal) FROM emp e WHERE e.comm IS NULL);
11)ALLEN보다 급여를 많이 받는 사람 중에서 입사일이 가장 빠른 사원과 동일한 날짜에 입사한 사원의 이름과 입사일,급여를 출력하시오.
SELECT ename,hiredate,sal FROM emp 
WHERE hiredate IN(SELECT MIN(hiredate) FROM emp WHERE (sal >ALL(SELECT sal FROM emp WHERE ename IN 'ALLEN')));

- INSERT문
테이블에 행을 삽입

전체 데이터 삽입(전체 컬럼 명시)
INSERT INTO emp (emp,ename,job,mgr,hiredate,sal,comm,deptno)
VALUES (8000,'DENNIS','SALESMAN',7698,'99/01/22',1700,200,30);

전체 데이터를 삽입할 때는 컬럼명 생략 가능
INSERT INTO emp
VALUES (8001,'MARIA','CLERK',7839,'99/02/02',1500,NULL,20);

값이 입력되지 않는 컬럼은 제외
INSERT INTO emp (empno,ename,job,mgr,hiredate,sal,deptno)
VALUES (8002,'PETER','CLERK',7698,'99/03/01',1000,30);

- UPDATE 문
행 단위로 데이터를 갱신

UPDATE emp SET mgr=7900 WHERE empno=8000;
UPDATE emp SET ename='JOHN',sal=1800,comm=500 WHERE empno=8000;

- DELETE 문
행을 삭제함
DELETE FROM emp WHERE empno=8000;

- 데이터베이스 트랜잭션
트랜잭션은 데이터 처리의 한 단위
오라클 서버에서 발생하는 SQL문들을 하나의 논리적인 작업단위로써 
실패하는 일련의 SQL문을 트랜잭션이라고 할 수 있음

1)트랜잭션의 시작
실행 가능한 SQL문장이 제일 처음 실행될 때

2)트랜잭션의 종료
COMMIT이나 ROLLBACK
DDL 이나 DLC 문장의 실행(자동 COMMIT)
기계 장애 또는 시스템 충돌
사용자가 정상 종료

3)자동 COMMIT은 다음의 경우 발생
DDL,DCL 문장이 완료될 때 
명시적인 COMMIT이나 ROLLBACK 없이 SQL*PLUS를 정상 종료했을 경우

4)자동 ROLLBACK은 다음의 경우 발생
SQL*PLUS를 비정상 종료했을 경우

-commit(변경사항 저장) & rollback(변경사항 취소)의 장점
데이터의 일관성을 제공
데이터를 영구적으로 변경하기 전에 데이터 변경을 확인하게 함
관련된 작업을 논리적으로 그룹화 함

- 테이블
테이블은 기본적인 데이터 저장 단위, 레코드와 컬럼으로 구성
레코드(RECORD,ROW) : 테이블의 데이터는 행에 저장
컬럼(COLUMN) : 테이블의 각 컬럼은 데이터를 구별할 수 있는 속성을 표현

오라클 데이터베이스의 테이블
- 사용자 테이블
- 데이터 딕셔너리

데이터 딕셔너리
1)사용자가 소유한 테이블의 이름
SELECT table_name FROM user_tables;
2)사용자가 소유한 개별 객체 유형
SELECT DISTINCT object_type FROM user_objects;
3)사용자가 소유한 테이블,뷰,동의어 및 시퀸스
SELECT * FROM user_catalog;

- 테이블 생성
테이블 이름 : 만들어질 테이블의 이름
열 이름 : 테이블 내에 만들어질 열의 이름
데이터 타입 : 각각의 열은 자신의 데이터 타입을 가짐
default <표현식> : 각각의 열에는 insert 구문에 열의 값이 지정되지 
                  않은 경우에 이용될 디폴트 값을 지정
제약조건 : 만들어질 각 열에 선택적으로 제약조건을 정의할 수 있다.

CREATE TABLE employee(
  empno number(6),
  name varchar2(30) not null,
  salary number(8,2),
  hire_date date default sysdate,
  constraint employee_pk primary key (empno)  
);

- primary key & foreign key

CREATE TABLE suser(
 id varchar2(30),
 name varchar2(30),
 constraint suser_pk primary key (id) -- primary key 제약조건 부여
);

CREATE TABLE sboard(
 num number,
 id varchar2(30) not null,
 content varchar2(4000) not null,
 constraint sboard_pk primary key (num),--primary key 제약 조건 적용
 constraint sboard_fk foreign key (id) references suser (id)--foreign key 제약 조건 적용
);

INSERT INTO suser (id,name) VALUES ('blue','박문수');
COMMIT;
SELECT * FROM suser;

INSERT INTO sboard (num,id,content) VALUES (1,'star','안녕');
COMMIT;
DELETE FROM suser WHERE id='star';

SELECT * FROM sboard;

- 테이블 관리

add 연산자 : 테이블에 새로운 컬럼을 추가
ALTER TABLE employee ADD(addr VARCHAR2(50));

제약 조건 추가
ALTER TABLE employee ADD CONSTRAINT employee_pk2 PRIMARY KEY (empno);

modify 연산자 : 테이블의 컬럼을 수정하거나 not null 컬럼으로
               변경할 수 있음
ALTER TABLE employee MODIFY(salary NUMBER(10,2) NOT NULL); 

drop 연산자 : 컬럼의 삭제
ALTER TABLE employee DROP COLUMN name;

rename 연산자 : 컬럼명 변경
ALTER TABLE employee RENAME COLUMN salary to sal;

테이블명 변경
RENAME employee TO employee2;

테이블의 삭제
DROP TABLE employee2;

- on delete cascade
부모 테이블의 컬럼을 삭제하면 자식 테이블의 자식 데이터를 모두 삭제

CREATE TABLE s_member(
 id varchar2(20) primary key, --primary key 제약조건 지정
 name varchar2(30)
);
CREATE TABLE s_member_detail(
 num number primary key,
 content varchar2(4000) not null,
 id varchar2(20) not null references s_member (id) on delete cascade
);

[실습문제]
1)student라는 이름으로 테이블 생성
컬럼명      id,           name,      age,       score
데이터타입  varchar2(10) varchar2(30) number(3)  number(3)
제약조건   primary key   not null     not null   not null

CREATE TABLE student(
 id varchar2(10) primary key,
 name varchar2(30) not null,
 age number(3) not null,
 score number(3) not null
);

2)생성된 테이블에 데이터를 아래와 같이 입력
id       name    age   score
dragon   홍길동   21    100
sky      장영실   22    99
blue     박문수   34    88

INSERT INTO student (id,name,age,score) 
VALUES ('dragon','홍길동',21,100);
INSERT INTO student (id,name,age,score)
VALUES ('sky','장영실',22,99);
INSERT INTO student (id,name,age,score)
VALUES ('blue','박문수',34,88);
COMMIT;

3)데이터 읽기 -> student 테이블에서 성적 합계 구하시오.
SELECT SUM(score) FROM student;

- 뷰(View)
논리적으로 하나 이상의 테이블에 있는 데이터의 부분 집합

- 뷰의 사용 목적
1)데이터 액세스를 제한하기 위해
2)복잡한 질의를 쉽게 작성하기 위해
3)데이터 독립성을 제공하기 위해
4)동일한 데이터로부터 다양한 결과를 얻기 위해

- View 생성
CREATE [OR REPLACE] VIEW 뷰이름 AS 쿼리;

CREATE OR REPLACE VIEW emp10_view
AS SELECT empno id_number, ename name, sal*12 ann_salary
   FROM emp WHERE deptno=10;

CREATE OR REPLACE VIEW emp_info_view 
AS SELECT e.empno,e.ename,d.deptno,d.loc,d.dname
   FROM emp e, dept d
   WHERE e.deptno=d.deptno;

SELECT * FROM emp_info_view;

- VIEW를 통한 데이터 변경하기
일반적으로 VIEW는 조회용으로 많이 사용되지만 데이터 변경도 가능함
UPDATE emp10_view SET name='SCOTT' WHERE id_number=7839;
SELECT * FROM emp10_view;
SELECT * FROM emp; -- VIEW의 데이터를 변경하면 원본 테이블의 정보도 변경됨

INSERT INTO emp10_view (id_number,name,ann_salary)
VALUES (8000,'JOHN',19000);--가상 열은 사용할 수 없음.오류 발생

INSERT INTO emp10_view (id_number,name)
VALUES (8000,'JOHN');--가상 열을 제외하면 삽입 가능

SELECT * FROM emp10_view;--10번 부서만 보여지게 제한이 걸려서 삽입한 것이 안 보임
SELECT * FROM emp;--emp테이블에 1행이 추가된 것을 확인할 수 있음

ROLLBACK;

- WITH READ ONLY (읽기 전용 뷰를 생성하는 옵션)
CREATE OR REPLACE VIEW emp20_view AS
SELECT empno id_number, ename name, sal*12 ann_salary
FROM emp WHERE deptno=20
WITH READ ONLY;

UPDATE emp20_view SET name='DAVID' WHERE id_number=7902;
--읽기 전용 뷰에서는 DML 작업(삽입,수정,삭제)을 수행할 수 없습니다.

- view 삭제
DROP VIEW emp10_view;

- SEQUENCE
유일한 값을 생성해주는 오라클 객체
시퀀스를 생성하면 기본키와 같이 순차적으로 증가하는 컬럼을 자동적으로
생성할 수 있음

- 시퀀스 생성
CREATE SEQUENCE test_seq
start with 1
increment by 1
maxvalue 100000;
시작 값이 1이고 1씩 증가하고, 최대값이 100000이 되는 시퀀스 생성

currval : 현재 값을 반환
nextval : 현재 시퀀스 값의 다음 값을 반환

SELECT test_seq.nextval FROM dual;
SELECT test_seq.currval FROM dual;

- 시퀀스 수정
ALTER SEQUENCE sequence_name
increment by n
maxvalue n | nomaxvalue
minvalue n | nominvalue
cycle | nocycle

start with는 수정할 수 없음

- 시퀀스 삭제
DROP SEQUENCE test_seq;

- 인덱스(index)
인덱스는 원하는 정보의 위치를 빠르고,정확하고,지능적으로 알아낼 수 있는
방법을 제공.
테이블의 컬럼에 대한 제약 조건을 설정할 때 Primary key나 Unique로 
설정하면 Oracle은 자동으로 이 컬럼에 대해 Unique Index를 설정함

- 인덱스 만들기

1)자동 : 테이블 정의에 Priamry key 또는 Unique 제약 조건을 정의하면
        고유 인덱스가 자동으로 생성
2)수동 : 사용자가 열에 고유하지 않은 인덱스를 생성하여 행에 대한 액세스
        시간을 줄일 수 있음

- 유일한 값을 가지는 컬럼에 인덱스 설정 : Unique Index
CREATE UNIQUE INDEX dname_idx ON dept (dname);

- 유일한 값을 가지지 않는 컬럼에 인덱스 설정 : Non Unique Index
CREATE INDEX emp_ename_idx ON emp (ename);

- 동의어
동의어는 객체의 다른 이름. 객체 액세스를 단순화
- 다른 사용자가 소유한 테이블을 쉽게 참조
- 긴 객체 이름 짧게 만듬

- 동의어 생성
CREATE SYNONYM emp20 FOR emp20_view;
SELECT * FROM emp20;

- 동의어 삭제
DROP SYNONYM emp20;


--pinos71@daum.net
/*
DEPT
-deptno 부서번호
-dname 부서명
-loc 근무지

EMP
-empno 사원번호
-ename 이름
-job 직업
-mgr 상사번호
-hiredate 근무시작일
-sal 월급
-comm 커미션
-deptno 부서번호

SALGRADE
-grade 등급
-losal 최소월급
-hisal 최대월급
*/