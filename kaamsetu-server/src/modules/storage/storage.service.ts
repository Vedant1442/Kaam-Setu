import { S3Client, PutObjectCommand } from "@aws-sdk/client-s3";
import { getSignedUrl } from "@aws-sdk/s3-request-presigner";
import { v4 as uuidv4 } from "uuid";

const s3Client = new S3Client({
  region: process.env.AWS_REGION || "ap-south-1",
  credentials: {
    accessKeyId: process.env.AWS_ACCESS_KEY_ID || "",
    secretAccessKey: process.env.AWS_SECRET_ACCESS_KEY || "",
  },
});

export const storageService = {
  async getPresignedUrl(folder: string, fileName: string, contentType: string) {
    const bucket = process.env.AWS_S3_BUCKET || "kaamsetu-assets";
    // Generate a unique filename to avoid collisions
    const ext = fileName.split(".").pop();
    const uniqueFileName = `${folder}/${uuidv4()}.${ext}`;

    const command = new PutObjectCommand({
      Bucket: bucket,
      Key: uniqueFileName,
      ContentType: contentType,
    });

    const url = await getSignedUrl(s3Client, command, { expiresIn: 3600 });
    
    // The public URL assuming the bucket is public or accessed via CloudFront
    const publicUrl = `https://${bucket}.s3.${process.env.AWS_REGION}.amazonaws.com/${uniqueFileName}`;

    return {
      uploadUrl: url,
      publicUrl,
    };
  },
};
