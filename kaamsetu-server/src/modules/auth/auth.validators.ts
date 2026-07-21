import { z } from 'zod';

export const sendOtpSchema = z.object({
  body: z.object({
    phone: z.string().regex(/^\+91\d{10}$/, 'Invalid phone number format. Must be +91 followed by 10 digits.'),
  }),
});

export const verifyOtpSchema = z.object({
  body: z.object({
    phone: z.string().regex(/^\+91\d{10}$/, 'Invalid phone number format.'),
    otp: z.string().length(6, 'OTP must be exactly 6 digits.'),
  }),
});

export const refreshSchema = z.object({
  body: z.object({
    refreshToken: z.string().min(1, 'Refresh token is required.'),
  }),
});
