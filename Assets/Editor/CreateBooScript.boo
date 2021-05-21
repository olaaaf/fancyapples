import UnityEditor
import System.IO

class CreateBooScript():
    [MenuItem("Assets/Create/Boo Script")]
    static def create():
        File.Create("Assets/NewBooScript.boo").Dispose();
        AssetDatabase.Refresh();
