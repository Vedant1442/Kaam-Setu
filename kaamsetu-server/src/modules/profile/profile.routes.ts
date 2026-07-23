import { Router } from 'express';
import { ProfileController } from './profile.controller';
import { validateRequest } from '../../middleware/validate.middleware';
import { authMiddleware } from '../../middleware/auth.middleware';
import {
  updateBasicInfoSchema,
  updateWorkerProfileSchema,
  updateHouseholdProfileSchema,
  updateAvailabilitySchema
} from './profile.validators';

const router = Router();

// All profile routes require authentication
router.use(authMiddleware);

router.get('/me', ProfileController.getMyProfile);

router.put('/me', validateRequest(updateBasicInfoSchema), ProfileController.updateBasicInfo);

router.put('/me/worker-profile', validateRequest(updateWorkerProfileSchema), ProfileController.updateWorkerProfile);

router.put('/me/household-profile', validateRequest(updateHouseholdProfileSchema), ProfileController.updateHouseholdProfile);

router.patch('/me/availability', validateRequest(updateAvailabilitySchema), ProfileController.updateAvailability);

// Note: Not validating body for photo upload since it would typically be a multipart form data
router.post('/me/photo', ProfileController.uploadPhoto);

export default router;
