package Action;

import Service.ArticleService;
import Service.MusicPlaylistService;
import Service.PictureService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by qq578 on 2017/5/13.
 */
public class AdminAction extends ActionSupport{
    //由Spring注入的通过ajax获取数据时一次获取多少的数量
    private int pageSize;
    private int picturePageSize;
    private int playlistPageSize;
    //Service类的依赖注入
    private ArticleService articleService;
    private PictureService pictureService;
    private MusicPlaylistService musicPlaylistService;
    //使用ajax返回json数据时用到的
    private Map<String,Object> resultMap;
    //上传背景图片时用到的临时变量
    private File uploadBGPic;
    //这两个变量是为了处理上传图片，还有保存上传图片的后缀名
    private File uploadPic;
    private String uploadPicFileName;

    public String getUploadPicFileName() {
        return uploadPicFileName;
    }

    public void setUploadPicFileName(String uploadPicFileName) {
        this.uploadPicFileName = uploadPicFileName;
    }

    public File getUploadPic() {
        return uploadPic;
    }

    public void setUploadPic(File uploadPic) {
        this.uploadPic = uploadPic;
    }

    public File getUploadBGPic() {
        return uploadBGPic;
    }

    public void setUploadBGPic(File uploadBGPic) {
        this.uploadBGPic = uploadBGPic;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getPlaylistPageSize() {
        return playlistPageSize;
    }

    public void setPlaylistPageSize(int playlistPageSize) {
        this.playlistPageSize = playlistPageSize;
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

    public PictureService getPictureService() {
        return pictureService;
    }

    public void setPictureService(PictureService pictureService) {
        this.pictureService = pictureService;
    }

    public int getPicturePageSize() {
        return picturePageSize;
    }

    public void setPicturePageSize(int picturePageSize) {
        this.picturePageSize = picturePageSize;
    }

    public MusicPlaylistService getMusicPlaylistService() {
        return musicPlaylistService;
    }

    public void setMusicPlaylistService(MusicPlaylistService musicPlaylistService) {
        this.musicPlaylistService = musicPlaylistService;
    }

    public String index()
    {
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

    public String addArticle(){
        HttpServletRequest request = ServletActionContext.getRequest();
        String title = request.getParameter("title");
        String summary = request.getParameter("summary");
        String content = request.getParameter("content");
        resultMap = new HashMap<String,Object>();

        if(articleService.addArticle(title,summary,content))
            resultMap.put("result","success");
        else resultMap.put("result","error");

        return SUCCESS;
    }

    public String getArticle(){
        HttpServletRequest request = ServletActionContext.getRequest();
        int articleId = Integer.parseInt(request.getParameter("articleId"));
        resultMap = articleService.getArticle(articleId);
        ActionContext.getContext().put("article",resultMap);
        ActionContext.getContext().put("isAdmin",true);
        return SUCCESS;
    }

    public String deleteArticle(){
        resultMap = new HashMap<>();
        HttpServletRequest request = ServletActionContext.getRequest();
        int articleId = Integer.parseInt(request.getParameter("articleId"));
        if(articleService.deleteArticle(articleId))
            resultMap.put("result","success");
        else resultMap.put("result","failed");
        return SUCCESS;
    }

    public String submitModifiedArticle(){
        resultMap = new HashMap<>();
        HttpServletRequest request = ServletActionContext.getRequest();
        int articleId = Integer.parseInt(request.getParameter("articleId"));
        String title = request.getParameter("title");
        String summary = request.getParameter("summary");
        String content = request.getParameter("content");
        if(articleService.modifyArticle(articleId,title,summary,content))
            resultMap.put("result","success");
        else resultMap.put("result","failed");
        return SUCCESS;
    }

    public String setArticleTop(){
        resultMap = new HashMap<>();
        HttpServletRequest request = ServletActionContext.getRequest();
        int articleId = Integer.parseInt(request.getParameter("articleId"));
        if(articleService.setArticleTop(articleId))
            resultMap.put("result","success");
        else resultMap.put("result","failed");
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

    public String deletePicture(){
        HttpServletRequest request = ServletActionContext.getRequest();
        int id = Integer.parseInt(request.getParameter("pictureId"));
        resultMap = new HashMap<>();

        if(pictureService.deletePicture(id))
            resultMap.put("result","success");
        else resultMap.put("result","error");

        return SUCCESS;
    }

    public String uploadPicture(){
        resultMap = new HashMap<>();
        resultMap.put("result",pictureService.addPicture(uploadPic,uploadPicFileName));
        return SUCCESS;
    }

    public String pictureWall(){
        ActionContext.getContext().put("isAdmin",true);
        ActionContext.getContext().put("maxSize",pictureService.size());
        return SUCCESS;
    }

    public String musicPage(){
        ActionContext.getContext().put("isAdmin",true);
        ActionContext.getContext().put("playlists",musicPlaylistService.getPlaylists());
        return SUCCESS;
    }

    public String getMusicPlaylist(){
        HttpServletRequest request = ServletActionContext.getRequest();
        int index = Integer.parseInt(request.getParameter("index"));

        resultMap = new HashMap<>();
        resultMap.put("playlists",musicPlaylistService.getPlaylists(index,playlistPageSize));
        return SUCCESS;
    }

    public String addMusicPlaylist(){
        HttpServletRequest request = ServletActionContext.getRequest();
        resultMap = new HashMap<>();
        String name = request.getParameter("name");
        String url = request.getParameter("url");
        if(musicPlaylistService.addPlaylist(name,url))
            resultMap.put("result","success");
        else resultMap.put("result","error");
        return SUCCESS;
    }

    public String deleteMusicPlaylist(){
        HttpServletRequest request = ServletActionContext.getRequest();
        resultMap = new HashMap<>();
        int id = Integer.parseInt(request.getParameter("id"));
        if(musicPlaylistService.deletePlaylist(id))
            resultMap.put("result","success");
        else resultMap.put("result","error");
        return SUCCESS;
    }

    public String modifyMusicPlaylist(){
        HttpServletRequest request = ServletActionContext.getRequest();
        resultMap = new HashMap<>();
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String url = request.getParameter("url");
        if(musicPlaylistService.modifyPlaylist(id,name,url))
            resultMap.put("result","success");
        else resultMap.put("result","error");
        return SUCCESS;
    }

    public String adminSetup(){
        ActionContext.getContext().put("playlistMaxSize",musicPlaylistService.size());
        ActionContext.getContext().put("playlistPageSize",playlistPageSize);
        return SUCCESS;
    }

    public String setBackgroundPicture(){
        resultMap = new HashMap<>();
        if(pictureService.setBackgroundPicture(uploadBGPic))
            resultMap.put("result","success");
        else resultMap.put("result","error");
        return SUCCESS;
    }
}
