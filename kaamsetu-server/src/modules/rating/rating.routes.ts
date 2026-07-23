import { Router } from 'express';
import * as controller from './rating.controller';
const router = Router();
router.post('/', controller.createRating);
router.get('/:userId', controller.getRatings);
export default router;