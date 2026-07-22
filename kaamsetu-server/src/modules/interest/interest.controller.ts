import { Request, Response } from 'express';
import * as service from './interest.service';
export const createInterest = async (req: Request, res: Response) => { res.json(await service.createInterest(req.body)); };
export const getInterests = async (req: Request, res: Response) => { res.json(await service.getInterests(req.params.jobId)); };
export const acceptInterest = async (req: Request, res: Response) => { res.json(await service.acceptInterest(req.params.id, req.params.jobId)); };