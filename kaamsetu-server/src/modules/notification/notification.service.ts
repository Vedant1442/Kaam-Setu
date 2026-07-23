import prisma from '../../config/database';
import { messaging } from '../../config/firebase';

export const getNotifications = async (userId: string) => prisma.notification.findMany({ where: { userId }, orderBy: { createdAt: 'desc' } });
export const markRead = async (id: string) => prisma.notification.update({ where: { id }, data: { isRead: true } });

export const sendNotification = async (userId: string, title: string, body: string, data?: any) => {
  // 1. Save to database
  const notification = await prisma.notification.create({
    data: {
      userId,
      title,
      body,
      data: data ? JSON.stringify(data) : undefined,
    },
  });

  // 2. Fetch user's FCM token
  const user = await prisma.user.findUnique({ where: { id: userId }, select: { fcmToken: true } });

  // 3. Send push notification if token exists
  if (user?.fcmToken) {
    try {
      await messaging.send({
        token: user.fcmToken,
        notification: {
          title,
          body,
        },
        data: data ? Object.fromEntries(Object.entries(data).map(([k, v]) => [k, String(v)])) : undefined,
      });
      console.log(`Push notification sent to user ${userId}`);
    } catch (error) {
      console.error(`Failed to send push notification to user ${userId}:`, error);
    }
  }

  return notification;
};