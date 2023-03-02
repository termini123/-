package gu.sworld.solrBoard.board;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.solr.client.solrj.SolrClient;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrQuery.ORDER;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrClient;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocumentList;
import org.apache.solr.common.SolrInputDocument;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import gu.sworld.solrBoard.common.PageVO;

@Controller 
public class Board2Ctr {

    private static final Logger logger = LoggerFactory.getLogger(Board2Ctr.class);
    private static final SolrClient solr = new HttpSolrClient.Builder("http://localhost:8983/solr/solrBoard").build();
    
    /**
     * 리스트.
     */
    @RequestMapping(value = "/board2List")
    public String boardList(PageVO pageVO, ModelMap modelMap) {
        SolrQuery query = new SolrQuery();
        query.setQuery("*:*");
        query.setFields("");
        query.addSort("id", ORDER.desc);
        try {
            // return result count only for paging            
            query.setRows(0);    
            QueryResponse rsp = solr.query(query);
            SolrDocumentList docs=rsp.getResults();  
            int total = (int) docs.getNumFound();
            pageVO.pageCalculate(total);
                    
            // return result data
            query.setStart(pageVO.getRowStart()-1);                            
            query.setRows(10);
            QueryResponse rsp1 = solr.query(query); 
            docs=rsp1.getResults();  
            
            modelMap.addAttribute("listview", docs);
            modelMap.addAttribute("pageVO", pageVO);
        } catch (SolrServerException | IOException e) {
            logger.error("list error");
        }
        
        return "board2/boardList";
    }
    
    /** 
     * 글 쓰기. 
     */
    @RequestMapping(value = "/board2Form")
    public String boardForm(HttpServletRequest request, ModelMap modelMap) {
        String brdno = request.getParameter("brdno");
        if (brdno!=null) {
            getOneboard(brdno, modelMap);
        }
        
        return "board2/boardForm";
    }
    
    /**
     * 글 저장.
     */
    @RequestMapping(value = "/board2Save")
    public String boardSave(HttpServletRequest request, BoardVO boardInfo) {
        String brdno = boardInfo.getBrdno();
        if (brdno==null || "".equals(brdno)) {
            boardInfo.setBrdno( getNewBrdno() );
            boardInfo.setBrddate( Now() );
        }
        
        SolrInputDocument solrDoc = new SolrInputDocument();
        solrDoc.addField("id", boardInfo.getBrdno());
        solrDoc.addField("brdtitle", boardInfo.getBrdtitle());
        solrDoc.addField("brdwriter", boardInfo.getBrdwriter());
        solrDoc.addField("brdmemo", boardInfo.getBrdmemo());
        solrDoc.addField("brddate", boardInfo.getBrddate());
         
        try {
            solr.add(solrDoc);
            solr.commit();
        } catch (SolrServerException | IOException e) {
            logger.error("save error");
        }
        
        return "redirect:/board2List";
    }
    
    public static String Now() {
        SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
        return ft.format(new Date());
    }

    public static String getNewBrdno() {
        SimpleDateFormat ft = new SimpleDateFormat("yyyyMMddhhmmssSSS");
        return ft.format(new Date()) + (int) (Math.random() * 10);
    }
    /**
     * 글 읽기.
     */
    @RequestMapping(value = "/board2Read")
    public String boardRead(HttpServletRequest request, ModelMap modelMap) {
        String brdno = request.getParameter("brdno");
        getOneboard(brdno, modelMap);
  
        return "board2/boardRead";
    }
    
    private void getOneboard(String brdno, ModelMap modelMap) {
        SolrQuery query = new SolrQuery();
        query.setQuery("id:" + brdno);
        query.setRows(1);
        try {
            QueryResponse rsp = solr.query(query);
            SolrDocumentList docs=rsp.getResults();  
            for(int i=0;i<docs.getNumFound();i++){
                System.out.println(docs.get(i));
            }
            modelMap.addAttribute("boardInfo", docs.get(0));
        } catch (SolrServerException | IOException e) {
            logger.error("read error");
        }        
    }    
    /**
     * 글 삭제.
     */
    @RequestMapping(value = "/board2Delete")
    public String boardDelete(HttpServletRequest request) {
        String brdno = request.getParameter("brdno");
        
        try {
            solr.deleteByQuery("id:" + brdno);
            solr.commit();
        } catch (SolrServerException | IOException e) {
            logger.error("delete error");
        }
        
        return "redirect:/board2List";
    }

   
}
