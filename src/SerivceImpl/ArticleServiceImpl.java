package SerivceImpl;

import DAO.ArticleDAO;
import Service.ArticleService;
import model.Article;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by qq578 on 2017/5/13.
 */
public class ArticleServiceImpl implements ArticleService {
    private ArticleDAO articleDAO;

    public ArticleDAO getArticleDAO() {
        return articleDAO;
    }

    public void setArticleDAO(ArticleDAO articleDAO) {
        this.articleDAO = articleDAO;
    }

    @Override
    public Map<String,Object> getArticles(int start, int size) {
        Map<String,Object> result = new HashMap<String,Object>();
        result.put("articleList",articleDAO.get(start,size));
        return result;
    }

    @Override
    public int getArticleListSize() {
        return articleDAO.size();
    }

    @Override
    public boolean addArticle(String title, String summary, String content) {
        if(summary.isEmpty())
        {
            String tmp = content.substring(0,content.length() > 100 ? 100 : content.length()) + "...";
            return articleDAO.add(title,tmp,content);
        }
        else return articleDAO.add(title,summary,content);
    }

    @Override
    public Map getArticle(int id) {
        Map<String,Object> result = new HashMap<String,Object>();
        Article article = articleDAO.get(id);
        articleDAO.addReadNum(id);
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

        result.put("id",id);
        result.put("title",article.getTitle());
        result.put("time",format.format(article.getUpdate_date()));
        result.put("content",article.getContent());
        result.put("read_num",article.getRead_num());
        result.put("reply_num",article.getReplys().size());

        return result;
    }

    @Override
    public boolean deleteArticle(int id) {
        return articleDAO.delete(id);
    }

    @Override
    public boolean modifyArticle(int id, String title, String summary, String content) {
        if(summary.isEmpty())
        {
            String tmp = content.substring(0,content.length() > 100 ? 100 : content.length()) + "...";
            return articleDAO.modify(id,title,tmp,content);
        }
        else return articleDAO.modify(id,title,summary,content);
    }

    @Override
    public boolean setArticleTop(int id) {
        return articleDAO.setArticleTop(id);
    }

    @Override
    public Map getArticleTop() {
        Map<String,Object> result = new HashMap<String,Object>();
        Article article = articleDAO.getArticleTop();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

        result.put("id",article.getId());
        result.put("title",article.getTitle());
        result.put("summary",article.getSummary());
        result.put("time",format.format(article.getUpdate_date()));
        result.put("read_num",article.getRead_num());
        result.put("reply_num",article.getReplys().size());
        return result;
    }

    @Override
    public Map getRecommendArticles() {
        Map result = new HashMap();
        result.put("recommendArticleList",articleDAO.getRecommendArticles());
        return result;
    }
}
