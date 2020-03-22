package com.entfrm.core.base.util;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

/**
 * 文件上传工具类
 *
 * @author yangdc
 * @date Apr 18, 2012
 *
 * <pre>
 * </pre>
 */
public class UploadUtil {
    /**
     * 表单字段常量
     */
    public static final String FORM_FIELDS = "form_fields";
    /**
     * 文件域常量
     */
    public static final String FILE_FIELDS = "file_fields";

    // 最大文件大小
    private long maxSize = 10 * 1024 * 1024;
    // 定义允许上传的文件扩展名
    private Map<String, String> extMap = new HashMap<String, String>();
    // 文件保存目录相对路径
    private String basePath = "/upload";
    // 文件的目录名
    private String dirName = "/images";
    // 上传临时路径
    private static final String TEMP_PATH = "/temp";
    private String tempPath = basePath + TEMP_PATH;
    // 若不指定则文件名默认为 yyyyMMddHHmmss_xyz
    private String fileName;

    // 文件保存目录路径
    private String savePath;
    // 文件保存目录url
    private String saveUrl;
    // 文件最终的url包括文件名
    private String fileUrl;

    public UploadUtil() {
        // 其中images,flashs,medias,files,对应文件夹名称,对应dirName
        // key文件夹名称
        // value该文件夹内可以上传文件的后缀名
        extMap.put("images", "gif,jpg,jpeg,png,bmp");
        extMap.put("flashs", "swf,flv");
        extMap.put("medias", "swf,flv,mp3,wav,wma,wmv,mid,avi,mpg,asf,rm,rmvb");
        extMap.put("files", "doc,docx,xls,xlsx,ppt,htm,html,txt,zip,rar,gz,bz2");
    }

    /**
     * 删除指定路径文件
     *
     * @param path
     * @param request
     */
    public void deleteFile(String path, HttpServletRequest request) {
        saveUrl = request.getContextPath() + "/" + basePath + "/";
        File file = new File(saveUrl + path);
        if (file.exists() && file.isFile())
            file.delete();
    }

    /**
     * @param file     //文件对象
     * @param filePath //上传路径
     * @param fileName //文件名
     * @return 文件名
     */
    public static String fileUp(MultipartFile file, String filePath, String fileName) {
        String extName = ""; // 扩展名格式：
        try {
            if (file.getOriginalFilename().lastIndexOf(".") >= 0) {
                extName = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
            }
            copyFile(file.getInputStream(), filePath, fileName + extName).replaceAll("-", "");
        } catch (IOException e) {
            System.out.println(e.getMessage());
        }
        return fileName + extName;
    }

    /**
     * 写文件到当前目录的upload目录中
     *
     * @param in
     * @param
     * @throws IOException
     */
    public static String copyFile(InputStream in, String dir, String realName)
            throws IOException {
        File file = new File(dir, realName);

        if (file.exists()) {
            FileUtil.del(dir + realName);
        }
        if (!file.getParentFile().exists()) {
            file.getParentFile().mkdirs();
        }
        file.createNewFile();

        FileUtil.copyInputStreamToFile(in, file);
        return realName;
    }


    /**
     * *********************get/set方法*********************************
     */

    public String getSavePath() {
        return savePath;
    }

    public String getSaveUrl() {
        return saveUrl;
    }

    public long getMaxSize() {
        return maxSize;
    }

    public void setMaxSize(long maxSize) {
        this.maxSize = maxSize;
    }

    public Map<String, String> getExtMap() {
        return extMap;
    }

    public void setExtMap(Map<String, String> extMap) {
        this.extMap = extMap;
    }

    public String getBasePath() {
        return basePath;
    }

    public void setBasePath(String basePath) {
        this.basePath = basePath;
        tempPath = basePath + TEMP_PATH;
    }

    public String getDirName() {
        return dirName;
    }

    public void setDirName(String dirName) {
        this.dirName = dirName;
    }

    public String getTempPath() {
        return tempPath;
    }

    public void setTempPath(String tempPath) {
        this.tempPath = tempPath;
    }

    public String getFileUrl() {
        return fileUrl;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

}
