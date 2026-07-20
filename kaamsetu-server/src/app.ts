import express from 'express';
import cors from 'cors';
import helmet from 'helmet';
import { errorMiddleware } from './middleware/error.middleware';
import authRoutes from './modules/auth/auth.routes';
import profileRoutes from './modules/profile/profile.routes';
import jobsRoutes from './modules/jobs/jobs.routes';
import interestRoutes from './modules/interest/interest.routes';
import ratingRoutes from './modules/rating/rating.routes';
import notificationRoutes from './modules/notification/notification.routes';
import storageRoutes from './modules/storage/storage.routes';
const app = express();

app.use(helmet());
app.use(cors());
app.use(express.json());

app.use('/api/auth', authRoutes);
app.use('/api/users', profileRoutes);
app.use('/api/jobs', jobsRoutes);
app.use('/api/interests', interestRoutes);
app.use('/api/ratings', ratingRoutes);
app.use('/api/notifications', notificationRoutes);
app.use('/api/storage', storageRoutes);

app.use(errorMiddleware);

export default app;
