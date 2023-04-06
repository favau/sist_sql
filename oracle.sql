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
2)emp���̺��� ����̸��� ������ ����ϴµ� �÷����� "�� ��","�� ��"���� �ٲ㼭 ����Ͻÿ�.
3)emp���̺��� �����ȣ,����̸�,����,������ ���ϰ� ���� �÷����� "�����ȣ","����̸�","����","����"���� ����Ͻÿ�.
4)emp���̺��� ������ �ߺ����� �ʰ� ǥ���Ͻÿ�.
5)emp���̺��� ������ ������ ��ǥ(,)�� �����ؼ� ǥ���ϰ� �÷����� Employee and Job���� ǥ���Ͻÿ�.
1)
SELECT EMPNO, ENAME, SAL FROM emp;
2)
SELECT ENAME "�� ��", SAL "�� ��" FROM emp;
3)
SELECT EMPNO "�����ȣ", ENAME "����̸�", SAL "����", COMM "����" FROM emp;
4)
SELECT DISTINCT job FROM emp;
5)
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
2)emp���̺��� ����̸��� SMITH�� ����� �̸��� ����, �μ���ȣ�� ���Ͻÿ�.
3)������ 2500�̻� 3500�̸��� ����� �̸�, �Ի���, ������ ���Ͻÿ�.
4)�޿��� 2000���� 3000���̿� ���Ե��� �ʴ� ����� �̸�, ����, �޿��� ����Ͻÿ�.

1)
SELECT ename,job,sal FROM emp WHERE empno='7698';
2)
SELECT ename,sal,deptno FROM emp WHERE ename='SMITH';
3)
SELECT ename,hiredate,sal FROM emp WHERE sal BETWEEN 2500 AND 3500;
4)
SELECT ename, job, sal FROM emp WHERE sal NOT BETWEEN 2000 AND 3000;