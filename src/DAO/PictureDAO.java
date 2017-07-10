package DAO;

import java.util.List;
import java.util.Map;

/**
 * Created by qq578 on 2017/5/22.
 */
public interface PictureDAO {
    public boolean deletePicture(int id,StringBuffer filename);
    public boolean addPicture(String filename);
    public List<Map<String,String>> getPictures(int start, int size);
    public int size();
}
