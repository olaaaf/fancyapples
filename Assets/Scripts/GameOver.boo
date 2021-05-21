import UnityEngine

public class GameOver(MonoBehaviour):

   private def OnCollisionEnter2D(col as Collision2D):
      GameObject.Find('Explosion').transform.position = Vector2(col.transform.position.x, col.transform.position.y)
      GameObject.Find('Explosion').GetComponent[of SpriteRenderer]().color.a = 1
      GameObject.Find('Explosion').GetComponent[of Animator]().Rebind()
      GameObject.Find('Explosion').GetComponent[of Animator]().Play("explosion")
      if col.transform.GetComponent[of touch_hat]().destroyed == false:
         GameObject.Find("Map").GetComponent[of map]().GameOver()
      Destroy(col.gameObject)
