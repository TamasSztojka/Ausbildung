UPDATE qualglobal
SET bezeichnung = 'Second Level Helpdesk'
WHERE qid = '2';

UPDATE qualglobal
SET bezeichnung = 'First Level Helpdesk', kuerzel = 'FLH'
WHERE qid = '3';

SELECT * FROM qualglobal WHERE qid IN (2, 3);