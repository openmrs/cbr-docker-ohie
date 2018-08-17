UPDATE scheduler_task_config
SET start_on_startup = true
WHERE
  name IN ('New HIV Case', 'New HIV Treatment', 'HIV Treatment Failure', 'HIV Treatment Stopped', 'HIV Patient Died');

UPDATE scheduler_task_config SET repeat_interval = 8 WHERE name = 'New HIV Case';

UPDATE scheduler_task_config SET repeat_interval = 11 WHERE name = 'New HIV Treatment';

UPDATE scheduler_task_config SET repeat_interval = 14 WHERE name = 'HIV Treatment Failure';

UPDATE scheduler_task_config SET repeat_interval = 17 WHERE name IN = 'HIV Treatment Stopped';

UPDATE scheduler_task_config SET repeat_interval = 20 WHERE name IN = 'HIV Patient Died';