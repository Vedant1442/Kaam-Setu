import { z } from 'zod';

export const updateBasicInfoSchema = z.object({
  body: z.object({
    name: z.string().min(2, 'Name must be at least 2 characters').optional(),
    language: z.string().length(2).optional(),
    role: z.enum(['WORKER', 'HOUSEHOLD']).optional(),
  }),
});

export const updateWorkerProfileSchema = z.object({
  body: z.object({
    skills: z.array(z.string()).min(1, 'At least one skill is required'),
    expectedWage: z.number().positive().optional(),
    isAvailable: z.boolean().optional(),
  }),
});

export const updateHouseholdProfileSchema = z.object({
  body: z.object({
    addressLine: z.string().min(5, 'Address must be at least 5 characters'),
  }),
});

export const updateAvailabilitySchema = z.object({
  body: z.object({
    isAvailable: z.boolean(),
  }),
});
