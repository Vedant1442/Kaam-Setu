import prisma from '../../config/database';
export const createInterest = async (data: any) => prisma.jobInterest.create({ data });
export const getInterests = async (jobId: string) => prisma.jobInterest.findMany({ where: { jobId } });
export const acceptInterest = async (id: string, jobId: string) => {
  await prisma.jobInterest.updateMany({ where: { jobId }, data: { status: 'REJECTED' } });
  await prisma.jobInterest.update({ where: { id }, data: { status: 'ACCEPTED' } });
  return { success: true };
};