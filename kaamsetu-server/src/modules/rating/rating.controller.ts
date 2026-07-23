import { Request, Response } from 'express';
import * as service from './rating.service';
export const createRating = async (req: Request, res: Response) => { res.json(await service.createRating(req.body)); };
export const getRatings = async (req: Request, res: Response) => { res.json(await service.getRatings(req.params.userId)); };