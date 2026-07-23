import { Router } from "express";
import { getUploadUrl } from "./storage.controller";

const router = Router();

router.post("/upload-url", getUploadUrl);

export default router;
