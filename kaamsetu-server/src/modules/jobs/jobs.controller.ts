import { Request, Response, NextFunction } from 'express';
import * as service from './jobs.service';

export const createJob = async (req: Request, res: Response, next: NextFunction) => {
  try { res.json({ success: true, data: await service.createJob(req.body) }); } catch (e) { next(e); }
};

export const getJobs = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const jobs = await service.getJobs(Number(req.query.lat), Number(req.query.lng), Number(req.query.radius));
    res.json({ success: true, data: jobs });
  } catch (e) {
    next(e);
  }
};

export const getJobById = async (req: Request, res: Response, next: NextFunction) => {
  try { res.json({ success: true, data: await service.getJobById(req.params.id) }); } catch (e) { next(e); }
};

export const deleteJob = async (req: Request, res: Response, next: NextFunction) => {
  try { await service.deleteJob(req.params.id); res.json({ success: true }); } catch (e) { next(e); }
};