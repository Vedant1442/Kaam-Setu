import prisma from '../../config/database';
export const createRating = async (data: any) => prisma.rating.create({ data });
export const getRatings = async (userId: string) => prisma.rating.findMany({ where: { rateeId: userId } });