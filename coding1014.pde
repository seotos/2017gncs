PShape korea;
Table cities;
int[] citycnt;
color[] colorstep= {color(255,255,204),color(255,237,160),color(254,217,118),color(254,178,76),
color(253,141,60),color(252,78,42),color(227,26,28),color(189,0,38),color(128,0,38)};
String[] tablecity ={"서울","대전","인천","경기","강원","충북","충남",
"제주","경북","대구","울산","경남","부산","전북","광주","전남","세종"};
PShape[] loc=new PShape[50];
String[] name={"서울특별시","대전광역시","인천광역시","경기도","강원도","충청북도",
"충청남도","제주특별자치도","경상북도","대구광역시","울산광역시","경상남도",
"부산광역시","전라북도","광주광역시","전라남도","세종특별자치시"};
void setup() {
  size(509, 717);  
  cities = loadTable("2013school.csv", "header");
  korea = loadShape("South_Korea.svg");
  for(int i=0;i<name.length;i++)
  loc[i] = korea.getChild(name[i]);
  citycnt = new int[tablecity.length];
  //city cnt
  datacal();
}
void draw() {
  background(255);
  
  shape(korea, 0, 0);
  for(int i=0;i<name.length;i++){
    loc[i].disableStyle();
    fill(colorstep[int(map(citycnt[i],4,75,0,8))]);
    noStroke();
    shape(loc[i], 0, 0); // Wolverines!
  }
  fill(255,0,0);
  textSize(15);
  text("2013 College Count",0,40);
  for(int i=0;i<9;i++){
     fill(colorstep[i]);
     rect((i+1)*20,0,20,20);
  }
  noLoop();
}
void datacal(){
   //   각학교의 시도 정보를 얻어 전체 개수를 구한다. 
  for (int i = 0; i < cities.getRowCount(); i++) {
    String city = cities.getString(i, "시도");
    for(int k=0; k<tablecity.length; k++){
        if(city.equals(tablecity[k])) { citycnt[k]++; break;}
    }
  }
  for(int k=0; k<tablecity.length; k++)
    println(citycnt[k]);
}