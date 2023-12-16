import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float"
actor DBank {
  stable var currentValue: Float = 300;
  stable var startTime = Time.now();
  // currentValue := 300;
  // startTime := Time.now();
  public func topUp(amount : Float) {
    currentValue += amount;
    Debug.print(debug_show (currentValue));
  };
  public func withdraw(amount : Float) {
    let temp : Float = currentValue -amount;
    if (temp >= 0) {
      currentValue -= amount;
      Debug.print(debug_show (currentValue));
    } else {
      Debug.print("Error amount too large, current value is less than zero.");
    };
  
  };
  public query func checkBalance() : async Float{
    return currentValue;
  };
  public func compound(){
    let currentTime = Time.now();
    let timeElapseNs = currentTime-startTime;
    let timeElapseS = timeElapseNs/1000000000;
    currentValue := currentValue* (1.01 ** Float.fromInt(timeElapseS));
    startTime := currentTime;
  };

};
