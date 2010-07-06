String[]data;

void setup() {
  fusionTables ft = new fusionTables(208329);

  data = ft.getRow("Year", "1992");
  println(data);

  data = ft.getRow("Year", "1992", "Year, China, Singapore, Japan, Thailand");
  println(data);
}
