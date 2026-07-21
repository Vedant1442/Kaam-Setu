import { Response } from 'express';

export const sendSuccess = (res: Response, data: any, meta?: any) => {
  res.status(200).json({
    success: true,
    data,
    meta,
  });
};

export const sendCreated = (res: Response, data: any, meta?: any) => {
  res.status(201).json({
    success: true,
    data,
    meta,
  });
};
