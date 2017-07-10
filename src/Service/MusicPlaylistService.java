package Service;

import model.MusicPlaylist;

import java.util.List;

/**
 * Created by qq578 on 2017/5/24.
 */
public interface MusicPlaylistService {
    public boolean addPlaylist(String name,String url);
    public boolean deletePlaylist(int id);
    public List<MusicPlaylist> getPlaylists();
    public List<MusicPlaylist> getPlaylists(int index,int size);
    public boolean modifyPlaylist(int id,String name,String url);
    public int size();
}
