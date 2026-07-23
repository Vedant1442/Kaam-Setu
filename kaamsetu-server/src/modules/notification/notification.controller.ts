import { Request, Response } from 'express';
import * as service from './notification.service';
export const getNotifications = async (req: Request, res: Response) => { res.json(await service.getNotifications(req.params.userId)); };
export const markRead = async (req: Request, res: Response) => { res.json(await service.markRead(req.params.id)); };