import redisClient from '../../config/redis';
import prisma from '../../config/database';
import { ApiError } from '../../utils/apiError';
import jwt from 'jsonwebtoken';

export class AuthService {
  static async sendOtp(phone: string) {
    // Generate 6 digit OTP (mocked for now, usually would send via SMS API)
    const otp = '123456'; 
    
    // Store in redis with 5 minute TTL (300 seconds)
    await redisClient.setex(`otp:${phone}`, 300, otp);
    
    // In production, integrate MSG91 or Twilio here
    console.log(`Sent OTP ${otp} to ${phone}`);
    
    return { message: 'OTP sent successfully' };
  }

  static async verifyOtp(phone: string, otp: string) {
    const storedOtp = await redisClient.get(`otp:${phone}`);
    
    if (!storedOtp) {
      throw new ApiError(400, 'OTP_EXPIRED', 'OTP has expired or was not requested.');
    }
    
    if (storedOtp !== otp) {
      throw new ApiError(400, 'OTP_INVALID', 'Invalid OTP.');
    }
    
    // Clear OTP after successful verification
    await redisClient.del(`otp:${phone}`);
    
    // Find or create user
    let user = await prisma.user.findUnique({ where: { phone } });
    let isNewUser = false;
    
    if (!user) {
      user = await prisma.user.create({
        data: { phone },
      });
      isNewUser = true;
    }
    
    // Generate tokens
    const accessToken = jwt.sign(
      { userId: user.id, role: user.role },
      process.env.JWT_SECRET as string,
      { expiresIn: '7d' }
    );
    
    const refreshToken = jwt.sign(
      { userId: user.id },
      process.env.JWT_REFRESH_SECRET as string,
      { expiresIn: '30d' }
    );
    
    return {
      user,
      isNewUser,
      tokens: {
        accessToken,
        refreshToken,
      },
    };
  }

  static async refreshToken(token: string) {
    try {
      const decoded = jwt.verify(token, process.env.JWT_REFRESH_SECRET as string) as any;
      
      const user = await prisma.user.findUnique({ where: { id: decoded.userId } });
      if (!user) {
        throw new ApiError(401, 'USER_NOT_FOUND', 'User does not exist.');
      }
      
      const accessToken = jwt.sign(
        { userId: user.id, role: user.role },
        process.env.JWT_SECRET as string,
        { expiresIn: '7d' }
      );
      
      return { accessToken };
    } catch (e) {
      throw new ApiError(401, 'INVALID_REFRESH_TOKEN', 'Refresh token is invalid or expired.');
    }
  }
}
