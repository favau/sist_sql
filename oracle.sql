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
2)emp테이블에서 사원이름과 월급을 출력하는데 컬럼명은 "이 름","월 급"으로 바꿔서 출력하시오.
3)emp테이블에서 사원번호,사원이름,월급,연봉을 구하고 각각 컬럼명은 "사원번호","사원이름","월급","연봉"으로 출력하시오.
4)emp테이블에서 업무를 중복되지 않게 표시하시오.
5)emp테이블에서 사원명과 업무를 쉼표(,)로 연결해서 표시하고 컬럼명은 Employee and Job으로 표시하시오.
1)
SELECT EMPNO, ENAME, SAL FROM emp;
2)
SELECT ENAME "이 름", SAL "월 급" FROM emp;
3)
SELECT EMPNO "사원번호", ENAME "사원이름", SAL "월급", COMM "연봉" FROM emp;
4)
SELECT DISTINCT job FROM emp;
5)
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
2)emp테이블에서 사원이름이 SMITH인 사원의 이름과 월급, 부서번호를 구하시오.
3)월급이 2500이상 3500미만인 사원의 이름, 입사일, 월급을 구하시오.
4)급여가 2000에서 3000사이에 포함되지 않는 사원의 이름, 업무, 급여를 출력하시오.

1)
SELECT ename,job,sal FROM emp WHERE empno='7698';
2)
SELECT ename,sal,deptno FROM emp WHERE ename='SMITH';
3)
SELECT ename,hiredate,sal FROM emp WHERE sal BETWEEN 2500 AND 3500;
4)
SELECT ename, job, sal FROM emp WHERE sal NOT BETWEEN 2000 AND 3000;