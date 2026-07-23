import { Request, Response, NextFunction } from 'express';
import { ProfileService } from './profile.service';
import { sendSuccess } from '../../utils/apiResponse';
import { AuthRequest } from '../../middleware/auth.middleware';

export class ProfileController {
  static async getMyProfile(req: AuthRequest, res: Response, next: NextFunction) {
    try {
      const result = await ProfileService.getMyProfile(req.user!.userId);
      sendSuccess(res, result);
    } catch (error) {
      next(error);
    }
  }

  static async updateBasicInfo(req: AuthRequest, res: Response, next: NextFunction) {
    try {
      const result = await ProfileService.updateBasicInfo(req.user!.userId, req.body);
      sendSuccess(res, result);
    } catch (error) {
      next(error);
    }
  }

  static async updateWorkerProfile(req: AuthRequest, res: Response, next: NextFunction) {
    try {
      const result = await ProfileService.updateWorkerProfile(req.user!.userId, req.body);
      sendSuccess(res, result);
    } catch (error) {
      next(error);
    }
  }

  static async updateHouseholdProfile(req: AuthRequest, res: Response, next: NextFunction) {
    try {
      const result = await ProfileService.updateHouseholdProfile(req.user!.userId, req.body);
      sendSuccess(res, result);
    } catch (error) {
      next(error);
    }
  }

  static async updateAvailability(req: AuthRequest, res: Response, next: NextFunction) {
    try {
      const result = await ProfileService.updateAvailability(req.user!.userId, req.body.isAvailable);
      sendSuccess(res, result);
    } catch (error) {
      next(error);
    }
  }

  static async uploadPhoto(req: AuthRequest, res: Response, next: NextFunction) {
    try {
      // In a real app, you would use multer or similar to get the file, 
      // then upload to S3/Cloudinary. We'll just generate a mock name based on timestamp.
      const mockFileName = `photo_${Date.now()}.jpg`;
      const result = await ProfileService.uploadPhoto(req.user!.userId, mockFileName);
      sendSuccess(res, result);
    } catch (error) {
      next(error);
    }
  }
}
