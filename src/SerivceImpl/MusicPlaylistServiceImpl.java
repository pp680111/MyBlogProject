package SerivceImpl;

import DAO.MusicPlaylistDAO;
import Service.MusicPlaylistService;
import model.MusicPlaylist;

import java.util.List;

/**
 * Created by qq578 on 2017/5/24.
 */
public class MusicPlaylistServiceImpl implements MusicPlaylistService {
    private MusicPlaylistDAO musicPlaylistDAO;

    public MusicPlaylistDAO getMusicPlaylistDAO() {
        return musicPlaylistDAO;
    }

    public void setMusicPlaylistDAO(MusicPlaylistDAO musicPlaylistDAO) {
        this.musicPlaylistDAO = musicPlaylistDAO;
    }

    @Override
    public boolean addPlaylist(String name, String url) {
        return musicPlaylistDAO.addPlaylist(name,url);
    }

    @Override
    public boolean deletePlaylist(int id) {
        return musicPlaylistDAO.deletePlaylist(id);
    }

    @Override
    public List<MusicPlaylist> getPlaylists() {
        return musicPlaylistDAO.getPlaylists();
    }

    @Override
    public List<MusicPlaylist> getPlaylists(int index, int size) {
        return musicPlaylistDAO.getPlaylists(index,size);
    }

    @Override
    public boolean modifyPlaylist(int id,String name,String url) {
        return musicPlaylistDAO.modifyPlaylist(id,name,url);
    }

    @Override
    public int size() {
        return musicPlaylistDAO.size();
    }
}
