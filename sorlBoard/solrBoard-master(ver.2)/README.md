# solrBoard

This project is an example web board based on Spring + SolrJ + Solr (Lucene)
to help you learn how to use SolrJ.

Instead of a DBMS like mysql, use Solr (Lucene) to store the data,

I controlled it with SolrJ in Java (Spring).

# Environment #
- Solr 6.6.0, SolrJ 6.6.0 
- Eclipse Neon 2 + STS
- Tomcat 8.5, JDK 1.8

# Install & Run #
Run solr and create core with sqlBoard in CLI.

	> solr start
	> solr crate -c sqlBoard
	> solr restart -p 8983

Download this example (solrBoard) and run it on Tomcat.

Enter the following URL in your web browser:

	Basic Example: http://localhost:8080/solrBoard/board1List
	Paging List: http://localhost:8080/solrBoard/board2List
	Search List: http://localhost:8080/solrBoard/board3List


