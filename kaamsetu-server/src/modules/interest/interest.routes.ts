import { Router } from 'express';
import * as controller from './interest.controller';
const router = Router();
router.post('/', controller.createInterest);
router.get('/:jobId', controller.getInterests);
router.patch('/:jobId/:id', controller.acceptInterest);
export default router;