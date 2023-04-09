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
