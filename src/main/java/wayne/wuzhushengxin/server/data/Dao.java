package wayne.wuzhushengxin.server.data;


import org.apache.ibatis.datasource.DataSourceException;
import org.apache.ibatis.session.SqlSession;

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
        catch (DataSourceException ex) {
            //TODO:log
        }
        finally {
            //sqlSession.close();
        }
        return list;
    }

    /**
     *
     * @return
     */
    public Date getCurrentDbTime() {
        Date currentDbDate = null;
        try {
            currentDbDate = sqlSession.selectOne("basicData.selectCurrentDbTime");
        }
        catch (DataSourceException ex) {
            //TODO:log
        }
        finally {
            //sqlSession.close();
        }
        return currentDbDate;
    }
}
