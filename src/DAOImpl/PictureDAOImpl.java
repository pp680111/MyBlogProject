package DAOImpl;

import DAO.PictureDAO;
import model.Picture;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by qq578 on 2017/5/22.
 */
public class PictureDAOImpl implements PictureDAO {
    private SessionFactory sessionFactory;

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public boolean deletePicture(int id,StringBuffer filename) {
        boolean result = false;
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        try{
            Picture picture = (Picture)session.get(Picture.class,id);
            filename.append(picture.getFilename());
            session.delete(picture);

            result = true;
            tx.commit();
        }
        catch (Exception e){
            e.printStackTrace();
            result = false;
        }finally {
            session.close();
        }

        return result;
    }

    @Override
    public boolean addPicture(String filename) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        boolean result = false;

        try{
            Picture picture = new Picture();
            picture.setFilename(filename);
            session.save(picture);

            result = true;
            tx.commit();
        }catch (Exception e)
        {
            e.printStackTrace();
            result = false;
        }
        finally {
            session.close();
        }

        return result;
    }

    @Override
    public List<Map<String,String>> getPictures(int start, int size) {
        Session session = sessionFactory.openSession();
        Map<String,String> tmp = null;
        List<Map<String,String>> result = new ArrayList<>();

        Query query = session.createQuery("from model.Picture").setFirstResult(start).setMaxResults(size);
        List<Picture> pictures = query.list();
        for(Picture picture : pictures)
        {
            tmp = new HashMap<String,String>();
            tmp.put("id",String.valueOf(picture.getId()));
            tmp.put("filename",picture.getFilename());
            result.add(tmp);
        }

        session.close();
        return result;
    }

    @Override
    public int size() {
        Session session = sessionFactory.openSession();
        return ((Long)session.createQuery("select count(*) from model.Picture").list().get(0)).intValue();
    }
}
