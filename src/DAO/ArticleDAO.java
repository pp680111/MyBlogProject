package DAO;

import model.Article;

import java.util.List;
import java.util.Map;

/**
 * Created by qq578 on 2017/5/13.
 */
public interface ArticleDAO {
    public boolean add(String title,String summary,String content);
    public boolean delete(int id);
    public Article get(int id);
    public boolean modify(int id,String title,String summary,String content);
    public int size();
    public List<Map> get(int start, int size);
    public boolean addReadNum(int id);
    public boolean setArticleTop(int id);
    public Article getArticleTop();
    public List<Map> getRecommendArticles();
}
