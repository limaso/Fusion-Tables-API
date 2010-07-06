/*
 *  Author: Marc Lipscke
 *  E-Mail: marc@limaso.de
 *  WWW:    http://limaso.de
 *
 *  This library for Processing enables you to use the
 *  Google  Fusion  Tables  service  as  data provider
 *  for  your  visualization  projects  in  Processing
 *
 *  Version: 0.4.2 (06-07-2010; 11:20)
 *
 *  Features:
 *    [access] [feature]
 *  - (public) query for data in rows
 *  - (public) query for data in columns
 *  - (public) get the whole table
 *
 */

class fusionTables {
  
  String baseUrl = "http://tables.googlelabs.com/api/query?sql=";
  int table;
  
  fusionTables(int t) {
    table = t;
  }
  
  String[]getRow(String col, String value) {
    String query = "SELECT * FROM " + table + " WHERE " + col + " = " + value;
    query = p20(query);
    String[]lines = loadStrings(baseUrl + query);
    return split(lines[1], ',');
  }
  
  String[]getRow(String col, String value, String cols) {
    String query = "SELECT " + cols + " FROM " + table + " WHERE " + col + " = " + value;
    query = p20(query);
    String[]lines = loadStrings(baseUrl + query);
    return split(lines[1], ',');
  }
  
  String[]getCol(String cols) {
    String query = "SELECT " + cols + " FROM " + table;
    query = p20(query);
    String[]lines = loadStrings(baseUrl + query);
    String[]output = new String[lines.length - 1];
    for(int i = 1; i < lines.length; i++) {
      output[i - 1] = lines[i];
    }
    return output;
  }
  
  String[]getCol(String cols, String col, String value) {
    String query = "SELECT " + cols + " FROM " + table + " WHERE " + col + " = " + value;
    query = p20(query);
    String[]lines = loadStrings(baseUrl + query);
    String[]output = new String[lines.length - 1];
    for(int i = 1; i < lines.length; i++) {
      output[i - 1] = lines[i];
    }
    return output;
  }
  
  String[][]getTable() {
    String query = "SELECT * FROM " + table;
    query = p20(query);
    String[]lines = loadStrings(baseUrl + query);
    String[]cols = split(lines[0], ',');
    String[][]table = new String[lines.length - 1][cols.length];
    for(int i = 1; i < lines.length; i++) {
      table[i - 1] = split(lines[i], ',');
    }
    return table;
  }
  
  String p20(String url) {
    for(int i = 0; i < url.length(); i++) {
      if(url.charAt(i) == ' ') {
        url = url.substring(0, i) + "%20" + url.substring(i + 1);
      }
    }
    return url;
  }
}
