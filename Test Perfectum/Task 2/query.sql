INSERT INTO messages (message) VALUE ('message out to you');
INSERT INTO dialogs (user_from, user_to, id_message)
VALUES ('id_user', 'id_user', 'id_message');

-- SELECT (id_user) FROM users WHERE id_user=LAST_INSERT_ID()

SELECT *
FROM messages
         JOIN dialogs
              ON messages.id_message = dialogs.id_message
WHERE dialogs.user_from = 'Man 1'
  AND dialogs.user_to = 'Woman 1';

SELECT *
FROM dialogs
         JOIN messages
              ON dialogs.id_message = messages.id_message
WHERE dialogs.user_to = (SELECT id_user FROM users WHERE name = 'Man 1')
-- ORDER BY messages.time
/*UNION
SELECT *
FROM dialogs
         JOIN messages
              ON dialogs.id_message = messages.id_message
WHERE dialogs.user_from = 'Man 1';
-- ORDER BY messages.time
  *
 */

DELETE *
FROM messages
WHERE id_message = (SELECT id_message FROM dialogs WHERE user_from = (SELECT id_user FROM users WHERE name = 'Woman 1'))
