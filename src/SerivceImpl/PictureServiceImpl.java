package SerivceImpl;

import DAO.PictureDAO;
import Service.PictureService;
import org.apache.struts2.ServletActionContext;

import javax.servlet.ServletContext;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by qq578 on 2017/5/21.
 */
public class PictureServiceImpl implements PictureService{
    private PictureDAO pictureDAO;

    public PictureDAO getPictureDAO() {
        return pictureDAO;
    }

    public void setPictureDAO(PictureDAO pictureDAO) {
        this.pictureDAO = pictureDAO;
    }

    @Override
    public boolean deletePicture(int id) {
        StringBuffer filename = new StringBuffer();
        pictureDAO.deletePicture(id,filename);

        ServletContext servletContext = ServletActionContext.getServletContext();
        File file = new File(servletContext.getRealPath("/img/pictureWall/") + filename.toString());
        if(file.exists())
            file.delete();

        return true;
    }

    @Override
    public Map getPictures(int start, int size) {
        Map result = new HashMap();
        result.put("pictureList",pictureDAO.getPictures(start,size));
        result.put("size",((List)result.get("pictureList")).size());
        return result;
    }

    @Override
    public boolean addPicture(File file,String filename) {
        boolean result = false;
        String newFilename;
        //这样获取的是带点的扩展名，如果想要获取不带点的话就在得到的index上+1
        String extend = filename.substring(filename.lastIndexOf('.'));
        ServletContext servletContext = ServletActionContext.getServletContext();
        FileOutputStream out;
        FileInputStream in;
        byte[] buffer = new byte[1024];
        int len = 0;

        //检测文件名是否重复，重复的话就加1
        newFilename = Util.Random.getRandomString();
        File tmpFile = new File(servletContext.getRealPath("/img/pictureWall/") + newFilename + extend);
        while(tmpFile.exists()){
            tmpFile = new File(servletContext.getRealPath("/img/pictureWall/") + newFilename + extend);
        }


        try{
            out = new FileOutputStream(servletContext.getRealPath("/img/pictureWall/") + newFilename + extend);
            in = new FileInputStream(file);
            while((len = in.read(buffer)) > 0){
                out.write(buffer,0,len);
            }

            in.close();
            out.close();
            result = true;

            pictureDAO.addPicture(newFilename + extend);
        }
        catch (Exception e){
            e.printStackTrace();
            result = false;
        }

        return result;
    }

    @Override
    public int size() {
        return pictureDAO.size();
    }

    @Override
    public boolean setBackgroundPicture(File uploadBGPic) {
        ServletContext servletContext = ServletActionContext.getServletContext();
        FileOutputStream out;
        FileInputStream in;
        byte[] buffer = new byte[1024];
        int len = 0;
        boolean result = false;
        try{
            out = new FileOutputStream(servletContext.getRealPath("/img/") + "bg.jpg");
            in = new FileInputStream(uploadBGPic);
            while((len = in.read(buffer)) > 0){
                out.write(buffer,0,len);
            }

            in.close();
            out.close();
            result = true;
        }
        catch (Exception e){
            e.printStackTrace();
            result = false;
        }

        return result;
    }
}
