import java.util.Map;

class DataHandler { 
  //HashMap<String,Integer> hm = new HashMap<String,Integer>();
  int[][] objectsArray;
  JSONArray jsonArray = new JSONArray();
  
  DataHandler (int objects) {  
    objectsArray = new int[objects][2]; // objects[object][x,y]
    
    for (int i = 0; i < objects; i++) {
      JSONObject object = new JSONObject();
      
      object.setInt("id", i);
      object.setInt("x", 0);
      object.setInt("y", 0);
      
      jsonArray.setJSONObject(i, object);
    }
  }
  
  void sendData() { 
    String dataString = "data#";
    
    //for (int i = 0; i < objectsArray.length; i++) {
    //    dataString += "\"" + str(i) + "\"" + ": [" + objectsArray[i][0] + " , " + objectsArray[i][1] + "]" ;
    //    if(i != objectsArray.length-1){
    //      dataString += ",";
    //    }
    //}
    dataString += jsonArray.toString();
    
    println(dataString);
    serial.write(dataString);
    delay(900);      
  }
  
  
}
