package Service;

import java.util.Map;

/**
 * Created by qq578 on 2017/5/13.
 */
public interface ArticleService {
    public Map<String,Object> getArticles(int start, int size);
    public int getArticleListSize();
    public boolean addArticle(String title,String summary,String content);
    public Map getArticle(int id);
    public boolean deleteArticle(int id);
    public boolean modifyArticle(int id,String title,String summary,String content);
    public boolean setArticleTop(int id);
    public Map getArticleTop();
    public Map getRecommendArticles();
}
