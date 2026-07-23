import prisma from '../../config/database';
import { ApiError } from '../../utils/apiError';
import { Role } from '@prisma/client';

export class ProfileService {
  static async getMyProfile(userId: string) {
    const user = await prisma.user.findUnique({
      where: { id: userId },
      include: {
        workerProfile: true,
        householdProfile: true,
      },
    });

    if (!user) throw new ApiError(404, 'NOT_FOUND', 'User not found');
    return user;
  }

  static async updateBasicInfo(userId: string, data: { name?: string; language?: string; role?: Role }) {
    return prisma.user.update({
      where: { id: userId },
      data,
    });
  }

  static async updateWorkerProfile(userId: string, data: { skills: string[]; expectedWage?: number; isAvailable?: boolean }) {
    const user = await prisma.user.findUnique({ where: { id: userId } });
    if (!user || user.role !== 'WORKER') {
      throw new ApiError(403, 'FORBIDDEN', 'User is not a worker');
    }

    return prisma.workerProfile.upsert({
      where: { userId },
      create: {
        userId,
        ...data,
      },
      update: data,
    });
  }

  static async updateHouseholdProfile(userId: string, data: { addressLine: string }) {
    const user = await prisma.user.findUnique({ where: { id: userId } });
    if (!user || user.role !== 'HOUSEHOLD') {
      throw new ApiError(403, 'FORBIDDEN', 'User is not a household');
    }

    return prisma.householdProfile.upsert({
      where: { userId },
      create: {
        userId,
        ...data,
      },
      update: data,
    });
  }

  static async updateAvailability(userId: string, isAvailable: boolean) {
    const user = await prisma.user.findUnique({ where: { id: userId } });
    if (!user || user.role !== 'WORKER') {
      throw new ApiError(403, 'FORBIDDEN', 'Only workers can update availability');
    }

    return prisma.workerProfile.update({
      where: { userId },
      data: { isAvailable },
    });
  }

  static async uploadPhoto(userId: string, filename: string) {
    // Mocking cloud storage upload. Returning a mock URL.
    const mockUrl = `https://mock-storage.kaamsetu.com/photos/${userId}/${filename}`;
    
    return prisma.user.update({
      where: { id: userId },
      data: { profilePhotoUrl: mockUrl },
    });
  }
}
