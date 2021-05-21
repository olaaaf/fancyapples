import UnityEngine

class touch_hat(MonoBehaviour):
   public destroyed as bool = false

   public def OnMouseDown() as void:
      destroyed = true
      transform.GetChild(0).GetComponent[of Animator]().Play("hide")
      GameObject.Find("Map").GetComponent[of map]().score += 1
      GameObject.Find("Score").GetComponent[of UnityEngine.UI.Text]().text = "" + GameObject.Find("Map").GetComponent[of map]().score
