DELETE FROM qanda;
DROP SEQUENCE qanda_idx_seq;
DROP SEQUENCE qanda_aaa_seq;
DROP SEQUENCE qanda_bbb_seq;
DROP SEQUENCE qanda_ccc_seq;
DROP SEQUENCE qanda_ddd_seq;
DROP SEQUENCE qanda_ss_seq;
CREATE SEQUENCE qanda_ss_seq;
CREATE SEQUENCE qanda_aaa_seq;
CREATE SEQUENCE qanda_11_seq;
CREATE SEQUENCE qanda_bbb_seq;
CREATE SEQUENCE qanda_ccc_seq;
CREATE SEQUENCE qanda_ddd_seq;
CREATE SEQUENCE qanda_admin_seq;


INSERT INTO qanda (idx, NAME, SUBJECT, CONTENT, gup, GUP2, LEV, SEQ, id)
VALUES (qanda_aaa_seq.nextval, '����','3��','3���Դϴ�.',qanda_aaa_seq.currval, 'aaa',0, 0, 'aaa');
INSERT INTO qanda (idx, NAME, SUBJECT, CONTENT, gup, LEV, SEQ, id)
VALUES (qanda_bbb_seq.nextval, '������gg','4��gg','4���Դϴ�gg.',qanda_bbb_seq.currval, 0, 0, 'bbb');
INSERT INTO qanda (idx, NAME, SUBJECT, CONTENT, gup, LEV, SEQ, id)
VALUES (qanda_ccc_seq.nextval, 'ȫ�浿','1��','1���Դϴ�.',qanda_ccc_seq.currval, 0, 0, 'ccc');
INSERT INTO qanda (idx, NAME, SUBJECT, CONTENT, gup, LEV, SEQ, id)
VALUES (qanda_ddd_seq.nextval, '�Ӳ���','2��','2���Դϴ�.',qanda_ddd_seq.currval, 0, 0, 'ddd');


SELECT * FROM qanda ;
