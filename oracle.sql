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
