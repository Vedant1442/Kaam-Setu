import prisma from '../../config/database';
export const createJob = async (data: any) => prisma.job.create({ data });
export const getJobs = async (lat: number, lng: number, radius: number) => {
  const latDelta = radius / 111;
  const lngDelta = radius / (111 * Math.cos(lat * Math.PI / 180));
  return prisma.job.findMany({ where: { latitude: { gte: lat - latDelta, lte: lat + latDelta }, longitude: { gte: lng - lngDelta, lte: lng + lngDelta }, status: 'OPEN' } });
};
export const getJobById = async (id: string) => prisma.job.findUnique({ where: { id } });
export const deleteJob = async (id: string) => prisma.job.delete({ where: { id } });