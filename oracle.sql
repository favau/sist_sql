select�� �����ͺ��̽��κ��� ����Ǿ� �ִ� �����͸� �˻��ϴµ� ���

- ��ü ���̺� ��
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno From emp;
SELECT * FROM emp;

- Ư�� �� ����
SELECT ename, job From emp;
 
= �ּ� 
SELECT * /* �ּ� */ FROM emp; --�ּ�
 
- dual
DUAL : �Լ� �� ����� ����� �� �� ����� �� �ִ� ����(PUBLIC) ���̺�
       ����� �����Ͱ� �ִ� ���̺��� �������� ���� ��� �� ���� ��¥,
       �ð� ����, �Ͻ����� ���, ��¥ ���� � �ַ� ���
SELECT ASCII(0) FROM dual;
SELECT SYSDATE FROM dual;
SELECT 7 + 10 FROM dual;

- �����
SELECT ename,sal,sal+300 FROM emp;
SELECT ename, sal, (sal+300)*12 FROM emp;

- NULL ���� ����
NULL : NULL�� ����� �� ���ų�, �Ҵ���� �ʾҰų�, �� �� ���ų�,
       ������ �� ���� ��(NULL�� 0�̳� ������� �ٸ�)
SELECT empno,ename, job, comm FROM emp;

- NULL���� �����ϴ� ������� null�� ���
SELECT empno,ename,sal+comm FROM emp;

- �˸��ƽ�(ALIAS) ����
�� �̸��� �ٲ�
�� �̸� �ٷ� �ڿ� ����, �� �̸��� ALIAS ���̿� ���� ������ as Ű���尡 �� ���� ����
SELECT sal*12 FROM emp;
SELECT sal*12 ASal FROM EMP;
SELECT sal*12 AS ASal FROM emp;

�˸��ƽ��� ū ����ǥ�� ����ϴ� ���
- ��ҹ��ڸ� ������ ��
- ���� ���� ��
- _,# �� Ư������ ��� ��
- ���ڷ� ������ ���
/* ���� ����ǥ�� ����(���ڿ�)�� ���. sql�� ����/���ڿ� ������ ���� */
SELECT ename "Name" FROM emp;
SELECT sal*12 "Annual Salary" FROM emp;
SELECT sal*12 "365Sal" FROM emp;

- ���� ������
���̳� ���ڿ��� �ٸ� ���� ����. �� ���� ���μ�(||)���� ��Ÿ��
��� ���� ���ڽ��� ����
SELECT ename || sal FROM emp;
SELECT ename || ' has &' || sal FROM emp;

- DISTINCT : �ߺ��� �����ϴ� ������
SELECT DISTINCT deptno FROM emp;
SELECT DISTINCT(deptno) FROM emp;

[�ǽ�����]
1)emp���̺��� �����ȣ,����̸�,������ ����Ͻÿ�.
SELECT EMPNO, ENAME, SAL FROM emp;
2)emp���̺��� ����̸��� ������ ����ϴµ� �÷����� "�� ��","�� ��"���� �ٲ㼭 ����Ͻÿ�.
SELECT ENAME "�� ��", SAL "�� ��" FROM emp;
3)emp���̺��� �����ȣ,����̸�,����,������ ���ϰ� ���� �÷����� "�����ȣ","����̸�","����","����"���� ����Ͻÿ�.
SELECT EMPNO "�����ȣ", ENAME "����̸�", SAL "����", COMM "����" FROM emp;
4)emp���̺��� ������ �ߺ����� �ʰ� ǥ���Ͻÿ�.
SELECT DISTINCT job FROM emp;
5)emp���̺��� ������ ������ ��ǥ(,)�� �����ؼ� ǥ���ϰ� �÷����� Employee and Job���� ǥ���Ͻÿ�.
SELECT ename || ',' || job "Employee and Job" FROM emp;

- WHERE���� �̿��� �� ����
���� üũ ��� ���ǿ� �´� �ุ �о� ��
SELECT * FROM emp WHERE deptno=10;
SELECT * FROM emp WHERE ename='SMITH';
SELECT * FROM emp WHERE hiredate>'81-12-03';

--(����) WHERE ���� �˸��ƽ��� ����� �� ����
SELECT ename, sal, sal*12 ansal FROM emp WHERE sal*12 > 15000;

- �� �������� ���
SELECT * FROM emp WHERE hiredate > '81-04-02';
���� ������ true
SELECT * FROM emp WHERE hiredate <> '81-04-02';
SELECT * FROM emp WHERE hiredate ^= '81-04-02';
SELECT * FROM emp WHERE hiredate !+ '81-04-02';

�̻�~����
SELECT * FROM emp WHERE sal>=2000 AND sal<=5000;

BETWEEN ~ AND ~ :  �̻�~����
SELECT * FROM emp WHERE sal BETWEEN 2000 AND 5000;
2000~5000 ���̰� �ƴ� �޿��� �޴� ��� ������ ����
SELECT * FROM emp WHERE sal NOT BETWEEN 2000 AND 5000;
 
IN : �� ��� ���� ���� ��ġ
SELECT * FROM emp WHERE sal IN (1300,2450,3000); 
SELECT * FROM emp WHERE sal NOT IN (1300,2450,3000);

SELECT ename,mgr,deptno FROM emp WHERE ename IN ('ALLEN','FORD');

LIKE : ���� �˻�
% : 0�� �̻��� ���ڸ� ��Ÿ�� 
_ : �� ���ڸ� ��Ÿ��
    
SELECT * FROM emp WHERE ename LIKE '%S%'; --S�� ó��,�߰�,���� ���� �̸�

�Ի����� 22�� ������ �Ի���
SELECT * FROM emp WHERE hiredate LIKE '%22';
SELECT * FROM emp WHERE ename LIKE 'FOR_'; --FOR������ �� �� ����

[�ǽ�]
1)emp���̺��� �����ȣ�� 7698�� ����� �̸�, ����, �޿��� ����Ͻÿ�.
SELECT ename,job,sal FROM emp WHERE empno='7698';
2)emp���̺��� ����̸��� SMITH�� ����� �̸��� ����, �μ���ȣ�� ���Ͻÿ�.
SELECT ename,sal,deptno FROM emp WHERE ename='SMITH';
3)������ 2500�̻� 3500�̸��� ����� �̸�, �Ի���, ������ ���Ͻÿ�.
SELECT ename,hiredate,sal FROM emp WHERE sal BETWEEN 2500 AND 3500;
4)�޿��� 2000���� 3000���̿� ���Ե��� �ʴ� ����� �̸�, ����, �޿��� ����Ͻÿ�.
SELECT ename, job, sal FROM emp WHERE sal NOT BETWEEN 2000 AND 3000;
SELECT ename, job, sal FROM emp WHERE NOT(sal>=2000 AND sal<=3000);


04-07---------------------------------------------------------------------------
NULL ���� ���
SELECT * FROM emp WHERE comm IS null; -- (comm = null �Ұ�)
SELECT * FROM emp WHERE comm IS NOT null;

- ��������(AND,OR,NOT)
AND �������� ��� : ���� ��� ������ ��� TRUE�̸� TRUE�� ��ȯ
SELECT empno,ename,job,sal FROM emp
WHERE sal>=2000 AND job LIKE '%MAN%';

OR �������� ��� : ���� �� �ϳ��� TRUE�̸� TRUE�� ��ȯ
SELECT empno,ename,job,sal FROM emp
WHERE sal>=2000 OR job LIKE '%MAN%';

NOT �������� ���
SELECT ename,job FROM emp WHERE job NOT IN ('CLERK','SALESMAN');

[�ǽ�����]
5)81��05��01�ϰ� 81��12��03�� ���̿� �Ի��� ����� �̸�,�޿�,�Ի����� ����Ͻÿ�.
SELECT ename,sal,hiredate FROM emp WHERE hiredate>'81-05-01' AND hiredate<'81-12-03';
6)�����ȣ�� 7566,7782,7934�� ����� ������ ������� �����ȣ,�̸�,������ ����Ͻÿ�.
SELECT empno,ename,sal FROM emp WHERE empno NOT IN ('7566','7782','7934');
7)�μ���ȣ(deptno) 30���� �ٹ��ϸ� ������ 2,000�޷� ������ 81��05��01�� ������ �Ի��� ����� �̸�,�޿�,�μ���ȣ,�Ի����� ����Ͻÿ�
SELECT ename,sal,empno,hiredate FROM emp WHERE deptno=30 AND sal<=2000 AND hiredate<'81-05-01';
8)�޿��� 2,000~5,000�޷� ���̰� �μ���ȣ�� 10 �Ǵ� 30�� ����� �̸��� �޿�,�μ���ȣ�� ����Ͻÿ�
SELECT ename,sal,empno FROM emp WHERE (sal BETWEEN 2000 AND 5000) AND deptno IN (10,30);
9)������ SALESMAN�Ǵ� MANAGER�̸鼭 �޿��� 1600, 2850�� �ƴ� ��� ����� �̸�,����,�޿��� ����Ͻÿ�.
SELECT ename,job,sal FROM emp WHERE job IN ('SALESMAN','MANAGER') AND sal NOT IN (1600,2850);

-ORDER BY �� : ����
�������� ����
SELECT * FROM emp ORDER BY sal;
SELECT * FROM emp ORDER BY sal ASC;

�������� ����
SELECT * FROM emp ORDER BY sal DESC;

SELECT * FROM emp WHERE deptno=10 ORDER BY sal DESC;

���Ľ� ������ �Ǵ� �÷��� ���� �ߺ��Ǹ� 2�� ���� ����
SELECT * FROM emp ORDER BY sal ASC, ename ASC;
�� �˸��ƽ��� �������� ����
SELECT empno,ename,sal*12 annsal FROM emp ORDER BY annsal;
���� ���� ��ġ�� ����Ͽ� ����
SELECT ename,job,deptno,hiredate FROM emp ORDER BY 3;

���̺� ������ ������� �� ���� ��ġ �ο�
SELECT * FROM emp ORDER BY 2;
SELECT * FROM emp ORDER BY comm;

NULLS FIRST �Ǵ� NULLS LAST Ű���带 ����Ͽ� ��ȯ�� �� �� NULL���� �����ϴ� ���� ���� ������ �� ó���� ��Ÿ���ų� �������� ��Ÿ������ ����
SELECT * FROM emp ORDER BY comm NULLS FIRST;
SELECT * FROM emp ORDER BY comm DESC NULLS LAST;

[�ǽ�����[
1)�����ȣ,����̸�,�Ի����� ����ϴµ� �Ի����� ���� ��������� �����Ͻÿ�.
SELECT empno,ename,hiredate FROM emp ORDER BY hiredate ASC;
2)����̸�,�޿�,������ ���ϰ� ������ ���� ������ �����Ͻÿ�.
SELECT ename,sal,mgr FROM emp ORDER BY mgr ASC;
3)10���μ� �Ǵ� 20���μ����� �ٹ��ϰ� �ִ� ����� �̸��� �μ���ȣ�� ����ϴµ� �̸��� �����ڼ����� ǥ���Ͻÿ�.
SELECT ename,empno FROM emp WHERE deptno IN (10,20) ORDER BY ename ASC;
4)Ŀ�̼� ����� ���� ��� ����� �̸�,�޿�,Ŀ�̼��� ����ϴµ� Ŀ�̼��� �������� �������� �����Ͻÿ�.
SELECT ename,sal,comm FROM emp WHERE comm IS NOT NULL ORDER BY comm DESC;

- �Լ�
��ҹ��� ���� �Լ� : LOWER,UPPER,INICAP

SELECT LOWER('HELLO') FROM dual;

�ҹ��ڷ� ��ȯ
SELECT LOWER('HELLO') FROM dual;
SELECT LOWER(ename) FROM emp;
�빮�ڷ� ��ȯ
SELECT UPPER('wave') FROM dual;
ù���ڴ� �빮�� �������� �ҹ���
SELECT INITCAP('hello wORLD') FROM dual;
SELECT INITCAP(ename) FROM emp;

-���� �����Լ�
CONCAT(���ڿ�1,���ڿ�2) : ���ڿ�1�� ���ڿ�2�� �����Ͽ� �ϳ��� ���ڿ��� ��ȯ
SELECT CONCAT('Hello','World') FROM dual;

SUBSTR(����ڿ�,�ε���) : ����ڿ����� ������ �ε������� ���ڿ��� ����. (����)�ε����� 1���� ����
SELECT SUBSTR('Hello World',3) FROM dual;
�ε��� 3���� 3���� ���� ����
SELECT SUBSTR('Hello World',3,3) FROM dual;
�� 3��°���� ������ ����
SELECT SUBSTR('Hello World',-3,2) FROM dual;

LENGTH(����ڿ�) : ���ڿ��� ����
SELECT LENGTH('Hello World') FROM dual;
SELECT LENGTH(ename) FROM emp;

LENGTHB(����ڿ�) : ���ڿ��� ����Ʈ ��
SELECT LENGTHB('SMITH') FROM dual;
SELECT LENGTHB('ȫ�浿') FROM dual;

INSTR (����ڿ�,�˻�����) : �˻������� ��ġ��
SELECT INSTR('Hello World','e') FROM dual;
SELECT INSTR('Hello World','s') FROM dual; -- �˻����ڰ� ������ 0
SELECT INSTR('Hello World','o') FROM dual;
����ڿ�,�˻�����,�˻��ε���:�ش���ġ���� �˻�
SELECT INSTR('Hello World','o',6) FROM dual;
����ڿ�,�˻�����,�˻��ε���,�ݺ�Ƚ�� : ����ڿ� ��ü�� ������ �˻��Ѵٴ� �ǹ̰� �ƴ϶�
1�� �˻����� o�� ã���� ������ Ƚ����ŭ �� ���� ���ڸ� �˻��Ѵٴ� �ǹ�
SELECT INSTR('Hello World','o',1,2) FROM dual;

TRIM : ���ڿ����� �����̳� Ư�� ���ڸ� ������ ���� ���� ��ȯ
���� : ���� - leading, ������ - trailing, ���� - both
SELECT TRIM(LEADING 'h' FROM 'habchh') FROM dual;
SELECT TRIM(BOTH 'h' FROM 'habchh') FROM dual;

REPLACE(����ڿ�,OLD,NEW):����ڿ����� OLD���ڸ� NEW���ڷ� ��ü
SELECT REPLACE('010.1234.5678','.','-') FROM dual;

�Լ� ��ø
SELECT ename,LOWER(SUBSTR(ename,1,3)) FROM emp;

- ���� �Լ�

CEIL(�Ǽ�) : �ø� ó���� �������� ��ȯ
SELECT CEIL(1.4) FROM dual;

FLOOR(�Ǽ�) : ���� ó���� �������� ��ȯ
SELECT FLOOR(1.7) FROM dual;

ROUND(������,�����ڸ���) : �ݿø�
SELECT ROUND(45.926,2) FROM dual; -- 45.93
SELECT ROUND(45.926) FROM dual; -- 46

TRUNC(������,�����ڸ���) : ����
SELECT TRUNC(45.926,2) FROM dual;
SELECT TRUNC(45.926) FROM dual;

[�ǽ�����]
1)����(job)�� ù���ڴ� �빮�� �������� �ҹ��ڷ� ����Ͻÿ�.
SELECT INITCAP(job) FROM emp;
2)����̸� �� A�� ���Ե� ����̸��� ���ϰ� �� �̸� �� �տ��� 3�ڸ� ����
  �Ͽ� ����Ͻÿ�.
SELECT SUBSTR(ename,1,3) FROM emp WHERE ename LIKE '%A%';
3)�̸��� ����° ���ڰ� A�� ��� ����� �̸��� ǥ���Ͻÿ�.
SELECT ename FROM emp WHERE SUBSTR(ename,3,1)='A';
SELECT ename FROM emp WHERE ename LIKE '__A%';
4)�̸��� J,A �Ǵ� M���� �����ϴ� ��� ����� �̸��� ù���ڴ� �빮�ڷ�
  �������� �ҹ��ڷ� ǥ���ϰ� �̸��� ���̸� ǥ���Ͻÿ�.
SELECT INITCAP(ename),LENGTH(ename) FROM emp
WHERE ename LIKE 'J%' OR ename LIKE 'A%' OR ename LIKE 'M%';

SELECT INITCAP(ename),LENGTH(ename) FROM emp
WHERE SUBSTR(ename,1,1) IN ('J','A','M');
5)�̸��� ���ڼ��� 6�� �̻��� ����� �̸��� �տ��� 3�ڸ� ���Ͽ� �ҹ��ڷ�
  ����Ͻÿ�.
SELECT LOWER(SUBSTR(ename,1,3)) FROM emp WHERE LENGTH(ename)>=6;  

-��¥�Լ�

-SYSDATE(ORACLE ������ ���� ��¥�� �ð��� ��ȯ)
SELECT SYSDATE FROM dual;

��¥�� ��� ������ ���
SELECT ename, (SYSDATE-hiredate)/7 AS WEEKS 
FROM emp WHERE deptno=10; 

MONTHS_BETWEEN(��¥1,��¥2) : �� ��¥ ���� �� ��
SELECT MONTHS_BETWEEN('2012-03-23','2010-01-23') FROM dual;
�ٹ� �� ��
SELECT ename,ROUND(MONTHS_BETWEEN(SYSDATE,hiredate)) months_worked
FROM emp ORDER BY months_worked;

ADD_MONTHS(��¥,����) : Ư�� ��¥�� ���� ������ ���� ���� �ش� ��¥��
                       ��ȯ�ϴ� �Լ�
SELECT ADD_MONTHS('2022-01-01',8) FROM dual;                       

NEXT_DAY(��¥,����) : ������ ������ ���� ��¥
SELECT NEXT_DAY('2023-04-07','������') FROM dual;

LAST_DAY(��¥) : ���� ������ ��
SELECT LAST_DAY('2023-04-07') FROM dual;

EXTRACT(��/��/��/��/��/�� FROM ��¥) : ��¥ �������� Ư���� ����,��,��
                                    ��,��,�� ���� ����
SELECT EXTRACT(YEAR FROM SYSDATE),
       EXTRACT(MONTH FROM SYSDATE),
       EXTRACT(DAY FROM SYSDATE)
FROM dual;     

- ��ȯ �Լ�
TO_CHAR : ����->����, ��¥->����
TO_NUMBER : ����->����
TO_DATE : ����->��¥

TO_CHAR(��¥,���˹���)
SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD') FROM dual;
SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD HH:MI:SS') FROM dual;

�б⺰ �Ի����� ��
SELECT TO_CHAR(hiredate,'Q') AS Quarter,
       COUNT(empno) AS employee_number
FROM emp
GROUP BY TO_CHAR(hiredate,'Q');

TO_CHAR(����,���˹���)

���� �ڸ����� ��ġ
SELECT TO_CHAR(1234,9999) FROM dual;
SELECT TO_CHAR(1234,'9999') FROM dual;
SELECT TO_CHAR(1234,'0000') FROM dual;

���� �ڸ��� ���� ���� �ڸ��� ����
SELECT TO_CHAR(1234,99999) FROM dual; -- 1234
SELECT TO_CHAR(1234,'99999') FROM dual; -- 1234
SELECT TO_CHAR(1234,'00000') FROM dual; --01234

�Ҽ��� �ڸ�
SELECT TO_CHAR(1234,9999.99) FROM dual; --1234.00
SELECT TO_CHAR(1234,'9999.99') FROM dual; --1234.00
SELECT TO_CHAR(1234,'0000.00') FROM dual; --1234.00

�ݿø��ؼ� �Ҽ��� ��°�ڸ����� ǥ��
SELECT TO_CHAR(25.897,'99.99') FROM dual; --25.90
�λ�� �޿��� �Ҽ��� ù°�ڸ����� ǥ��
SELECT ename, TO_CHAR(sal*1.15,'9,999.9') FROM emp;

��ȭǥ��
SELECT TO_CHAR(1234,'$0000') FROM dual;--$1234
SELECT TO_CHAR(1234,'L0000') FROM dual;--\1234

TO_DATE(����,���˹���) : ���ڸ� ��¥�� ��ȯ
SELECT TO_DATE('23-04-07','YYYY-MM-DD') FROM dual;
�������� ���� ����
SELECT TO_DATE('23-04-07') FROM dual;

TO_NUMBER(����,���˹���) : ���� -> ���� ��ȯ
SELECT TO_NUMBER('100','999') FROM dual;
�������� ���� ����
SELECT TO_NUMBER('200') FROM dual;

-�Ϲ��Լ�

NVL(value1,value2) : value1�� null�̸� value2�� ��.
                     value1�� value2�� �ڷ����� ��ġ
SELECT ename,sal,NVL(comm,0) FROM emp; 
SELECT ename,NVL(TO_CHAR(comm),'No Commission') FROM emp;

NVL2(value1,value2,value3) : value1�� null���� ��. null�̸�
                             value3, null�� �ƴϸ� value2
                             �ڷ����� ��ġ���� �ʾƵ� ��
SELECT ename, NVL2(comm,'commission','no commission')
FROM emp;

NULLIF(value1,value2) : �ΰ��� ���� ��ġ�ϸ� null. �ΰ��� ����
                        ��ġ���� ������ value1
SELECT NULLIF(LENGTH(ename),LENGTH(job)) "NULLIF" FROM emp;                        

COALESCE(value1,value2,value3....) : null���� �ƴ� ���� ���
                                     �ڷ����� ��ġ
SELECT comm,mgr,sal,COALESCE(comm,mgr,sal) FROM emp;

[�ǽ�����]
6)���ú��� �̹����� �������������� ���� �� ���� ���Ͻÿ�.
SELECT LAST_DAY(SYSDATE)-SYSDATE AS "���� �� ��" FROM dual;
7)�� ����� ���� �����ȣ,�̸�,�޿� �� 15% �λ�� �޿��� ����(�ݿø�)
  �� ǥ���Ͻÿ�. �λ�� �޿����� ���̺��� New Salary�� �����Ͻÿ�.
SELECT empno,ename,sal,ROUND(sal*1.15) "New Salary" FROM emp;
8)�� ����� �̸��� ǥ���ϰ� �ٹ� �� ��(�Ի��Ϸκ��� ��������� �� ��)��
  ����Ͽ� �����̺��� MONTHS_WORKED�� �����Ͻÿ�. ����� ������ �ݿø�
  �Ͽ� ǥ���ϰ� �ٹ� �� ���� �������� ������������ �����Ͻÿ�.
SELECT ename,ROUND(MONTHS_BETWEEN(SYSDATE,hiredate)) "MONTHS_WORKED"
FROM emp ORDER BY "MONTHS_WORKED" ASC;
9)�̸��� �ҹ��ڷ� ǥ��, ����, �ٹ������� ����Ͻÿ�.
SELECT LOWER(ename),job,TRUNC(MONTHS_BETWEEN(SYSDATE,hiredate)/12)
FROM emp;

04-10---------------------------------------------------------------------------
/*
case �÷� when �񱳰� then �����
         when �񱳰� then �����
         when �񱳰� then �����
         (else �����)
end
*/

SELECT ename,sal,job,
       CASE job WHEN 'SALESMAN' THEN sal*0.1
                WHEN 'MANAGER' THEN sal*0.2
                WHEN 'ANALYST' THEN sal*0.3
                ELSE sal*0.4
       END AS "BONUS" --�˸��ƽ�
FROM emp;

SELECT ename,sal,job,
       CASE WHEN sal>=4000 AND sal<=5000 THEN 'A'
            WHEN sal>=3000 AND sal<4000 THEN 'B'
            WHEN sal>=2000 AND sal<3000 THEN 'C'
            WHEN sal>=1000 AND sal<2000 THEN 'D'
            ELSE 'F'
       END AS "Grade"
FROM emp ORDER BY "Grade", sal DESC;;

decode(ORACLE ����) : =�񱳸� ����
DECODE(�÷�,�񱳰�,��ȯ��,
           �񱳰�,��ȯ��,
           �񱳰�,��ȯ��,
           ��ȯ��)
           
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

- �׷��Լ� : �� ���� ������ �����Ͽ� �׷캰�� �ϳ��� ����� ����
AVG() : NULL�� ������ ��� ������ ����� ��ȯ, NULL���� ��� ��꿡�� ���õ�
SELECT AVG(sal) FROM emp;

COUNT() : NULL�� ������ ���� ���� ��� ���ڵ��� ���� ��ȯ.
SELECT COUNT(*) FROM emp;
SELECT COUNT(comm) FROM emp;

MAX() : ���ڵ� ���� �ִ� ���� �� �� ���� ū ���� ��ȯ
SELECT MAX(sal) FROM emp;
SELECT MAX(ename) FROM emp;
SELECT MAX(hiredate) FROM emp;

MIN() : ���ڵ� ���� �ִ� ������ �� ���� ���� ���� ��ȯ
SELECT MIN(sal) FROM emp;
SELECT MIN(ename) FROM emp;
SELECT MIN(hiredate) FROM emp;

SUM() : ���ڵ���� �����ϰ� �ִ� ��� ���� ���Ͽ� ��ȯ
SELECT SUM(sal) FROM emp;

SELECT MAX(sal),MIN(sal),ROUND(AVG(sal)),SUM(sal) FROM emp;

-GROUP BY �� : SELECT���� �����Լ� ���� �� ���� �÷��� ������ �� ���� ������ GROUP BY���� �̿��ؼ� �׷����� ��� �����Լ��� ������
              (�׷�(������ ���� �÷�)�� �����Լ��� ���� ������� ���� ��ȯ)

SELECT deptno, MAX(sal), MIN(sal), ROUND(AVG(sal)),SUM(sal) FROM emp GROUP BY deptno;

SELECT job,MAX(sal),MIN(sal),ROUND(AVG(sal)),SUM(sal) FROM emp GROUP BY job;

SELECT job,MAX(sal),MIN(sal),ROUND(AVG(sal)),SUM(sal) FROM emp WHERE job='SALESMAN' GROUP BY job;

SELECT deptno, job, SUM(sal)
FROM emp GROUP BY deptno,job ORDER BY deptno;

HAVING : �׷�ó�� ����� �����ϰ��� �� �� HAVING�� ���
         WHERE������ �����Լ��� ����� �� ���� HAVING�� ���

-���� �߻�
SELECT deptno,ROUND(AVG(sal))
FROM emp WHERE ROUND(AVG(sal))>=2000 GROUP BY deptno;

-���� ����
SELECT deptno,ROUND(AVG(sal))
FROM emp GROUP BY deptno HAVING ROUND(AVG(sal))>=2000;

having���� �̿�(having���� �˸��ƽ� ��� x)
SELECT deptno, MAX(sal)
FROM emp GROUP BY deptno HAVING MAX(sal)>=3000;

-�б⺰ �Ի����� ��
SELECT TO_CHAR(hiredate,'Q') AS Quarter,COUNT(empno) AS employee_number
FROM emp GROUP BY TO_CHAR(hiredate,'Q') ORDER BY Quarter;

SELECT CEIL(EXTRACT(MONTH FROM hiredate)/3) AS Quarter,
       COUNT(empno) AS count_member FROM emp GROUP BY CEIL(EXTRACT(MONTH FROM hiredate)/3);

[�ǽ�����]     
10)����̸�, ����, ���ް� Ŀ�̼��� ���� ���� �÷��� �Ǳ޿���� �ؼ� ����Ͻÿ�. �� NULL���� ��Ÿ���� �ʰ� �ۼ��Ͻÿ�.
SELECT ename,sal,sal+NVL(comm,0) AS �Ǳ޿� FROM emp;
11)���ް� Ŀ�̼��� ��ģ �ݾ��� 2,000�̻��� �޿��� �޴� ����� �̸�,����,����,Ŀ�̼�,��볯¥�� ����Ͻÿ�. ��,��볯¥�� 1980-12-17���·� ����Ͻÿ�.
SELECT ename,job,sal,comm,TO_CHAR(hiredate,'YYYY-MM-DD') AS hiredate FROM emp WHERE sal+NVL(comm,0)>=2000;
12)CASE���� DECODE�Լ��� ����Ͽ� ���� �����Ϳ� ���� JOB���� ���� �������� ��� ����� ����� ǥ���Ͻÿ�.
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

����        ���
PRESIDENT   A
ANALYST     B
MANAGER     C
SALESMAN    D
CLERK       E
��Ÿ         0

[�ǽ�����]
1)��� ����� �޿� �ְ��,������,�Ѿ� �� ��վ��� ǥ���Ͻÿ�. �� ���̺��� ���� maximum,minimum,sum,average�� �����ϰ�, ����� ������ �ݿø��ϰ� ���ڸ� ������ ,(��ǥ)�� ����Ͻÿ�.
SELECT TO_CHAR(MAX(sal),'9,999') maximum,TO_CHAR(MIN(sal),'9,999') minimum,TO_CHAR(SUM(sal),'99,999') sum,
TO_CHAR(ROUND(AVG(sal)),'9,999') average FROM emp;
2)�޿��� Ŀ�̼��� ���� �ݾ��� �ְ�,����,��ձݾ��� ���Ͻÿ�. ��ձݾ��� �Ҽ��� ù°�ڸ����� ǥ���Ͻÿ�.
SELECT MAX(sal+NVL(comm,0)),MIN(sal+NVL(comm,0)),ROUND(AVG(sal+NVL(comm,0)),'1') FROM emp;
3)������ ������ ������ ��� ���� ǥ���Ͻÿ�.(������ ��� ���� ���Ͻÿ�.)
SELECT job,COUNT(*) FROM emp GROUP BY job;
4)30�� �μ��� ������� ���Ͻÿ�.
SELECT COUNT(*) FROM emp WHERE deptno = 30;
SELECT deptno,COUNT(*) FROM emp WHERE deptno=30 GROUP BY deptno;
5)������ �ְ� ������ ���ϰ� ����, �ְ� ������ ����Ͻÿ�.
SELECT job,MAX(sal) FROM emp GROUP BY job;
6)�μ����� ���޵Ǵ� �ѿ��޿��� �ݾ��� 9,000�̻��� �޴� ������� �μ���ȣ, �ѿ����� ����Ͻÿ�.
SELECT deptno,SUM(sal) FROM emp GROUP BY deptno HAVING SUM(sal)>=9000;
7)�������� �����ȣ�� ���� ���� ����� ���ϰ� �� ��� ������ �����ȣ 79�� �����ϴ� ����� �����ֽÿ�.(����,���� ū �����ȣ ���)
SELECT job,MAX(empno) FROM emp GROUP BY job HAVING MAX(empno)>='7900' AND MAX(empno)<=7999 ;
8)������ �ѿ����� ����ϴµ� ������ 'MANAGER'�� ����� �����ϰ� �ѿ����� 5,000���� ���� ������ �ѿ��޸� ����Ͻÿ�.
SELECT job,SUM(sal) FROM emp GROUP BY job HAVING SUM(sal)>5000 AND job!='MANAGER';

- �м��Լ�
RANK() : ������ ǥ���� �� ����ϴ� �Լ�
RANK(���ǰ�) WITHIN GROUP (ORDER BY ���ǰ� �÷��� |ASC|DESC|) : Ư�� �������� ���� Ȯ���ϱ�
(����) RANK �ڿ� ������ �����Ϳ� ORDER BY �ڿ� ������ �����ʹ� ���� �÷��̾�� ��.

SELECT ename FROM emp ORDER BY ename;
SELECT RANK('SMITH') WITHIN GROUP (ORDER BY ename) "RANK" FROM emp;

RANK() OVER (���İ�)
��ü�������� : RANK() �ڰ� WITHIN GROUP�� �ƴϰ� OVER()�� �ٲ�
������� empno, ename, sal, �޿� ������ ���
SELECT empno,ename,sal,RANK() OVER (ORDER BY sal) AS RANK_ASC,RANK() OVER(ORDER BY sal DESC) AS RANK_DESC FROM emp;

10�� �μ��� ���� �������� ����� �̸�, �޿�, �ش� �μ� ���� �޿� ������ ���
SELECT empno,ename,sal,RANK() OVER (ORDER BY sal DESC) "RANK" FROM emp WHERE deptno=10;

������ ����� �� �׷��� ������ ������ ���� ���� PARTITION BY ���
���,�̸�,�޿�,�μ���ȣ,�μ��� �޿� ������ ���
SELECT empno,ename,sal,deptno,RANK() OVER(PARTITION BY deptno) 

- JOIN : �� �̻��� ���̺��� �����Ͽ� �����͸� �˻��ϴ� ���

- īƼ�� �� : �˻��ϰ��� �ߴ� �����ͻ� �ƴ϶� ���ο� ���� ���̺���� ��� �����Ͱ� ��ȯ�Ǵ� ����
SELECT * FROM emp,dept;

ORACLE ����
- ���� ����(Equil Join) : �������� ������ Equality Condition(=)�� ���Ͽ� ������ �̷�� ��
SELECT emp.ename,dept.dname FROM emp,dept WHERE emp.deptno = dept.deptno;

���̺� �˸��ƽ� �ο��ϱ�
SELECT e.ename, d.dname FROM emp e, dept d
WHERE e.deptno = d.deptno;

�÷����� ȣ���� �� ���̺�� �Ǵ� ���̺� �˸��ƽ��� ����
(���ο� �����ϴ� ���̺�鿡 ���� �÷��� �����ϸ� �ݵ�� ���̺�� �Ǵ� ���̺� �˸��ƽ��� ����ؾ���)
SELECT ename, dname FROM emp e, dept d
WHERE e.deptno = d.deptno;

�߰����� ���� ����ϱ�
SELECT e.ename,d.dname FROM emp e,dept d 
WHERE e.deptno = d.deptno AND e.ename = 'ALLEN';

SELECT e.ename,e.sal,d.dname FROM emp e, dept d
WHERE e.deptno = d.deptno AND e.sal BETWEEN 3000 AND 4000;

- �񵿵� ����(Non Equil Join)
���̺��� � column�� join�� ���̺��� column�� ��ġ���� ���� �� ����ϰ� 
���� ������ ����(=)�̿��� �����ڸ� ����(between and, is null,in)

����̸�,�޿�,�޿���� ���ϱ�(emp,salgrade ���̺� �̿�)
SELECT e.ename,e.sal,s.grade FROM emp e, salgrade s
WHERE e.sal BETWEEN s.losal AND s.hisal;

- SELF JOIN ���� ���̺� ������ Į���� �־�� ������
����̸��� �ش� ����� ������ �̸� ���ϱ�(�����ڰ� ���� ��� ����)
SELECT e.ename ����̸�, n.ename �������̸� FROM emp e,emp n
WHERE e.mgr=n.empno;

�� ����(Outer Join) : ������ �� �ΰ��� ���̺��� �� �� �÷����� ����� ���� ���ٸ�
���̺�κ��� �����͸� ��ȯ���� ����. �� �� �÷����� ������� ���� ���� ǥ���ϰ� �ʹٸ�
Outer Join�� ����ؼ� ǥ�� ����

������ ���� �ݴ� ���̺��� ���� ������ �÷��� (+)��ȣ ǥ��
SELECT DISTINCT(e.deptno),d.deptno FROM emp e, dept d WHERE e.deptno(+) = d.deptno;

����̸��� �ش� ����� ������ �̸����ϱ�(�����ڰ� ���� ����� ǥ��)
SELECT e.ename ����̸�,n.ename �������̸� FROM emp e,emp n
WHERE e.mgr = n.empno(+);

[�ǽ�����]
1)��� ����� �̸�,�μ���ȣ,�μ��̸��� ����Ͻÿ�.(emp,dept)
SELECT e.ename,e.deptno,d.dname From emp e,dept d WHERE e.deptno = d.deptno;
2)������ MANAGER�� ����� ������ �̸�,����,�μ���,�ٹ��� ������ ����Ͻÿ�.(emp,dept)
SELECT e.ename,e.job,d.dname,d.loc FROM emp e,dept d WHERE e.deptno = d.deptno AND e.job IN 'MANAGER';
3)Ŀ�̼��� �ް� �޿��� 1,600 �̻��� ����� �̸�,�޿�,�μ���,�ٹ����� ����Ͻÿ�.(emp,dept)
SELECT e.ename,e.sal,d.dname,d.loc FROM emp e,dept d WHERE e.deptno = d.deptno AND e.sal>=1600 AND e.comm IS NOT NULL;
4)�ٹ����� CHICAGO�� ��� ����� �̸�,����,�μ���ȣ �� �μ��̸��� ����Ͻÿ�.(emp,dept)
SELECT e.ename,e.job,e.deptno,d.dname FROM emp e,dept d WHERE e.deptno = d.deptno AND d.loc IN 'CHICAGO';
5)�ٹ���(loc)���� �ٹ��ϴ� ����� ���� 5�� ������ ���, �ο��� ���� ���� ������ �����Ͻÿ�.(�ٹ� �ο��� 0���� ���� ǥ��)
SELECT d.loc,COUNT(e.empno) emp_member FROM emp e,dept d WHERE e.deptno(+)=d.deptno GROUP BY d.loc HAVING COUNT(e.empno)<=5 ORDER BY emp_member ASC;

- ǥ�� SQL
- ���� ����(Inner Join)
SELECT emp.ename, dept.deptno FROM emp INNER JOIN dept ON emp.deptno = dept.deptno;

SELECT e.ename, d.deptno FROM emp e INNER JOIN dept d ON e.deptno = d.deptno;

�ΰ����� ������ ������ WHERE�� ���
SELECT e.ename, d.deptno FROM emp e INNER JOIN dept d
ON e.deptno = d.deptno WHERE e.ename = 'ALLEN';

���� ���� ���ǿ� ���� �÷��� �̸��� ���ٸ� ������ ���� USING���� ����Ͽ� ���� ������ ������ �� ����
SELECT e.ename, d.dname FROM emp e INNER JOIN dept d USING(deptno);

(����)USING�� ���� �÷��� ���̺�� �Ǵ� ���̺� �˸��ƽ��� ������ ����
SELECT e.ename, deptno FROM emp e INNER JOIN dept d USING(deptno); --USING���� e.deptno�� d.deptno�� �������� ������ �ʿ� x

- Self Join
����̸��� �ش� ����� �������̸� ���ϱ�(�����ڰ� ���� ����� ����)
SELECT e.ename name, m.ename manager_name FROM emp e JOIN emp m ON e.mgr = m.empno;

- Outer Join(�ܺ� ����)
������ ���� ���� ǥ��
����̸��� �ش� ����� �������̸� ���ϱ�(�����ڰ� ���� ����� ǥ��)
SELECT e.ename name, m.ename manager_name FROM emp e LEFT OUTER JOIN emp m ON e.mgr = m.empno;

[�ǽ�����]
6)������ SALESMAN�� ����� ������ �̸�,����,�μ���,�ٹ��� ������ ����Ͻÿ�.(emp,dept)
SELECT e.ename,e.job,d.dname,d.loc FROM emp e INNER JOIN dept d USING(deptno);
7)�ٹ����� DALLAS�� ��� ����� �̸�,����,�μ���ȣ �� �μ��̸��� ����Ͻÿ�.
SELECT e.ename,e.job,deptno,d.dname FROM emp e INNER JOIN dept d USING(deptno);
8)�����ں��� ���� �Ի��� ��� ����� �̸� �� �Ի����� �������� �̸� �� �Ի��ϰ� �Բ� ǥ���ϰ�
�� ���̺��� ���� employee,emp hired,manager,mgr_hired�� �����Ͻÿ�.(�����ڰ� ���� ��� �����)
SELECT e.ename employee,e.hiredate "emp hired", m.ename manager,m.hiredate "mgr hired" FROM emp e JOIN emp m ON e.mgr = m.empno WHERE e.hiredate<m.hiredate;

04-11---------------------------------------------------------------------------
9)10�� �μ����� �ٹ��ϴ� ������� �μ���ȣ,�μ��̸�,����̸�,����,�޿������ ����Ͻÿ�.
SELECT e.deptno,d.dname,e.ename,e.sal,s.grade 
FROM emp e,dept d,salgrade s
WHERE e.deptno=d.deptno AND e.sal BETWEEN s.losal AND s.hisal AND e.deptno=10;

SELECT d.deptno,d.dname,e.ename,e.sal,s.grade
FROM emp e INNER JOIN dept d
ON e.deptno=d.deptno
INNER JOIN salgrade
ON e.sal BETWEEN s.losal AND s.hisal
WHERE e.deptno=10;

- ���տ�����
- UNION (������ �ߺ��� ����) --������ �ߺ�x
UNION�� �� ���̺��� ������ ��Ÿ����, ���ս�Ű�� �� ���̺��� �ߺ����� �ʴ� ������ ��ȯ
SELECT deptno FROM emp
UNION
SELECT deptno FROM dept;

- UNION ALL --������ �ߺ�o
UNION�� ������ �� ���̺��� �ߺ��Ǵ� ������ ��ȯ
SELECT deptno FROM emp
UNION ALL
SELECT deptno FROM dept;

- INTERSECT --������
INTERSECT�� �� ���� ���� �� ����� ���� ��ȯ
SELECT deptno FROM emp
INTERSECT
SELECT deptno FROM dept;

- MINUS --������
MINUS�� ù��° SELECT���� ���� ��ȯ�Ǵ� �� �߿��� �ι�° SELECT���� ����
��ȯ�Ǵ� �࿡ �������� �ʴ� ����� ������
SELECT deptno FROM dept
MINUS
SELECT deptno FROM emp;

- SUBQUERY : �ٸ� �ϳ��� SQL ������ ���� nested(����)�� SELECT ����
- ������ �������� : ���� �� ���� ��(��)�� ��ȯ
SELECT empno,ename,job FROM emp
WHERE job = (SELECT job FROM emp WHERE empno=7369);

SELECT empno,ename,sal FROM emp WHERE sal>(SELECT sal FROM emp WHERE empno=7698);

- ���� �� �������� : �ϳ� �̻��� ���� ��ȯ�ϴ� ��������
IN �������� ���
�μ����� ���� �޿��� ���� �޴� ����� ������ �޿��� �޴� ����� ������ ����Ͻÿ�.
SELECT empno,ename,sal FROM emp
WHERE sal IN (SELECT MIN(sal) FROM emp GROUP BY deptno);

ANY �������� ��� --OR
ANY �����ڴ� ���������� ����� �� ��� �ϳ��� ���̶� ������ �Ǹ� ������� ��ȯ
SELECT sal FROM emp WHERE job = 'SALESMAN';

SELECT ename,sal FROM emp WHERE sal>1250 OR sal>1500 OR sal>1600;
-�� SQL���� �������� �������� �ۼ�
SELECT ename,sal FROM emp
WHERE sal>ANY(SELECT sal FROM emp WHERE job = 'SALESMAN');

- ALL �������� ��� --AND
���������� ����� ��� ���� ��ġ

SELECT sal FROM emp WHERE deptno=20;
SELECT empno,ename,sal,deptno FROM emp
WHERE sal>800 AND sal>2975 AND sal>3000;
- ���� SQL���� ���������� �ۼ�
SELECT empno,ename,sal,deptno FROM emp
WHERE sal>ALL(SELECT sal FROM emp WHERE deptno=20);

- ���߿� ��������
���������� ����� �� �� �̻��� �÷����� ��ȯ�Ǿ� ���� ������ �����ϴ� ����
SELECT empno,ename,sal,deptno FROM emp
WHERE (deptno,sal) IN(SELECT deptno,sal FROM emp WHERE deptno=30);

�μ����� ���� �޿��� ���� �޴� ����� ������ ���
SELECT empno,ename,sal,deptno FROM emp
WHERE (deptno,sal) IN (SELECT deptno,MIN(sal) FROM emp GROUP BY deptno);

SELECT deptno,sal FROM emp WHERE ename='SMITH';

[�ǽ�����]
1)"BLAKE"�� ���� �μ��� �ִ� ������� �̸��� �Ի����� ���ϴµ� "BLAKE"�� �����ϰ� ����Ͻÿ�.
SELECT ename,hiredate FROM emp WHERE ename IN(SELECT ename FROM emp WHERE ename!='BLAKE');
2)��ձ޿����� ���� �޿��� �޴� ������� �����ȣ,�̸�,������ ����ϴµ� ������ ���� ��� ������ ����Ͻÿ�.
SELECT empno,ename,sal FROM emp WHERE sal>(SELECT AVG(sal) FROM emp) ORDER BY sal DESC;
3)10�� �μ����� �޿��� ���� ���� �޴� ����� ������ �޿��� �޴� ����� �̸��� ������ ����Ͻÿ�.
SELECT ename,sal FROM emp WHERE (deptno,sal) IN(SELECT deptno,MIN(sal) FROM emp WHERE deptno IN '10' GROUP BY deptno);
4)�μ��� ������� ���ϰ� ������� 3���� �Ѵ� �μ��� �μ���� ������� ����Ͻÿ�.
[JOIN]
SELECT d.dname,COUNT(e.empno) cnt FROM emp e,dept d 
WHERE e.deptno = d.deptno GROUP BY d.dname HAVING COUNT(e.empno)>3;
[SUBQUERY]
SELECT d.dname,e.cnt FROM dept d,(SELECT deptno,COUNT(empno) cnt FROM emp GROUP BY deptno)e
WHERE d.deptno = e.deptno(+) AND e.cnt>3;
5)�����ȣ�� 7844�� ������� ���� �Ի��� ����� �̸��� �Ի����� ����Ͻÿ�.
SELECT ename,hiredate FROM emp WHERE hiredate<(SELECT hiredate FROM emp WHERE empno IN 7844);
6)���� ���(mgr)�� KING�� ��� ����� �̸��� �޿��� ����Ͻÿ�.
SELECT ename,sal FROM emp WHERE mgr IN(SELECT empno FROM emp WHERE ename IN 'KING');

7)20�� �μ����� ���� �޿��� ���� �޴� ����� ������ �޿��� �޴� ����� �̸�,�μ���,�޿�,�޿������ ����Ͻÿ�.
SELECT e.ename,d.dname,e.sal,s.grade FROM emp e 
INNER JOIN dept d ON e.deptno = d.deptno 
INNER JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal 
WHERE e.sal IN(SELECT MAX(e.sal) FROM emp e);

8)�ѱ޿�(sal+comm)�� ��ձ޿����� ���� �޿��� �޴� ����� �μ���ȣ,�̸�,�ѱ޿�,Ŀ�̼��� ����Ͻÿ�.
(Ŀ�̼��� ��(O),��(X)�� ǥ���ϰ� �÷����� "comm����"�� ���)
SELECT deptno,ename,sal+NVL(comm,0) �ѱ޿�, 
       CASE WHEN comm IS NOT NULL THEN 'O' 
            ELSE 'X'
       END "comm����"
       --NVL2(comm,'O','X') "comm����"
FROM emp
WHERE sal+NVL(comm,0)>(SELECT ROUND(AVG(sal)) FROM emp);

9)CHICAGO �������� �ٹ��ϴ� ����� ��� �޿����� ���� �޿��� �޴� ����� �̸��� �޿�, �������� ����Ͻÿ�.
SELECT e.ename,e.sal,d.loc FROM emp e INNER JOIN dept d ON e.deptno = d.deptno WHERE e.sal>(SELECT ROUND(AVG(e.sal)) FROM emp e,dept d WHERE d.loc IN 'CHICAGO');
10)Ŀ�̼��� ���� ����� �� ������ ���� ���� ����� �޿������ ����Ͻÿ�.
SELECT s.GRADE FROM salgrade s INNER JOIN emp e ON e.sal BETWEEN s.losal AND s.hisal WHERE e.sal IN(SELECT MAX(e.sal) FROM emp e WHERE e.comm IS NULL);
11)ALLEN���� �޿��� ���� �޴� ��� �߿��� �Ի����� ���� ���� ����� ������ ��¥�� �Ի��� ����� �̸��� �Ի���,�޿��� ����Ͻÿ�.
SELECT ename,hiredate,sal FROM emp 
WHERE hiredate IN(SELECT MIN(hiredate) FROM emp WHERE (sal >ALL(SELECT sal FROM emp WHERE ename IN 'ALLEN')));

- INSERT��
���̺� ���� ����

��ü ������ ����(��ü �÷� ���)
INSERT INTO emp (emp,ename,job,mgr,hiredate,sal,comm,deptno)
VALUES (8000,'DENNIS','SALESMAN',7698,'99/01/22',1700,200,30);

��ü �����͸� ������ ���� �÷��� ���� ����
INSERT INTO emp
VALUES (8001,'MARIA','CLERK',7839,'99/02/02',1500,NULL,20);

���� �Էµ��� �ʴ� �÷��� ����
INSERT INTO emp (empno,ename,job,mgr,hiredate,sal,deptno)
VALUES (8002,'PETER','CLERK',7698,'99/03/01',1000,30);

- UPDATE ��
�� ������ �����͸� ����

UPDATE emp SET mgr=7900 WHERE empno=8000;
UPDATE emp SET ename='JOHN',sal=1800,comm=500 WHERE empno=8000;

- DELETE ��
���� ������
DELETE FROM emp WHERE empno=8000;

- �����ͺ��̽� Ʈ�����
Ʈ������� ������ ó���� �� ����
����Ŭ �������� �߻��ϴ� SQL������ �ϳ��� ������ �۾������ν� 
�����ϴ� �Ϸ��� SQL���� Ʈ������̶�� �� �� ����

1)Ʈ������� ����
���� ������ SQL������ ���� ó�� ����� ��

2)Ʈ������� ����
COMMIT�̳� ROLLBACK
DDL �̳� DLC ������ ����(�ڵ� COMMIT)
��� ��� �Ǵ� �ý��� �浹
����ڰ� ���� ����

3)�ڵ� COMMIT�� ������ ��� �߻�
DDL,DCL ������ �Ϸ�� �� 
������� COMMIT�̳� ROLLBACK ���� SQL*PLUS�� ���� �������� ���

4)�ڵ� ROLLBACK�� ������ ��� �߻�
SQL*PLUS�� ������ �������� ���

-commit(������� ����) & rollback(������� ���)�� ����
�������� �ϰ����� ����
�����͸� ���������� �����ϱ� ���� ������ ������ Ȯ���ϰ� ��
���õ� �۾��� �������� �׷�ȭ ��

- ���̺�
���̺��� �⺻���� ������ ���� ����, ���ڵ�� �÷����� ����
���ڵ�(RECORD,ROW) : ���̺��� �����ʹ� �࿡ ����
�÷�(COLUMN) : ���̺��� �� �÷��� �����͸� ������ �� �ִ� �Ӽ��� ǥ��

����Ŭ �����ͺ��̽��� ���̺�
- ����� ���̺�
- ������ ��ųʸ�

������ ��ųʸ�
1)����ڰ� ������ ���̺��� �̸�
SELECT table_name FROM user_tables;
2)����ڰ� ������ ���� ��ü ����
SELECT DISTINCT object_type FROM user_objects;
3)����ڰ� ������ ���̺�,��,���Ǿ� �� ������
SELECT * FROM user_catalog;

- ���̺� ����
���̺� �̸� : ������� ���̺��� �̸�
�� �̸� : ���̺� ���� ������� ���� �̸�
������ Ÿ�� : ������ ���� �ڽ��� ������ Ÿ���� ����
default <ǥ����> : ������ ������ insert ������ ���� ���� �������� 
                  ���� ��쿡 �̿�� ����Ʈ ���� ����
�������� : ������� �� ���� ���������� ���������� ������ �� �ִ�.

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
 constraint suser_pk primary key (id) -- primary key �������� �ο�
);

CREATE TABLE sboard(
 num number,
 id varchar2(30) not null,
 content varchar2(4000) not null,
 constraint sboard_pk primary key (num),--primary key ���� ���� ����
 constraint sboard_fk foreign key (id) references suser (id)--foreign key ���� ���� ����
);

INSERT INTO suser (id,name) VALUES ('blue','�ڹ���');
COMMIT;
SELECT * FROM suser;

INSERT INTO sboard (num,id,content) VALUES (1,'star','�ȳ�');
COMMIT;
DELETE FROM suser WHERE id='star';

SELECT * FROM sboard;

- ���̺� ����

add ������ : ���̺� ���ο� �÷��� �߰�
ALTER TABLE employee ADD(addr VARCHAR2(50));

���� ���� �߰�
ALTER TABLE employee ADD CONSTRAINT employee_pk2 PRIMARY KEY (empno);

modify ������ : ���̺��� �÷��� �����ϰų� not null �÷�����
               ������ �� ����
ALTER TABLE employee MODIFY(salary NUMBER(10,2) NOT NULL); 

drop ������ : �÷��� ����
ALTER TABLE employee DROP COLUMN name;

rename ������ : �÷��� ����
ALTER TABLE employee RENAME COLUMN salary to sal;

���̺�� ����
RENAME employee TO employee2;

���̺��� ����
DROP TABLE employee2;

- on delete cascade
�θ� ���̺��� �÷��� �����ϸ� �ڽ� ���̺��� �ڽ� �����͸� ��� ����

CREATE TABLE s_member(
 id varchar2(20) primary key, --primary key �������� ����
 name varchar2(30)
);
CREATE TABLE s_member_detail(
 num number primary key,
 content varchar2(4000) not null,
 id varchar2(20) not null references s_member (id) on delete cascade
);

[�ǽ�����]
1)student��� �̸����� ���̺� ����
�÷���      id,           name,      age,       score
������Ÿ��  varchar2(10) varchar2(30) number(3)  number(3)
��������   primary key   not null     not null   not null

CREATE TABLE student(
 id varchar2(10) primary key,
 name varchar2(30) not null,
 age number(3) not null,
 score number(3) not null
);

2)������ ���̺� �����͸� �Ʒ��� ���� �Է�
id       name    age   score
dragon   ȫ�浿   21    100
sky      �念��   22    99
blue     �ڹ���   34    88

INSERT INTO student (id,name,age,score) 
VALUES ('dragon','ȫ�浿',21,100);
INSERT INTO student (id,name,age,score)
VALUES ('sky','�念��',22,99);
INSERT INTO student (id,name,age,score)
VALUES ('blue','�ڹ���',34,88);
COMMIT;

3)������ �б� -> student ���̺��� ���� �հ� ���Ͻÿ�.
SELECT SUM(score) FROM student;

- ��(View)
�������� �ϳ� �̻��� ���̺� �ִ� �������� �κ� ����

- ���� ��� ����
1)������ �׼����� �����ϱ� ����
2)������ ���Ǹ� ���� �ۼ��ϱ� ����
3)������ �������� �����ϱ� ����
4)������ �����ͷκ��� �پ��� ����� ��� ����

- View ����
CREATE [OR REPLACE] VIEW ���̸� AS ����;

CREATE OR REPLACE VIEW emp10_view
AS SELECT empno id_number, ename name, sal*12 ann_salary
   FROM emp WHERE deptno=10;

CREATE OR REPLACE VIEW emp_info_view 
AS SELECT e.empno,e.ename,d.deptno,d.loc,d.dname
   FROM emp e, dept d
   WHERE e.deptno=d.deptno;

SELECT * FROM emp_info_view;

- VIEW�� ���� ������ �����ϱ�
�Ϲ������� VIEW�� ��ȸ������ ���� �������� ������ ���浵 ������
UPDATE emp10_view SET name='SCOTT' WHERE id_number=7839;
SELECT * FROM emp10_view;
SELECT * FROM emp; -- VIEW�� �����͸� �����ϸ� ���� ���̺��� ������ �����

INSERT INTO emp10_view (id_number,name,ann_salary)
VALUES (8000,'JOHN',19000);--���� ���� ����� �� ����.���� �߻�

INSERT INTO emp10_view (id_number,name)
VALUES (8000,'JOHN');--���� ���� �����ϸ� ���� ����

SELECT * FROM emp10_view;--10�� �μ��� �������� ������ �ɷ��� ������ ���� �� ����
SELECT * FROM emp;--emp���̺� 1���� �߰��� ���� Ȯ���� �� ����

ROLLBACK;

- WITH READ ONLY (�б� ���� �並 �����ϴ� �ɼ�)
CREATE OR REPLACE VIEW emp20_view AS
SELECT empno id_number, ename name, sal*12 ann_salary
FROM emp WHERE deptno=20
WITH READ ONLY;

UPDATE emp20_view SET name='DAVID' WHERE id_number=7902;
--�б� ���� �信���� DML �۾�(����,����,����)�� ������ �� �����ϴ�.

- view ����
DROP VIEW emp10_view;

- SEQUENCE
������ ���� �������ִ� ����Ŭ ��ü
�������� �����ϸ� �⺻Ű�� ���� ���������� �����ϴ� �÷��� �ڵ�������
������ �� ����

- ������ ����
CREATE SEQUENCE test_seq
start with 1
increment by 1
maxvalue 100000;
���� ���� 1�̰� 1�� �����ϰ�, �ִ밪�� 100000�� �Ǵ� ������ ����

currval : ���� ���� ��ȯ
nextval : ���� ������ ���� ���� ���� ��ȯ

SELECT test_seq.nextval FROM dual;
SELECT test_seq.currval FROM dual;

- ������ ����
ALTER SEQUENCE sequence_name
increment by n
maxvalue n | nomaxvalue
minvalue n | nominvalue
cycle | nocycle

start with�� ������ �� ����

- ������ ����
DROP SEQUENCE test_seq;

- �ε���(index)
�ε����� ���ϴ� ������ ��ġ�� ������,��Ȯ�ϰ�,���������� �˾Ƴ� �� �ִ�
����� ����.
���̺��� �÷��� ���� ���� ������ ������ �� Primary key�� Unique�� 
�����ϸ� Oracle�� �ڵ����� �� �÷��� ���� Unique Index�� ������

- �ε��� �����

1)�ڵ� : ���̺� ���ǿ� Priamry key �Ǵ� Unique ���� ������ �����ϸ�
        ���� �ε����� �ڵ����� ����
2)���� : ����ڰ� ���� �������� ���� �ε����� �����Ͽ� �࿡ ���� �׼���
        �ð��� ���� �� ����

- ������ ���� ������ �÷��� �ε��� ���� : Unique Index
CREATE UNIQUE INDEX dname_idx ON dept (dname);

- ������ ���� ������ �ʴ� �÷��� �ε��� ���� : Non Unique Index
CREATE INDEX emp_ename_idx ON emp (ename);

- ���Ǿ�
���Ǿ�� ��ü�� �ٸ� �̸�. ��ü �׼����� �ܼ�ȭ
- �ٸ� ����ڰ� ������ ���̺��� ���� ����
- �� ��ü �̸� ª�� ����

- ���Ǿ� ����
CREATE SYNONYM emp20 FOR emp20_view;
SELECT * FROM emp20;

- ���Ǿ� ����
DROP SYNONYM emp20;


--pinos71@daum.net
/*
DEPT
-deptno �μ���ȣ
-dname �μ���
-loc �ٹ���

EMP
-empno �����ȣ
-ename �̸�
-job ����
-mgr ����ȣ
-hiredate �ٹ�������
-sal ����
-comm Ŀ�̼�
-deptno �μ���ȣ

SALGRADE
-grade ���
-losal �ּҿ���
-hisal �ִ����
*/