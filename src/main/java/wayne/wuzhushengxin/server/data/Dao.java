package wayne.wuzhushengxin.server.data;


import org.apache.ibatis.datasource.DataSourceException;
import org.apache.ibatis.session.SqlSession;
import wayne.wuzhushengxin.server.model.entity.CommentEntity;

import java.util.*;

/**
 * Created by jw on 2017/3/26.
 */
public class Dao {
    public void setSqlSession(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }
    private SqlSession sqlSession;

    public <E> List<E> getList(String statement, Date currentTime) {
        List<E> list = new ArrayList<>();
        try {
            Map<String, Date> paramMap = new HashMap<>();
            paramMap.put("current", currentTime);
            list = sqlSession.selectList(statement, paramMap);
        }
        catch (Exception ex) {
            //TODO:log
        }
        finally {
            //sqlSession.close();
        }
        return list;
    }

    public <E> List<E> getList(String statement, int id) {
        List<E> list = new ArrayList<>();
        try {
            Map<String, Integer> paramMap = new HashMap<>();
            paramMap.put("id", id);
            list = sqlSession.selectList(statement, paramMap);
        }
        catch (Exception ex) {
            //TODO:log
        }
        finally {
            //sqlSession.close();
        }
        return list;
    }

    public Date getCurrentDbTime() {
        Date currentDbDate = null;
        try {
            currentDbDate = sqlSession.selectOne("basicData.selectCurrentDbTime");
        }
        catch (Exception ex) {
            //TODO:log
        }
        finally {
            //sqlSession.close();
        }
        return currentDbDate;
    }

    public int getCount(String statement, int id){
        int count = 0;
        try{
            Map<String, Integer> paramMap = new HashMap<>();
            paramMap.put("id", id);
            count = sqlSession.selectOne(statement, id);
        } catch (Exception ex){

        }
        finally {

        }
        return count;
    }

    public void insert(String statement, Object object){
        try{
            sqlSession.insert(statement, object);
        } catch (Exception ex){

        }
        finally {

        }
    }

    public void updateArticleComments(int articleId){
        try {
            sqlSession.update("basicData.updateArticleComments", articleId);
        }
        catch (Exception ex) {
            //TODO:log
        }
        finally {
            //sqlSession.close();
        }
    }

    public void updateArticleViews(int articleId, int views){
        try {
            Map<String, Integer> paramMap = new HashMap<>();
            paramMap.put("id", articleId);
            paramMap.put("views", views);
            sqlSession.update("basicData.updateArticleViews", paramMap);
        }
        catch (Exception ex) {
            //TODO:log
        }
        finally {
            //sqlSession.close();
        }
    }
}
