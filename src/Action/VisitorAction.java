package Action;

import Service.ArticleService;
import Service.MusicPlaylistService;
import Service.PictureService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * Created by qq578 on 2017/5/13.
 */
public class VisitorAction extends ActionSupport {
    private int pageSize;
    private ArticleService articleService;
    private Map<String,Object> resultMap;
    private PictureService pictureService;
    private MusicPlaylistService musicPlaylistService;
    private int picturePageSize;

    public int getPicturePageSize() {
        return picturePageSize;
    }

    public MusicPlaylistService getMusicPlaylistService() {
        return musicPlaylistService;
    }

    public void setMusicPlaylistService(MusicPlaylistService musicPlaylistService) {
        this.musicPlaylistService = musicPlaylistService;
    }

    public void setPicturePageSize(int picturePageSize) {
        this.picturePageSize = picturePageSize;
    }

    public PictureService getPictureService() {
        return pictureService;
    }

    public void setPictureService(PictureService pictureService) {
        this.pictureService = pictureService;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public ArticleService getArticleService() {
        return articleService;
    }

    public void setArticleService(ArticleService articleService) {
        this.articleService = articleService;
    }

    public Map<String, Object> getResultMap() {
        return resultMap;
    }

    public void setResultMap(Map<String, Object> resultMap) {
        this.resultMap = resultMap;
    }

    public String index()
    {
        ActionContext.getContext().put("pageSize",pageSize);
        ActionContext.getContext().put("maxSize",articleService.getArticleListSize());
        return SUCCESS;
    }

    public String articleView()
    {
        return SUCCESS;
    }

    public String getArticles(){
        HttpServletRequest request = ServletActionContext.getRequest();
        int currentIndex = Integer.parseInt(request.getParameter("currentIndex"));
        resultMap = articleService.getArticles(currentIndex,pageSize);
        resultMap.put("size",pageSize);
        return SUCCESS;
    }

    public String getArticle(){
        HttpServletRequest request = ServletActionContext.getRequest();
        int articleId = Integer.parseInt(request.getParameter("articleId"));
        Map article = articleService.getArticle(articleId);
        ActionContext.getContext().put("article",article);
        return SUCCESS;
    }

    public String getRecommendArticles(){
        resultMap = articleService.getRecommendArticles();
        return SUCCESS;
    }

    public String getArticleTop(){
        resultMap = articleService.getArticleTop();
        return SUCCESS;
    }

    public String getPictures(){
        HttpServletRequest request = ServletActionContext.getRequest();
        int currentIndex = Integer.parseInt(request.getParameter("currentIndex"));
        resultMap = pictureService.getPictures(currentIndex,picturePageSize);
        return SUCCESS;
    }

    public String pictureWall(){
        ActionContext.getContext().put("maxSize",pictureService.size());
        return SUCCESS;
    }

    public String musicPage(){
        ActionContext.getContext().put("playlists",musicPlaylistService.getPlaylists());
        return SUCCESS;
    }
}
