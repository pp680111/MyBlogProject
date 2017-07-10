package DAOImpl;

import DAO.MusicPlaylistDAO;
import model.MusicPlaylist;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import java.util.List;

/**
 * Created by qq578 on 2017/5/24.
 */
public class MusicPlaylistDAOImpl implements MusicPlaylistDAO{
    private SessionFactory sessionFactory;

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public boolean addPlaylist(String name, String url) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        boolean result = false;

        try{
            MusicPlaylist musicPlaylist = new MusicPlaylist();
            musicPlaylist.setName(name);
            musicPlaylist.setUrl(url);

            session.save(musicPlaylist);
            tx.commit();
            result = true;
        }
        catch (Exception e){
            e.printStackTrace();
            result = false;
        }
        finally {
            session.close();
        }

        return result;
    }

    @Override
    public boolean deletePlaylist(int id) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        boolean result = false;

        try{
            MusicPlaylist musicPlaylist = (MusicPlaylist)session.get(MusicPlaylist.class,id);
            session.delete(musicPlaylist);
            tx.commit();
            result = true;
        }
        catch (Exception e){
            e.printStackTrace();
            result = false;
        }
        finally {
            session.close();
        }

        return result;
    }

    @Override
    public List<MusicPlaylist> getPlaylists() {
        Session session = sessionFactory.openSession();
        List<MusicPlaylist> result = null;
        try{
            result = session.createQuery("from model.MusicPlaylist").list();
        }
        catch (Exception e){
            e.printStackTrace();
        }
        finally {
            session.close();
        }

        return result;
    }

    @Override
    public List<MusicPlaylist> getPlaylists(int index, int size) {
        Session session = sessionFactory.openSession();
        List<MusicPlaylist> result = null;
        try{
            result = session.createQuery("from model.MusicPlaylist").setFirstResult(index).setMaxResults(size).list();
        }
        catch (Exception e){
            e.printStackTrace();
        }
        finally {
            session.close();
        }

        return result;
    }

    @Override
    public boolean modifyPlaylist(int id, String name, String url) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        boolean result = false;

        try{
            MusicPlaylist musicPlaylist = (MusicPlaylist)session.get(MusicPlaylist.class,id);
            musicPlaylist.setName(name);
            musicPlaylist.setUrl(url);
            session.update(musicPlaylist);
            tx.commit();
            result = true;
        }
        catch (Exception e){
            e.printStackTrace();
            result = false;
        }
        finally {
            session.close();
        }

        return result;
    }

    @Override
    public int size() {
        Session session = sessionFactory.openSession();
        return ((Long)session.createQuery("select count(*) from model.MusicPlaylist").list().get(0)).intValue();
    }
}
