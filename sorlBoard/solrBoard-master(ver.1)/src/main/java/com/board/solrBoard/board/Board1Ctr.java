package com.board.solrBoard.board;

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

@Controller 
public class Board1Ctr {

    private static final Logger logger = LoggerFactory.getLogger(Board1Ctr.class);
    private static final SolrClient solr = new HttpSolrClient.Builder("http://localhost:8983/solr/solrBoard").build();
    
    /**
     * 리스트.
     */
    @RequestMapping(value = "/board1List")
    public String boardList(HttpServletRequest request, ModelMap modelMap) {
        SolrQuery query = new SolrQuery();
        query.setQuery("*:*");
        query.setRows(Integer.MAX_VALUE);
        query.addSort("id", ORDER.desc);
        try {
            QueryResponse rsp = solr.query(query);
            SolrDocumentList docs=rsp.getResults();  
            modelMap.addAttribute("listview", docs);
        } catch (SolrServerException | IOException e) {
            logger.error("list error");
        }
        
        return "board1/boardList";
    }
    
    /** 
     * 글 쓰기. 
     */
    @RequestMapping(value = "/board1Form")
    public String boardForm(HttpServletRequest request, ModelMap modelMap) {
        String brdno = request.getParameter("brdno");
        if (brdno!=null) {
            getOneboard(brdno, modelMap);
        }
        
        return "board1/boardForm";
    }
    
    /**
     * 글 저장.
     */
    @RequestMapping(value = "/board1Save")
    public String boardSave(HttpServletRequest request, BoardVO boardInfo) {
        String brdno = boardInfo.getBrdno();
        if (brdno==null || "".equals(brdno)) {
            boardInfo.setBrdno( getNewBrdno() );
            boardInfo.setBrddate( Now() );
        }
        
        SolrInputDocument solrDoc = new SolrInputDocument();
        solrDoc.addField("NO", boardInfo.getBrdno());
        solrDoc.addField("brddate", boardInfo.getBrddate());
        solrDoc.addField("KR_IPCInformation", boardInfo.getKR_IPCInformation());
        solrDoc.addField("KR_CPCInformation", boardInfo.getKR_CPCInformation());
        solrDoc.addField("KR_OpenNumber", boardInfo.getKR_OpenNumber());
        solrDoc.addField("KR_OpenDate", boardInfo.getKR_OpenDate());
        solrDoc.addField("KR_ApplicationNumber", boardInfo.getKR_ApplicationNumber());
        solrDoc.addField("KR_ApplicationDate", boardInfo.getKR_ApplicationDate());
        solrDoc.addField("KR_ApplicantInformation", boardInfo.getKR_ApplicantInformation());
        solrDoc.addField("KR_Inventor", boardInfo.getKR_Inventor());
        solrDoc.addField("KR_Agent", boardInfo.getKR_Agent());
        solrDoc.addField("invention_title", boardInfo.getInvention_title());
        solrDoc.addField("technical_field", boardInfo.getTechnical_field());
        solrDoc.addField("background_art", boardInfo.getBackground_art());
        solrDoc.addField("claim_text", boardInfo.getClaim_text());
        solrDoc.addField("summary", boardInfo.getSummary());
        
         
        try {
            solr.add(solrDoc);
            solr.commit();
        } catch (SolrServerException | IOException e) {
            logger.error("save error");
        }
        
        return "redirect:/board1List";
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
    @RequestMapping(value = "/board1Read")
    public String boardRead(HttpServletRequest request, ModelMap modelMap) {
        String brdno = request.getParameter("brdno");
        getOneboard(brdno, modelMap);
  
        return "board1/boardRead";
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
    @RequestMapping(value = "/board1Delete")
    public String boardDelete(HttpServletRequest request) {
        String brdno = request.getParameter("brdno");
        
        try {
            solr.deleteByQuery("id:" + brdno);
            solr.commit();
        } catch (SolrServerException | IOException e) {
            logger.error("delete error");
        }
        
        return "redirect:/board1List";
    }

   
}
