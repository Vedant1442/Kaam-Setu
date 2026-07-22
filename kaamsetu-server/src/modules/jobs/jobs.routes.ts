import { Router } from 'express';
import * as controller from './jobs.controller';
const router = Router();
router.post('/', controller.createJob);
router.get('/', controller.getJobs);
router.get('/:id', controller.getJobById);
router.delete('/:id', controller.deleteJob);
export default router;