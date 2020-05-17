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

  void setData(int id, int x, int y) {
    JSONObject object = jsonArray.getJSONObject(id);
    object.setInt("x", x);
    object.setInt("y", y);
    jsonArray.setJSONObject(id, object);
  }

  void sendData() {
    String dataString = "data#";
    dataString += jsonArray.toString();
    dataString = dataString.replace("\n","");
    println(dataString);
    serial.write(dataString);
    delay(500);
  }


}
