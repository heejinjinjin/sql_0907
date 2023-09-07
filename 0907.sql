-- ��������(Equi Join)
-- ���� ���� ���̺��� ������ �� Ư�� �÷��� ���� ���� ��鸸 �˻��� �� ���

-- ���� ���� �ֹ��� ���� �����͸� ��� ����Ͻÿ�
select * from customer, orders
where customer.custid = orders.custid;

-- ���� ���� �ֹ��� ���� �����͸� ��� ����ȣ ������������ ����Ͻÿ�
select * from customer, orders
where customer.custid = orders.custid
order by customer.custid desc;

-- ���� �̸�, �ֹ��� ������ �ǸŰ����� �˻��Ͻÿ�
select name, saleprice from customer c, orders o
where c.custid = o.custid;

-- ������ �ֹ��� ��� ������ �� �Ǹž��� ���ϰ�, ������ �����Ͻÿ�
select name, sum(saleprice) from customer c, orders o
where c.custid = o.custid
group by name
order by name;

-- ���� �̸��� ���� �ֹ��� ������ �̸��� ���Ͻÿ�
-- 3���� ���̺� ���� ��������
select name, bookname from customer c , orders o, book b
where c.custid = o.custid and o.bookid = b.bookid;

-- ������ 18,000���� ������ �ֹ��� ���� �̸��� ������ �̸��� ���Ͻÿ�
select name, bookname from customer c, orders o, book b
where c.custid = o.custid and o.bookid = b.bookid and price = 18000;

-- �ܺ� ���� (Outer Join)
-- ���������� �ϰ� �Ǹ� ���� �������� ���� ���� ���õ�����
-- �ܺ������� �ϰ� �Ǹ� ������ �Ǵ� ���̺��� ���� �������� ���� ������ �൵ �����ؼ� ������ش�.

-- ������ �������� ���� ���� �����Ͽ� ���̸��� �ֹ��� ������ �ǸŰ����� ����Ͻÿ�.
select name, saleprice 
from customer c left outer join orders o
                on c.custid= o.custid;
                
-- Sub Query(�μ� ����)
-- Main Query ���� �ִ� Query

-- �������� ���� ��� ����
select max(price) from book;
-- �����̸�
select bookname from book;
-- ���������� ���� ��� �����̸��� ����Ͻÿ�
select bookname from book
where price = (select max(price) from book);

-- ���������� ���� �� ������ �̸��� ������ ����Ͻÿ�
select bookname from book
where price = (select min(price) from book);

-- ������ ������ ���� �ִ� ���� �̸��� �˻��Ͻÿ�
select name from customer
where custid in (select distinct custid from orders);

-- ����å���� ������ ����
select name from customer;
select bookid, bookname from book
where book.publisher='����å';
-- ������ ������ ����� ����ȣ
select distinct custid from orders;
-- ����å���� ������ ������ ������ ���� �̸��� ����Ͻÿ�
select name from customer
where custid in (select distinct custid from orders
                where bookid in(select bookid from book
                                where publisher='����å'));

select distinct name from customer c , orders o, book b
where publisher='����å' and b.bookid = o.bookid and c.custid = o.custid;