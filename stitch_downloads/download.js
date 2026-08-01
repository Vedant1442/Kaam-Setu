const fs = require('fs');
const https = require('https');

const downloadFile = (url, dest) => {
  return new Promise((resolve, reject) => {
    https.get(url, (response) => {
      if (response.statusCode === 301 || response.statusCode === 302) {
        return downloadFile(response.headers.location, dest).then(resolve).catch(reject);
      }
      if (response.statusCode !== 200) {
        reject(new Error(`Failed to get '${url}' (${response.statusCode})`));
        return;
      }
      const file = fs.createWriteStream(dest);
      response.pipe(file);
      file.on('finish', () => {
        file.close();
        resolve();
      });
      file.on('error', (err) => {
        fs.unlink(dest, () => {});
        reject(err);
      });
    }).on('error', (err) => {
      reject(err);
    });
  });
};

const main = async () => {
  console.log("Downloading Kaam-setu.png...");
  await downloadFile("https://lh3.googleusercontent.com/aida/AP1WRLt3SlVUkSHiYUiy1MtEoCH1hZRRXLrPEhCgYnjSbsSqLoBdJPsUj-keFneT8LvLv2NTIi8iZLEDCuLDm6NEDBttBcDiP1fNSjxul3u4zq3Y1CZKyxc09tF22XzDXlfalSxXzT4x8LBne8G9iSoodD8Hzm6TIzP3J91taSrnEw54PkelW0rcjNFlwJFt8b5JU_Zl7WCv97ewX5DUMswiV7lxgPGNrdGgBoRzDQ-vroqXuMz-rQtpwiCZnXje9KIWjPBRJvCFvXLHDQ", "Kaam-setu.png");

  console.log("Downloading illustration.png...");
  await downloadFile("https://lh3.googleusercontent.com/aida/AP1WRLu5JyNVhzL1mEi0xOgYCAndrDKKltBpCtYZ4DHi__lsMXasUb2dacEqvCprNXd0MAw_DvAwRTnZu7yOBBc1a9NgEgD2kMbPGXzPQYXzQQ6kpXQ-M0F5wkl11zorswAaFTKqK49lw7XERDmI0hTDyShGwcF5JSVkADoS-87DKOTqLZ_3jpBq7G1rxG8Hv9LugiNeyg2IHnZuvwntxeiCo31eXjfo4P9tB8b9WH9kYfnuDdHGoJvu65kfYA", "illustration.png");

  console.log("Downloading login.png...");
  await downloadFile("https://lh3.googleusercontent.com/aida/AP1WRLuyBviw43jxhs4uEXihDTB88X0FcY57Wfne8JZXwPchVGkSwm5bc7CRcObhgtQsV-lxtFntD6XQ7UICOKFAhwW7_Zt7pjxJThwyT7OZwSHjv3UG0Vr93cIBqaPbHpmgiz6VBzAGXSUmVJp_17fMVmubVSQowjoifv04rUcy2qOiBTytpE4LPAHQrQNA5nyArj7tGZ9asUGCW82Utu17tXytmPYQ7_KfvT39pDthEZj4g9fNNb16mmm_z3w", "login.png");

  console.log("Downloading login.html...");
  await downloadFile("https://contribution.usercontent.google.com/download?c=CgthaWRhX2NvZGVmeBJ7Eh1hcHBfY29tcGFuaW9uX2dlbmVyYXRlZF9maWxlcxpaCiVodG1sXzY1MjgwN2NiYTQ2NTQ0OTM4NTVkZDYxYjBlODdmYmFhEgsSBxDBtPLRiB0YAZIBIwoKcHJvamVjdF9pZBIVQhM4MDY4MzQwNzU3NDkyNjc1NjEw&filename=&opi=96797242", "login.html");

  console.log("Downloads complete!");
};

main().catch(console.error);
