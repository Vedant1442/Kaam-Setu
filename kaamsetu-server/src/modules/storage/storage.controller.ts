import { Request, Response } from "express";
import { storageService } from "./storage.service";

export const getUploadUrl = async (req: Request, res: Response) => {
  try {
    const { fileName, contentType, folder = "uploads" } = req.body;
    
    if (!fileName || !contentType) {
      return res.status(400).json({ error: "fileName and contentType are required" });
    }

    const data = await storageService.getPresignedUrl(folder, fileName, contentType);
    res.json(data);
  } catch (error: any) {
    console.error("Storage Error:", error);
    res.status(500).json({ error: "Failed to generate upload URL" });
  }
};
