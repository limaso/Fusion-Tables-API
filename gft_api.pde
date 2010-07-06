String[]data;
String[][]table;

void setup() {
  fusionTables ft = new fusionTables(208329);

  // query for a whole row (WHERE Year = 1992)
  data = ft.getRow("Year", "1992");
  println(data);

  // query for a row with defined columns (WHERE Year = 1988)
  data = ft.getRow("Year", "1988", "Year, China, Singapore, Japan, Thailand");
  println(data);
  
  // query to get one column
  data = ft.getCol("Year");
  println(data);
  
  // query to get multiple columns
  data = ft.getCol("Year, China, Norway");
  println(data);
  
  // query to get one column (WHERE Year = 1992)
  data = ft.getCol("China", "Year", "1992");
  println(data);
  
  // query to get multiple columns (WHERE Year = 1988)
  data = ft.getCol("Year, China, Norway", "Year", "1988");
  println(data);
  
  // recive the whole table
  table = ft.getTable();
  println(table[0][0]);  // table[row][col]
}
