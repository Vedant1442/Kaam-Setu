import { Router } from 'express';
import { AuthController } from './auth.controller';
import { validateRequest } from '../../middleware/validate.middleware';
import { sendOtpSchema, verifyOtpSchema, refreshSchema } from './auth.validators';

const router = Router();

router.post('/send-otp', validateRequest(sendOtpSchema), AuthController.sendOtp);
router.post('/verify-otp', validateRequest(verifyOtpSchema), AuthController.verifyOtp);
router.post('/refresh', validateRequest(refreshSchema), AuthController.refresh);

export default router;
