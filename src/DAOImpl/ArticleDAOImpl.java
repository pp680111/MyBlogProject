package DAOImpl;

import DAO.ArticleDAO;
import model.Article;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by qq578 on 2017/5/13.
 */
public class ArticleDAOImpl implements ArticleDAO{
    private SessionFactory sessionFactory;

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public boolean add(String title, String summary, String content) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        boolean result = false;
        try{
            Article article = new Article();
            article.setTitle(title);
            article.setSummary(summary);
            article.setContent(content);
            article.setCreate_date(new Date(System.currentTimeMillis()));
            article.setUpdate_date(new Date(System.currentTimeMillis()));
            article.setRead_num(0);

            session.save(article);
            tx.commit();
            result = true;
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
    public boolean delete(int id) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        boolean result = false;
        try{
            if(session.createQuery("delete from model.Article as a where a.id=:id").setInteger("id",id).executeUpdate() == 1)
                result = true;

            tx.commit();
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
    public Article get(int id) {
        Session session = sessionFactory.openSession();
        Article article = (Article)session.get(Article.class,id);
        return article;
    }

    @Override
    public boolean modify(int id, String title, String summary, String content) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        boolean result = false;
        try{
            Query query = session.createQuery("update model.Article as a set a.title=:title,a.summary=:summary,a.content=:content,a.update_date=:update_date where a.id=:id")
                            .setString("title",title)
                            .setString("summary",summary)
                            .setString("content",content)
                            .setDate("update_date",new Date(System.currentTimeMillis()))
                            .setInteger("id",id);

            if(query.executeUpdate() > 0)
                result = true;

            tx.commit();
        }
        catch (Exception e)
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
    public int size() {
        Session session = sessionFactory.openSession();
        return ((Long)session.createQuery("select count(*) from model.Article").list().get(0)).intValue();
    }

    @Override
    public List<Map> get(int start, int size) {
        Session session = sessionFactory.openSession();
        List<Map> articles = new ArrayList<Map>();
        List<Article> tmpList = null;
        Map tmpMap = null;
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        try{
            tmpList = session.createQuery("from model.Article order by update_date desc").setFirstResult(start).setMaxResults(size).list();
            for(Article obj : tmpList)
            {
                tmpMap = new HashMap<String,Object>();
                tmpMap.put("id",obj.getId());
                tmpMap.put("title",obj.getTitle());
                tmpMap.put("summary",obj.getSummary());
                tmpMap.put("content",obj.getContent());
                tmpMap.put("time",format.format(obj.getUpdate_date()));
                tmpMap.put("read_num",obj.getRead_num());
                tmpMap.put("reply_num",obj.getReplys().size());
                articles.add(tmpMap);
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        finally {
            session.close();
        }
        return articles;
    }

    @Override
    public boolean addReadNum(int id) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        boolean result = false;
        try{
            Query query = session.createQuery("update model.Article as a set a.read_num=a.read_num+1 where id=:id").setInteger("id",id);
            if(query.executeUpdate() > 0)
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
    public boolean setArticleTop(int id) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        boolean result = false;
        try{
            Query query = session.createQuery("update model.Article set isTop=false");
            query.executeUpdate();
            query = session.createQuery("update model.Article set isTop=true where id=:id").setInteger("id",id);
            if(query.executeUpdate() > 0)
                result = true;

            tx.commit();
        }
        catch (Exception e)
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
    public Article getArticleTop() {
        Session session = sessionFactory.openSession();
        Article article = null;
		List list = session.createQuery("from Article where isTop=true").list();

        if(list.size() == 0)
           article = (Article)session.createQuery("from model.Article").setMaxResults(1).list().get(0);
        else article = (Article)list.get(0);
        return article;
    }

    @Override
    public List getRecommendArticles() {
        Session session = sessionFactory.openSession();
        Random random = new Random();
        int maxId = (Integer)session.createQuery("select max(id) from model.Article").list().get(0);
        Query query = session.createQuery("select id,title,update_date from model.Article where id=:id1 or id=:id2 or id=:id3 or id=:id4 or id=:id5")
                .setInteger("id1",random.nextInt(maxId))
                .setInteger("id2",random.nextInt(maxId))
                .setInteger("id3",random.nextInt(maxId))
                .setInteger("id4",random.nextInt(maxId))
                .setInteger("id5",random.nextInt(maxId));
        List list = query.list();
        return list;
    }
}
