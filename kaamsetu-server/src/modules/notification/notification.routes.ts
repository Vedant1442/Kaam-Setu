import { Router } from 'express';
import * as controller from './notification.controller';
const router = Router();
router.get('/:userId', controller.getNotifications);
router.patch('/:id/read', controller.markRead);
export default router;