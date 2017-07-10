package Service;

import java.io.File;
import java.util.Map;

/**
 * Created by qq578 on 2017/5/21.
 */
public interface PictureService {
    public boolean deletePicture(int id);
    public Map getPictures(int start, int size);
    public boolean addPicture(File file,String filename);
    public int size();
    public boolean setBackgroundPicture(File uploadBGPic);
}
