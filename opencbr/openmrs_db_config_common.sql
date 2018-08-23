UPDATE scheduler_task_config
SET start_on_startup = true
WHERE
  name IN ('New HIV Case', 'New HIV Treatment', 'HIV Treatment Failure', 'HIV Treatment Stopped', 'HIV Patient Died');

SET @INTERVAL = 15;

UPDATE scheduler_task_config SET repeat_interval = @INTERVAL WHERE name = 'New HIV Case';

UPDATE scheduler_task_config SET repeat_interval = @INTERVAL WHERE name = 'New HIV Treatment';

UPDATE scheduler_task_config SET repeat_interval = @INTERVAL WHERE name = 'HIV Treatment Failure';

UPDATE scheduler_task_config SET repeat_interval = @INTERVAL WHERE name = 'HIV Treatment Stopped';

UPDATE scheduler_task_config SET repeat_interval = @INTERVAL WHERE name = 'HIV Patient Died';